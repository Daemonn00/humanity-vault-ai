// Tests for ReleasePipeline: verifies the fail-fast checklist stops
// immediately at the first failing step (later steps are never
// attempted), and that a fully valid pack succeeds end-to-end,
// including a real dry run against the unmodified RegistryGenerator.
//
// Article files are placed directly under the pack directory (not in
// subfolders) to match registry_generator's PackReader.readArticles,
// which lists non-recursively - the same layout the real official
// packs in this repo actually use.

import 'dart:io';

import 'package:release_pipeline/src/release_pipeline.dart';
import 'package:test/test.dart';

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
category: Survival
verification_level: Verified Source
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

Directory _writePack(
  Directory officialPacksDir,
  String dirName,
  Map<String, String> files,
) {
  final packDir = Directory('${officialPacksDir.path}/$dirName')
    ..createSync(recursive: true);
  for (final entry in files.entries) {
    File('${packDir.path}/${entry.key}').writeAsStringSync(entry.value);
  }
  return packDir;
}

void main() {
  late Directory root;
  late Directory officialPacksDir;

  setUp(() {
    root = Directory.systemTemp.createTempSync('hv_release_pipeline_');
    officialPacksDir = Directory('${root.path}/official_packs')
      ..createSync(recursive: true);
  });

  tearDown(() {
    if (root.existsSync()) root.deleteSync(recursive: true);
  });

  test('a fully valid pack succeeds end-to-end through every step',
      () async {
    final packDir = _writePack(officialPacksDir, 'test_pack', {
      'manifest.md': _validManifest,
      'article_one.md': _validArticle,
    });

    final result =
        await ReleasePipeline.run(packDir, targetVersion: '1.0.0');

    expect(result.succeeded, isTrue);
    expect(result.failure, isNull);
    expect(
      result.steps.map((s) => s.step.name),
      [
        'manifestReadable',
        'versionConsistency',
        'structuralValidation',
        'packaging',
        'zipFilenameConvention',
        'checksum',
        'registryGenerationDryRun',
        'generatedRegistryValidity',
      ],
    );
    expect(result.steps.every((s) => s.passed), isTrue);

    expect(result.expectedTag, 'hv_official_test_pack-v1.0.0');
    expect(result.packagedRelease, isNotNull);
    expect(
      result.packagedRelease!.fileName,
      'hv_official_test_pack-v1.0.0.zip',
    );

    final entry = result.registryEntry!;
    expect(entry.packId, 'hv_official_test_pack');
    expect(entry.version, '1.0.0');
    expect(entry.articleCount, 1);
    expect(entry.sha256, result.packagedRelease!.sha256);
    expect(entry.sizeBytes, result.packagedRelease!.sizeBytes);
    expect(entry.verificationSummary, 'Verified Source');
  });

  test('a missing manifest.md fails immediately at manifestReadable, '
      'with no later steps attempted', () async {
    final packDir = _writePack(officialPacksDir, 'test_pack', {
      'article_one.md': _validArticle,
    });

    final result =
        await ReleasePipeline.run(packDir, targetVersion: '1.0.0');

    expect(result.succeeded, isFalse);
    expect(result.steps, hasLength(1));
    expect(result.steps.single.step.name, 'manifestReadable');
    expect(result.steps.single.passed, isFalse);
    expect(result.packagedRelease, isNull);
    expect(result.registryEntry, isNull);
  });

  test('a manifest missing a required field fails at manifestReadable',
      () async {
    const brokenManifest = '''
---
pack_id: hv_official_test_pack
pack_version: 1.0.0
---
''';
    final packDir = _writePack(officialPacksDir, 'test_pack', {
      'manifest.md': brokenManifest,
      'article_one.md': _validArticle,
    });

    final result =
        await ReleasePipeline.run(packDir, targetVersion: '1.0.0');

    expect(result.succeeded, isFalse);
    expect(result.failure!.step.name, 'manifestReadable');
  });

  test('a malformed target version fails at versionConsistency before '
      'packaging is ever attempted', () async {
    final packDir = _writePack(officialPacksDir, 'test_pack', {
      'manifest.md': _validManifest,
      'article_one.md': _validArticle,
    });

    final result =
        await ReleasePipeline.run(packDir, targetVersion: 'v1.0');

    expect(result.succeeded, isFalse);
    expect(
      result.steps.map((s) => s.step.name),
      ['manifestReadable', 'versionConsistency'],
    );
    expect(result.failure!.passed, isFalse);
  });

  test('a manifest/target version mismatch fails at versionConsistency',
      () async {
    final packDir = _writePack(officialPacksDir, 'test_pack', {
      'manifest.md': _validManifest, // pack_version: 1.0.0
      'article_one.md': _validArticle,
    });

    final result =
        await ReleasePipeline.run(packDir, targetVersion: '1.0.1');

    expect(result.succeeded, isFalse);
    expect(result.failure!.step.name, 'versionConsistency');
    expect(result.failure!.detail, contains('does not match'));
  });

  test('a non-hv_official_ pack_id fails at versionConsistency', () async {
    const manifest = '''
---
pack_id: community_test_pack
pack_name: Test Pack
pack_version: 1.0.0
---
''';
    final packDir = _writePack(officialPacksDir, 'test_pack', {
      'manifest.md': manifest,
      'article_one.md': _validArticle,
    });

    final result =
        await ReleasePipeline.run(packDir, targetVersion: '1.0.0');

    expect(result.succeeded, isFalse);
    expect(result.failure!.step.name, 'versionConsistency');
    expect(result.failure!.detail, contains('hv_official_'));
  });

  test('a core-corpus slug collision fails at structuralValidation, '
      'after versionConsistency passes but before packaging', () async {
    final packDir = _writePack(officialPacksDir, 'test_pack', {
      'manifest.md': _validManifest,
      'water_purification.md': _validArticle, // a real core corpus slug
    });

    final result =
        await ReleasePipeline.run(packDir, targetVersion: '1.0.0');

    expect(result.succeeded, isFalse);
    expect(
      result.steps.map((s) => s.step.name),
      ['manifestReadable', 'versionConsistency', 'structuralValidation'],
    );
    expect(result.failure!.detail, contains('core corpus'));
  });

  test('zero valid articles fails at structuralValidation', () async {
    const invalidCategoryArticle = '''
---
title: Bad Article
category: Not A Real Category
---
## Summary
Text.
''';
    final packDir = _writePack(officialPacksDir, 'test_pack', {
      'manifest.md': _validManifest,
      'article_one.md': invalidCategoryArticle,
    });

    final result =
        await ReleasePipeline.run(packDir, targetVersion: '1.0.0');

    expect(result.succeeded, isFalse);
    expect(result.failure!.step.name, 'structuralValidation');
    expect(result.failure!.detail, contains('no valid articles'));
  });

  test('an invalid verification_level fails at structuralValidation',
      () async {
    const article = '''
---
title: Bad Article
category: Survival
verification_level: Extremely Verified
---
## Summary
Text.
''';
    final packDir = _writePack(officialPacksDir, 'test_pack', {
      'manifest.md': _validManifest,
      'article_one.md': article,
    });

    final result =
        await ReleasePipeline.run(packDir, targetVersion: '1.0.0');

    expect(result.succeeded, isFalse);
    expect(result.failure!.step.name, 'structuralValidation');
  });

  test('a pack with multiple valid articles reports the correct article '
      'count throughout, matching the packaged/registry cross-check',
      () async {
    final packDir = _writePack(officialPacksDir, 'test_pack', {
      'manifest.md': _validManifest,
      'article_one.md': _validArticle,
      'article_two.md': _validArticle.replaceFirst(
        'title: Test Article',
        'title: Second Article',
      ),
    });

    final result =
        await ReleasePipeline.run(packDir, targetVersion: '1.0.0');

    expect(result.succeeded, isTrue);
    expect(result.registryEntry!.articleCount, 2);
  });
}
