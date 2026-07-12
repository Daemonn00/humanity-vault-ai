// Widget tests for PackDetailScreen: verifies the approved five-state
// pack lifecycle end-to-end - Available -> Downloading -> Verifying ->
// Installing -> Installed - including that a checksum mismatch or a
// download failure reverts to Available with an error and never
// reaches PackImporter, and that an already-installed pack is detected
// on load without requiring a tap.
//
// The install flow performs real disk I/O (writing the downloaded ZIP,
// then PackImporter's own extraction and staging-to-permanent move),
// which - like PackLibraryScreen's tests - does not complete under
// flutter_test's default fake-async pump loop. Every point that
// triggers real I/O is run inside `tester.runAsync(...)`, with the
// triggering tap itself inside the same block, per the same pattern
// already established in pack_library_screen_test.dart.

import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/library/data/articles_repository.dart';
import 'package:humanity_vault_app/features/vault_hub/data/http_fetcher.dart';
import 'package:humanity_vault_app/features/vault_hub/presentation/pack_detail_screen.dart';
import 'package:humanity_vault_app/features/vault_hub/models/registry_pack_entry.dart';

class _FakeHttpFetcher implements HttpFetcher {
  _FakeHttpFetcher({this.statusCode = 200, this.bodyBytes = const []});

  final int statusCode;
  final List<int> bodyBytes;

  @override
  Future<HttpFetchResult> get(Uri url) async {
    return HttpFetchResult(statusCode: statusCode, bodyBytes: bodyBytes);
  }
}

const _packManifest = '''
---
pack_id: hv_official_test_pack
pack_name: Test Pack
pack_version: 1.0.0
description: A test pack.
---
''';

const _packArticle = '''
---
title: Test Article
category: Survival
---
## Summary
A summary.

## Main Content
Content.
''';

List<int> _buildZipBytes(Map<String, String> filesByPath) {
  final archive = Archive();
  filesByPath.forEach((path, content) {
    final bytes = utf8.encode(content);
    archive.addFile(ArchiveFile(path, bytes.length, bytes));
  });
  return ZipEncoder().encode(archive)!;
}

final _validZipBytes = _buildZipBytes({
  'manifest.md': _packManifest,
  'survival/test_article.md': _packArticle,
});
final _validZipSha256 = sha256.convert(_validZipBytes).toString();

RegistryPackEntry _pack({String sha256Override = ''}) {
  return RegistryPackEntry(
    packId: 'hv_official_test_pack',
    packName: 'Test Pack',
    description: 'A test pack description.',
    categoryTags: const ['Survival'],
    verificationSummary: 'Verified Source',
    version: '1.0.0',
    changelogSummary: 'Initial release notes.',
    downloadUrl: 'https://example.test/hv_official_test_pack-v1.0.0.zip',
    sha256: sha256Override.isEmpty ? _validZipSha256 : sha256Override,
    sizeBytes: _validZipBytes.length,
    articleCount: 1,
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await ArticlesRepository.ensureLoaded();
  });

  late Directory workDir;
  late Directory packsDir;
  late Directory stagingDir;
  late File downloadFile;

  setUp(() {
    workDir = Directory.systemTemp.createTempSync('hv_detail_');
    packsDir = Directory('${workDir.path}/packs');
    stagingDir = Directory('${workDir.path}/staging');
    downloadFile = File('${workDir.path}/download_target.zip');
  });

  tearDown(() {
    if (workDir.existsSync()) workDir.deleteSync(recursive: true);
  });

  Future<void> pumpDetail(
    WidgetTester tester, {
    required RegistryPackEntry pack,
    required HttpFetcher fetcher,
  }) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(MaterialApp(
        home: PackDetailScreen(
          pack: pack,
          httpFetcher: fetcher,
          downloadFileOverride: downloadFile,
          stagingDirectoryOverride: stagingDir,
          packsDirectoryOverride: packsDir,
        ),
      ));
      await Future<void>.delayed(const Duration(milliseconds: 200));
    });
    await tester.pump();
  }

  Future<void> tapInstallAndAwait(WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.tap(find.widgetWithText(FilledButton, 'Install'));
      for (var i = 0; i < 6; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 200));
      }
    });
    await tester.pump();
  }

  testWidgets('shows pack info and an Install button in the Available state',
      (tester) async {
    await pumpDetail(tester, pack: _pack(), fetcher: _FakeHttpFetcher());

    expect(find.text('Test Pack'), findsWidgets);
    expect(find.text('A test pack description.'), findsOneWidget);
    expect(find.text('Initial release notes.'), findsOneWidget);
    expect(find.text('Verified Source'), findsOneWidget);
    expect(find.widgetWithText(FilledButton, 'Install'), findsOneWidget);
  });

  testWidgets('an already-installed pack shows Installed without a tap',
      (tester) async {
    final existing = Directory('${packsDir.path}/hv_official_test_pack')
      ..createSync(recursive: true);
    File('${existing.path}/manifest.md').writeAsStringSync(_packManifest);

    await pumpDetail(tester, pack: _pack(), fetcher: _FakeHttpFetcher());

    expect(find.widgetWithText(FilledButton, 'Installed'), findsOneWidget);
    expect(find.widgetWithText(FilledButton, 'Install'), findsNothing);
  });

  testWidgets(
      'a successful install downloads, verifies, and installs the pack, '
      'ending in the Installed state', (tester) async {
    final fetcher = _FakeHttpFetcher(bodyBytes: _validZipBytes);
    await pumpDetail(tester, pack: _pack(), fetcher: fetcher);

    await tapInstallAndAwait(tester);

    expect(find.widgetWithText(FilledButton, 'Installed'), findsOneWidget);
    expect(
      Directory('${packsDir.path}/hv_official_test_pack').existsSync(),
      isTrue,
    );
    expect(
      File('${packsDir.path}/hv_official_test_pack/survival/test_article.md')
          .existsSync(),
      isTrue,
    );
  });

  testWidgets(
      'a checksum mismatch reverts to Available with an error and never '
      'reaches PackImporter', (tester) async {
    final fetcher = _FakeHttpFetcher(bodyBytes: _validZipBytes);
    final pack = _pack(sha256Override: 'a' * 64);
    await pumpDetail(tester, pack: pack, fetcher: fetcher);

    await tapInstallAndAwait(tester);

    expect(find.widgetWithText(FilledButton, 'Install'), findsOneWidget);
    expect(
      find.text('This pack could not be verified and was not installed.'),
      findsOneWidget,
    );
    expect(packsDir.existsSync(), isFalse);
  });

  testWidgets(
      'a download failure reverts to Available with an error and never '
      'reaches PackImporter', (tester) async {
    final fetcher = _FakeHttpFetcher(statusCode: 404);
    await pumpDetail(tester, pack: _pack(), fetcher: fetcher);

    await tapInstallAndAwait(tester);

    expect(find.widgetWithText(FilledButton, 'Install'), findsOneWidget);
    expect(
      find.text('Could not download this pack. Try again.'),
      findsOneWidget,
    );
    expect(packsDir.existsSync(), isFalse);
  });
}
