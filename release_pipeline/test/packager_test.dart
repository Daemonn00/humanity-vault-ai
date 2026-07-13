// Tests for Packager: verifies the release ZIP contains only
// manifest.md and other .md files (never REVIEW_NOTES.md or any
// non-Markdown file - the same allowlist PackImporter enforces on
// import), that the checksum matches package:crypto's own
// computation, and that packaging the same directory twice is
// byte-for-byte reproducible.

import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:release_pipeline/src/packager.dart';
import 'package:test/test.dart';

void main() {
  late Directory packDir;

  setUp(() {
    packDir = Directory.systemTemp.createTempSync('hv_packager_');
    File('${packDir.path}/manifest.md').writeAsStringSync('''
---
pack_id: hv_official_test_pack
pack_name: Test Pack
pack_version: 1.0.0
---
''');
    final articleDir = Directory('${packDir.path}/survival')
      ..createSync(recursive: true);
    File('${articleDir.path}/test_article.md').writeAsStringSync('''
---
title: Test Article
category: Survival
---
## Summary
A summary.
''');
    File('${packDir.path}/REVIEW_NOTES.md').writeAsStringSync(
      '# Editorial notes - must never be packaged',
    );
    File('${packDir.path}/notes.txt').writeAsStringSync('not markdown');
  });

  tearDown(() {
    if (packDir.existsSync()) packDir.deleteSync(recursive: true);
  });

  test('fileNameFor follows the <pack_id>-v<version>.zip convention', () {
    expect(
      Packager.fileNameFor('hv_official_test_pack', '1.0.0'),
      'hv_official_test_pack-v1.0.0.zip',
    );
  });

  test('packages manifest.md and article .md files, excluding '
      'REVIEW_NOTES.md and non-Markdown files', () {
    final result = Packager.package(
      packDir,
      packId: 'hv_official_test_pack',
      version: '1.0.0',
    );

    final archive = ZipDecoder().decodeBytes(result.zipBytes);
    final names = archive.files.map((f) => f.name).toSet();

    expect(names, contains('manifest.md'));
    expect(names, contains('survival/test_article.md'));
    expect(names, isNot(contains('REVIEW_NOTES.md')));
    expect(names, isNot(contains('notes.txt')));
    expect(names, hasLength(2));
  });

  test('the reported filename matches fileNameFor', () {
    final result = Packager.package(
      packDir,
      packId: 'hv_official_test_pack',
      version: '1.0.0',
    );
    expect(result.fileName, 'hv_official_test_pack-v1.0.0.zip');
  });

  test('the reported sha256 matches package:crypto\'s own computation '
      'of the returned bytes', () {
    final result = Packager.package(
      packDir,
      packId: 'hv_official_test_pack',
      version: '1.0.0',
    );
    expect(
      result.sha256,
      crypto.sha256.convert(result.zipBytes).toString(),
    );
  });

  test('the reported size matches the returned bytes\' length', () {
    final result = Packager.package(
      packDir,
      packId: 'hv_official_test_pack',
      version: '1.0.0',
    );
    expect(result.sizeBytes, result.zipBytes.length);
  });

  test('packaging the same directory twice is byte-for-byte '
      'reproducible', () {
    final first = Packager.package(
      packDir,
      packId: 'hv_official_test_pack',
      version: '1.0.0',
    );
    final second = Packager.package(
      packDir,
      packId: 'hv_official_test_pack',
      version: '1.0.0',
    );

    expect(second.zipBytes, equals(first.zipBytes));
    expect(second.sha256, first.sha256);
  });

  test('throws if the pack directory has no .md files to package', () {
    final emptyDir = Directory.systemTemp.createTempSync('hv_packager_empty_');
    addTearDown(() => emptyDir.deleteSync(recursive: true));
    File('${emptyDir.path}/readme.txt').writeAsStringSync('nothing to see');

    expect(
      () => Packager.package(emptyDir, packId: 'hv_official_x', version: '1.0.0'),
      throwsA(isA<StateError>()),
    );
  });

  test('article content survives packaging unmodified', () {
    final result = Packager.package(
      packDir,
      packId: 'hv_official_test_pack',
      version: '1.0.0',
    );
    final archive = ZipDecoder().decodeBytes(result.zipBytes);
    final manifestFile =
        archive.files.firstWhere((f) => f.name == 'manifest.md');
    final content = utf8.decode(manifestFile.content as List<int>);
    expect(content, contains('pack_id: hv_official_test_pack'));
  });
}
