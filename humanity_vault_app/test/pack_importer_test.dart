// Tests for PackImporter: verifies a ZIP Knowledge Pack is extracted
// into staging, validated in full, and only then committed to
// permanent storage - and that every rejection path (bad manifest, no
// valid articles, duplicate pack ID, unsafe paths, oversized archive)
// leaves no trace in either staging or permanent storage.
//
// PackImporter.importZipInto(...) is exercised directly against plain
// temp directories for staging/packsDir - no path_provider/platform
// channel mocking is needed, since the real path_provider-backed
// entry point (importZip) is a thin, separately-testable wrapper.

import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/library/data/articles_repository.dart';
import 'package:humanity_vault_app/features/packs/data/pack_importer.dart';
import 'package:humanity_vault_app/features/packs/data/packs_loader.dart';

File _buildZip(
  Directory dir,
  String fileName,
  Map<String, String> filesByPath,
) {
  final archive = Archive();
  filesByPath.forEach((path, content) {
    final bytes = utf8.encode(content);
    archive.addFile(ArchiveFile(path, bytes.length, bytes));
  });
  final zipBytes = ZipEncoder().encode(archive)!;
  final file = File('${dir.path}/$fileName')..createSync(recursive: true);
  file.writeAsBytesSync(zipBytes);
  return file;
}

const _validManifest = '''
---
pack_id: importer_test_pack
pack_name: Importer Test Pack
pack_version: 1.0.0
description: A test pack.
---
''';

String _article({required String title, String category = 'Survival'}) {
  return '''
---
title: $title
category: $category
---
## Summary
Test summary.

## Main Content
Test content.
''';
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await ArticlesRepository.ensureLoaded();
  });

  late Directory workDir;

  setUp(() {
    workDir = Directory.systemTemp.createTempSync('hv_importer_');
  });

  tearDown(() {
    if (workDir.existsSync()) workDir.deleteSync(recursive: true);
  });

  Directory staging() => Directory('${workDir.path}/staging');
  Directory packsDir() => Directory('${workDir.path}/packs');

  test('a valid ZIP imports successfully into permanent storage', () async {
    final zip = _buildZip(workDir, 'pack.zip', {
      'manifest.md': _validManifest,
      'survival/valid_zip_article.md': _article(title: 'Valid ZIP Article'),
    });

    final result = await PackImporter.importZipInto(
      zip,
      staging: staging(),
      packsDir: packsDir(),
    );

    expect(result.isSuccess, isTrue);
    expect(result.packName, 'Importer Test Pack');
    expect(result.importedCount, 1);
    expect(result.skippedCount, 0);
    expect(staging().existsSync(), isFalse);
    expect(
      Directory('${packsDir().path}/importer_test_pack').existsSync(),
      isTrue,
    );
    expect(
      File(
        '${packsDir().path}/importer_test_pack/survival/valid_zip_article.md',
      ).existsSync(),
      isTrue,
    );
  });

  test('a ZIP with a missing manifest is rejected', () async {
    final zip = _buildZip(workDir, 'pack.zip', {
      'survival/no_manifest_article.md': _article(title: 'No Manifest'),
    });

    final result = await PackImporter.importZipInto(
      zip,
      staging: staging(),
      packsDir: packsDir(),
    );

    expect(result.isSuccess, isFalse);
    expect(staging().existsSync(), isFalse);
    expect(packsDir().existsSync(), isFalse);
  });

  test('a ZIP with an invalid manifest (missing required field) is rejected',
      () async {
    final zip = _buildZip(workDir, 'pack.zip', {
      'manifest.md': '''
---
pack_id: bad_pack
pack_name: Bad Pack
---
''',
      'survival/some_article.md': _article(title: 'Some Article'),
    });

    final result = await PackImporter.importZipInto(
      zip,
      staging: staging(),
      packsDir: packsDir(),
    );

    expect(result.isSuccess, isFalse);
    expect(staging().existsSync(), isFalse);
    expect(packsDir().existsSync(), isFalse);
  });

  test('a ZIP with zero valid articles is rejected', () async {
    final zip = _buildZip(workDir, 'pack.zip', {
      'manifest.md': _validManifest,
      'survival/malformed_only.md': '''
---
title: Missing Category Field
---
## Summary
No category field.
''',
    });

    final result = await PackImporter.importZipInto(
      zip,
      staging: staging(),
      packsDir: packsDir(),
    );

    expect(result.isSuccess, isFalse);
    expect(result.message, contains('no valid articles'));
    expect(staging().existsSync(), isFalse);
    expect(packsDir().existsSync(), isFalse);
  });

  test(
      'a duplicate pack_id is rejected without overwriting the '
      'already-installed pack', () async {
    // Simulate an already-installed pack.
    final installedDir =
        Directory('${packsDir().path}/importer_test_pack')
          ..createSync(recursive: true);
    File('${installedDir.path}/manifest.md').writeAsStringSync(_validManifest);
    Directory('${installedDir.path}/survival').createSync(recursive: true);
    File('${installedDir.path}/survival/original_article.md')
        .writeAsStringSync(_article(title: 'Original Installed Article'));

    final zip = _buildZip(workDir, 'pack.zip', {
      'manifest.md': _validManifest, // same pack_id
      'survival/attempted_replacement.md':
          _article(title: 'Attempted Replacement'),
    });

    final result = await PackImporter.importZipInto(
      zip,
      staging: staging(),
      packsDir: packsDir(),
    );

    expect(result.isSuccess, isFalse);
    expect(result.message, contains('already installed'));
    expect(staging().existsSync(), isFalse);
    // The originally-installed pack is untouched.
    expect(
      File('${installedDir.path}/survival/original_article.md').existsSync(),
      isTrue,
    );
    expect(
      File('${installedDir.path}/survival/attempted_replacement.md')
          .existsSync(),
      isFalse,
    );
  });

  test(
      'a malformed article is skipped while a valid sibling article '
      'still imports', () async {
    final zip = _buildZip(workDir, 'pack.zip', {
      'manifest.md': _validManifest,
      'survival/malformed.md': '''
---
title: Malformed Article
---
## Summary
No category field.
''',
      'survival/valid_sibling.md': _article(title: 'Valid Sibling'),
    });

    final result = await PackImporter.importZipInto(
      zip,
      staging: staging(),
      packsDir: packsDir(),
    );

    expect(result.isSuccess, isTrue);
    expect(result.importedCount, 1);
    expect(result.skippedCount, 1);
  });

  test('an article reusing a core slug is skipped, not imported', () async {
    final zip = _buildZip(workDir, 'pack.zip', {
      'manifest.md': _validManifest,
      // 'water_purification' is a real core article slug.
      'survival/water_purification.md':
          _article(title: 'Fake Replacement Water Article'),
      'survival/unique_zip_slug.md': _article(title: 'A Unique Article'),
    });

    final result = await PackImporter.importZipInto(
      zip,
      staging: staging(),
      packsDir: packsDir(),
    );

    expect(result.isSuccess, isTrue);
    expect(result.importedCount, 1);
    expect(result.skippedCount, 1);
  });

  test('an archive entry with a path traversal segment is rejected',
      () async {
    final zip = _buildZip(workDir, 'pack.zip', {
      'manifest.md': _validManifest,
      '../escape_attempt.md': _article(title: 'Should Never Be Written'),
    });

    final result = await PackImporter.importZipInto(
      zip,
      staging: staging(),
      packsDir: packsDir(),
    );

    expect(result.isSuccess, isFalse);
    expect(staging().existsSync(), isFalse);
    expect(packsDir().existsSync(), isFalse);
  });

  test('a ZIP exceeding the compressed size limit is rejected', () async {
    final oversized = File('${workDir.path}/oversized.zip')
      ..writeAsBytesSync(
        List<int>.filled(PackImporter.maxCompressedBytes + 1, 0),
      );

    final result = await PackImporter.importZipInto(
      oversized,
      staging: staging(),
      packsDir: packsDir(),
    );

    expect(result.isSuccess, isFalse);
    expect(result.message, contains('too large'));
    expect(staging().existsSync(), isFalse);
  });

  test('an archive exceeding the maximum file count is rejected', () async {
    final files = <String, String>{'manifest.md': _validManifest};
    for (var i = 0; i < PackImporter.maxFileCount + 1; i++) {
      files['survival/generated_$i.md'] = _article(title: 'Article $i');
    }
    final zip = _buildZip(workDir, 'pack.zip', files);

    final result = await PackImporter.importZipInto(
      zip,
      staging: staging(),
      packsDir: packsDir(),
    );

    expect(result.isSuccess, isFalse);
    expect(result.message, contains('too many files'));
    expect(staging().existsSync(), isFalse);
    expect(packsDir().existsSync(), isFalse);
  });

  test('a failed import leaves no staging residue or partial pack',
      () async {
    final zip = _buildZip(workDir, 'pack.zip', {
      'manifest.md': '---\npack_id: incomplete\n---\n',
    });

    final result = await PackImporter.importZipInto(
      zip,
      staging: staging(),
      packsDir: packsDir(),
    );

    expect(result.isSuccess, isFalse);
    expect(staging().existsSync(), isFalse);
    expect(packsDir().existsSync(), isFalse);
  });

  test('an imported pack is discoverable by PacksLoader after a simulated '
      'restart', () async {
    final zip = _buildZip(workDir, 'pack.zip', {
      'manifest.md': _validManifest,
      'survival/discoverable_after_restart.md':
          _article(title: 'Discoverable After Restart'),
    });

    final importResult = await PackImporter.importZipInto(
      zip,
      staging: staging(),
      packsDir: packsDir(),
    );
    expect(importResult.isSuccess, isTrue);

    // Simulate an app restart: a fresh scan of the same permanent
    // packs directory should pick up the newly-committed pack.
    await PacksLoader.loadPacksFrom(packsDir());

    final loaded = ArticlesRepository()
        .getAllArticles()
        .where((a) => a.slug == 'discoverable_after_restart');
    expect(loaded.length, 1);
    expect(loaded.first.title, 'Discoverable After Restart');
  });
}
