import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:crypto/crypto.dart';
import 'package:registry_generator/src/models.dart';
import 'package:registry_generator/src/registry_generator.dart';
import 'package:registry_generator/src/release_source.dart';
import 'package:test/test.dart';

/// An in-memory ReleaseSource for tests - never makes a real network
/// call, so these tests are fast and deterministic.
class FakeReleaseSource implements ReleaseSource {
  final Map<String, ReleaseInfo> _releases = {};
  final Map<String, List<int>> _assets = {};
  ReleaseLookupException? throwOnFindRelease;

  void addRelease({
    required String packId,
    required String version,
    required List<int> zipBytes,
    String? body,
  }) {
    final url = 'https://example.test/$packId-v$version.zip';
    _releases['$packId@$version'] = ReleaseInfo(
      tagName: '$packId-v$version',
      version: version,
      publishedAt: DateTime.utc(2026, 7, 10),
      body: body ?? 'Release notes for $version.',
      assets: [ReleaseAsset(name: '$packId-v$version.zip', downloadUrl: url)],
    );
    _assets[url] = zipBytes;
  }

  @override
  Future<ReleaseInfo?> findRelease(
    String packId,
    String expectedVersion,
  ) async {
    if (throwOnFindRelease != null) throw throwOnFindRelease!;
    return _releases['$packId@$expectedVersion'];
  }

  @override
  Future<List<int>> downloadAsset(ReleaseAsset asset) async {
    final bytes = _assets[asset.downloadUrl];
    if (bytes == null) {
      throw StateError('no fake bytes registered for ${asset.downloadUrl}');
    }
    return bytes;
  }
}

/// Builds an in-memory ZIP archive from a map of relative path -> text
/// content, mirroring the shape of a real pack ZIP (manifest.md at
/// root, article files alongside it).
List<int> buildZip(Map<String, String> files) {
  final archive = Archive();
  files.forEach((name, content) {
    final bytes = utf8.encode(content);
    archive.addFile(ArchiveFile(name, bytes.length, bytes));
  });
  final encoded = ZipEncoder().encode(archive);
  if (encoded == null) {
    throw StateError('failed to build test ZIP fixture');
  }
  return encoded;
}

const _validManifest = '''
---
pack_id: hv_official_test_pack
pack_name: Test Pack
pack_version: 1.0.0
description: A test pack.
---
''';

const _validArticle = '''
---
title: Test Article
category: Communication
verification_level: Verified Source
terrain: desert, coastal
---
## Summary
A summary.
## Main Content
Content.
## Benefits
- One
## Sources
- A source
''';

/// Creates a real pack directory on disk (as the generator scans real
/// directories, not in-memory structures) with the given files.
Future<Directory> writePackDir(
  Directory officialPacksDir,
  String dirName,
  Map<String, String> files,
) async {
  final packDir = Directory('${officialPacksDir.path}/$dirName')
    ..createSync(recursive: true);
  for (final entry in files.entries) {
    File('${packDir.path}/${entry.key}').writeAsStringSync(entry.value);
  }
  return packDir;
}

void main() {
  late Directory tempRoot;
  late Directory officialPacksDir;

  setUp(() {
    tempRoot = Directory.systemTemp.createTempSync('registry_gen_test_');
    officialPacksDir = Directory('${tempRoot.path}/official_packs')
      ..createSync(recursive: true);
  });

  tearDown(() {
    tempRoot.deleteSync(recursive: true);
  });

  test('a pack with no matching release is skipped silently - not in '
      'the registry, no error, just counted', () async {
    await writePackDir(officialPacksDir, 'test_pack', {
      'manifest.md': _validManifest,
      'article_one.md': _validArticle,
    });

    final generator = RegistryGenerator(releaseSource: FakeReleaseSource());
    final output = await generator.generate(officialPacksDir);

    expect(output.packs, isEmpty);
    expect(generator.outcomes.single.status, PackOutcomeStatus.noRelease);
  });

  test('a released, valid pack is included with correct metadata, '
      'checksum, and size', () async {
    await writePackDir(officialPacksDir, 'test_pack', {
      'manifest.md': _validManifest,
      'article_one.md': _validArticle,
    });

    final zipBytes = buildZip({
      'manifest.md': _validManifest,
      'article_one.md': _validArticle,
    });
    final fakeSource = FakeReleaseSource()
      ..addRelease(
        packId: 'hv_official_test_pack',
        version: '1.0.0',
        zipBytes: zipBytes,
        body: 'v1.0.0 changelog',
      );

    final generator = RegistryGenerator(releaseSource: fakeSource);
    final output = await generator.generate(officialPacksDir);

    expect(output.packs, hasLength(1));
    final entry = output.packs.single;
    expect(entry.packId, 'hv_official_test_pack');
    expect(entry.packName, 'Test Pack');
    expect(entry.description, 'A test pack.');
    expect(entry.categoryTags, ['Communication']);
    expect(entry.trustTier, 'official');
    expect(entry.verificationSummary, 'Verified Source');
    expect(entry.latestVersion, '1.0.0');
    expect(entry.version, '1.0.0');
    expect(entry.changelogSummary, 'v1.0.0 changelog');
    expect(entry.articleCount, 1);
    expect(entry.sizeBytes, zipBytes.length);
    expect(entry.sha256, sha256.convert(zipBytes).toString());
    expect(generator.outcomes.single.status, PackOutcomeStatus.included);
  });

  test('REVIEW_NOTES.md is never read - its content has zero effect on '
      'the outcome, even when deliberately misleading', () async {
    await writePackDir(officialPacksDir, 'test_pack', {
      'manifest.md': _validManifest,
      'article_one.md': _validArticle,
      'REVIEW_NOTES.md': '''
# THIS IS A LIE
verification_level: Verified Source is FALSE for every article.
This pack must NEVER be published under any circumstances.
{{{ malformed content that would break a naive parser ]]] ---
''',
    });

    final zipBytes = buildZip({
      'manifest.md': _validManifest,
      'article_one.md': _validArticle,
    });
    final fakeSource = FakeReleaseSource()
      ..addRelease(
        packId: 'hv_official_test_pack',
        version: '1.0.0',
        zipBytes: zipBytes,
      );

    final generator = RegistryGenerator(releaseSource: fakeSource);
    final output = await generator.generate(officialPacksDir);

    // The pack is still included, exactly as it would be without
    // REVIEW_NOTES.md present at all - proving the file was never
    // consulted, despite its content trying to say otherwise.
    expect(output.packs, hasLength(1));
    expect(output.packs.single.verificationSummary, 'Verified Source');
  });

  test('a released pack that fails validation is excluded and logged as '
      'an error, not silently', () async {
    const invalidManifest = '''
---
pack_id: community_not_official
pack_name: Bad Pack
pack_version: 1.0.0
---
''';
    await writePackDir(officialPacksDir, 'bad_pack', {
      'manifest.md': invalidManifest,
      'article_one.md': _validArticle,
    });

    final zipBytes = buildZip({
      'manifest.md': invalidManifest,
      'article_one.md': _validArticle,
    });
    final fakeSource = FakeReleaseSource()
      ..addRelease(
        packId: 'community_not_official',
        version: '1.0.0',
        zipBytes: zipBytes,
      );

    final generator = RegistryGenerator(releaseSource: fakeSource);
    final output = await generator.generate(officialPacksDir);

    expect(output.packs, isEmpty);
    final outcome = generator.outcomes.single;
    expect(outcome.status, PackOutcomeStatus.validationFailed);
    expect(outcome.detail, contains('hv_official_'));
  });

  test('a release lookup failure is logged distinctly from "no release" '
      'and the pack is excluded', () async {
    await writePackDir(officialPacksDir, 'test_pack', {
      'manifest.md': _validManifest,
      'article_one.md': _validArticle,
    });

    final fakeSource = FakeReleaseSource()
      ..throwOnFindRelease = ReleaseLookupException('network timeout');

    final generator = RegistryGenerator(releaseSource: fakeSource);
    final output = await generator.generate(officialPacksDir);

    expect(output.packs, isEmpty);
    final outcome = generator.outcomes.single;
    expect(outcome.status, PackOutcomeStatus.releaseLookupFailed);
    expect(outcome.detail, contains('network timeout'));
  });

  test('a mismatch between the manifest pack_id and the release ZIP\'s '
      'own internal manifest.md pack_id excludes the pack', () async {
    await writePackDir(officialPacksDir, 'test_pack', {
      'manifest.md': _validManifest,
      'article_one.md': _validArticle,
    });

    // The ZIP's internal manifest.md claims a different pack_id than
    // the one the release was looked up under.
    const tamperedManifest = '''
---
pack_id: hv_official_something_else
pack_name: Test Pack
pack_version: 1.0.0
---
''';
    final zipBytes = buildZip({
      'manifest.md': tamperedManifest,
      'article_one.md': _validArticle,
    });
    final fakeSource = FakeReleaseSource()
      ..addRelease(
        packId: 'hv_official_test_pack',
        version: '1.0.0',
        zipBytes: zipBytes,
      );

    final generator = RegistryGenerator(releaseSource: fakeSource);
    final output = await generator.generate(officialPacksDir);

    expect(output.packs, isEmpty);
    final outcome = generator.outcomes.single;
    expect(outcome.status, PackOutcomeStatus.validationFailed);
    expect(outcome.detail, contains('does not match expected'));
  });

  test('multiple packs: only the released and valid ones appear, others '
      'are excluded independently', () async {
    await writePackDir(officialPacksDir, 'pack_a', {
      'manifest.md': _validManifest,
      'article_one.md': _validArticle,
    });
    const secondManifest = '''
---
pack_id: hv_official_second_pack
pack_name: Second Pack
pack_version: 2.0.0
---
''';
    await writePackDir(officialPacksDir, 'pack_b', {
      'manifest.md': secondManifest,
      'article_one.md': _validArticle,
    });
    // A third pack with no release at all.
    await writePackDir(officialPacksDir, 'pack_c', {
      'manifest.md': '''
---
pack_id: hv_official_third_pack
pack_name: Third Pack
pack_version: 1.0.0
---
''',
      'article_one.md': _validArticle,
    });

    final zipA = buildZip({
      'manifest.md': _validManifest,
      'article_one.md': _validArticle,
    });
    final zipB = buildZip({
      'manifest.md': secondManifest,
      'article_one.md': _validArticle,
    });
    final fakeSource = FakeReleaseSource()
      ..addRelease(
        packId: 'hv_official_test_pack',
        version: '1.0.0',
        zipBytes: zipA,
      )
      ..addRelease(
        packId: 'hv_official_second_pack',
        version: '2.0.0',
        zipBytes: zipB,
      );

    final generator = RegistryGenerator(releaseSource: fakeSource);
    final output = await generator.generate(officialPacksDir);

    expect(output.packs.map((p) => p.packId).toSet(), {
      'hv_official_test_pack',
      'hv_official_second_pack',
    });
    expect(
      generator.outcomes
          .firstWhere((o) => o.packDirName == 'pack_c')
          .status,
      PackOutcomeStatus.noRelease,
    );
  });

  test('an empty official_packs directory produces an empty, valid '
      'registry', () async {
    final generator = RegistryGenerator(releaseSource: FakeReleaseSource());
    final output = await generator.generate(officialPacksDir);

    expect(output.packs, isEmpty);
    final json = output.toJson();
    expect(json['pack_count'], 0);
    expect(json['registry_schema_version'], isNotEmpty);
  });

  test('a nonexistent official_packs directory produces an empty '
      'registry rather than throwing', () async {
    final missing = Directory('${tempRoot.path}/does_not_exist');
    final generator = RegistryGenerator(releaseSource: FakeReleaseSource());
    final output = await generator.generate(missing);

    expect(output.packs, isEmpty);
  });
}
