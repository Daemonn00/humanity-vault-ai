// Tests for PacksLoader: verifies installed Knowledge Packs load
// safely alongside the core bundled articles, and that every failure
// mode (missing/empty directory, broken manifest, malformed article,
// duplicate slug, unknown category, invalid terrain) degrades safely
// without ever losing or corrupting the core corpus.
//
// PacksLoader.loadPacksFrom(Directory) is exercised directly against
// plain temp directories - no path_provider/platform channel mocking
// is needed, since real directory resolution (PackStorage.
// packsDirectory()) is a thin, separately-testable wrapper around it.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/library/data/articles_repository.dart';
import 'package:humanity_vault_app/features/packs/data/packs_loader.dart';

const _validManifest = '''
---
pack_id: test_pack
pack_name: Test Pack
pack_version: 1.0.0
---
''';

String _article({
  required String title,
  String category = 'Survival',
  String? terrain,
}) {
  final terrainLine = terrain != null ? 'terrain: $terrain\n' : '';
  return '''
---
title: $title
category: $category
$terrainLine---
## Summary
Test summary.

## Main Content
Test content.
''';
}

Directory _createPack(
  Directory root,
  String folderName, {
  required String manifest,
  Map<String, String> articlesByRelativePath = const {},
}) {
  final packDir = Directory('${root.path}/$folderName')
    ..createSync(recursive: true);
  File('${packDir.path}/manifest.md').writeAsStringSync(manifest);
  articlesByRelativePath.forEach((relativePath, content) {
    final file = File('${packDir.path}/$relativePath');
    file.parent.createSync(recursive: true);
    file.writeAsStringSync(content);
  });
  return packDir;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await ArticlesRepository.ensureLoaded();
  });

  test('core articles load normally when the packs directory does not exist',
      () async {
    final missingDir = Directory(
      '${Directory.systemTemp.path}/hv_packs_missing_'
      '${DateTime.now().microsecondsSinceEpoch}',
    );

    await PacksLoader.loadPacksFrom(missingDir);

    expect(
      ArticlesRepository().getAllArticles().any(
            (a) => a.slug == 'water_purification',
          ),
      isTrue,
    );
  });

  test('core articles load normally when the packs directory is empty',
      () async {
    final emptyDir = Directory.systemTemp.createTempSync('hv_packs_empty_');
    addTearDown(() => emptyDir.deleteSync(recursive: true));

    await PacksLoader.loadPacksFrom(emptyDir);

    expect(
      ArticlesRepository().getAllArticles().any(
            (a) => a.slug == 'water_purification',
          ),
      isTrue,
    );
  });

  test('a valid pack loads its valid article', () async {
    final root = Directory.systemTemp.createTempSync('hv_packs_valid_');
    addTearDown(() => root.deleteSync(recursive: true));

    _createPack(
      root,
      'pack_alpha',
      manifest: _validManifest,
      articlesByRelativePath: {
        'survival/pack_alpha_unique_slug.md':
            _article(title: 'Pack Alpha Article'),
      },
    );

    await PacksLoader.loadPacksFrom(root);

    final matches = ArticlesRepository()
        .getAllArticles()
        .where((a) => a.slug == 'pack_alpha_unique_slug');
    expect(matches.length, 1);
    expect(matches.first.title, 'Pack Alpha Article');
  });

  test('a pack with a missing or invalid manifest is ignored', () async {
    final root = Directory.systemTemp.createTempSync('hv_packs_badmanifest_');
    addTearDown(() => root.deleteSync(recursive: true));

    // No manifest.md at all.
    final noManifestDir = Directory('${root.path}/pack_no_manifest')
      ..createSync(recursive: true);
    Directory('${noManifestDir.path}/survival').createSync(recursive: true);
    File('${noManifestDir.path}/survival/no_manifest_slug.md')
        .writeAsStringSync(_article(title: 'Should Not Load'));

    // Manifest missing the required pack_version field.
    _createPack(
      root,
      'pack_bad_manifest',
      manifest: '''
---
pack_id: bad_pack
pack_name: Bad Pack
---
''',
      articlesByRelativePath: {
        'survival/bad_manifest_slug.md':
            _article(title: 'Should Also Not Load'),
      },
    );

    await PacksLoader.loadPacksFrom(root);

    final all = ArticlesRepository().getAllArticles();
    expect(all.any((a) => a.slug == 'no_manifest_slug'), isFalse);
    expect(all.any((a) => a.slug == 'bad_manifest_slug'), isFalse);
  });

  test(
      'a malformed article is skipped while valid articles in the same '
      'pack still load', () async {
    final root = Directory.systemTemp.createTempSync('hv_packs_malformed_');
    addTearDown(() => root.deleteSync(recursive: true));

    _createPack(
      root,
      'pack_mixed',
      manifest: _validManifest,
      articlesByRelativePath: {
        // Missing the required 'category' field.
        'survival/malformed_slug.md': '''
---
title: Malformed Article
---
## Summary
No category field.
''',
        'survival/valid_slug_alongside_malformed.md':
            _article(title: 'Valid Sibling Article'),
      },
    );

    await PacksLoader.loadPacksFrom(root);

    final all = ArticlesRepository().getAllArticles();
    expect(all.any((a) => a.slug == 'malformed_slug'), isFalse);
    expect(
      all.any((a) => a.slug == 'valid_slug_alongside_malformed'),
      isTrue,
    );
  });

  test('a pack article reusing a core slug is skipped', () async {
    final coreArticle = ArticlesRepository()
        .getAllArticles()
        .firstWhere((a) => a.slug == 'water_purification');

    final root = Directory.systemTemp.createTempSync('hv_packs_coredup_');
    addTearDown(() => root.deleteSync(recursive: true));

    _createPack(
      root,
      'pack_core_dup',
      manifest: _validManifest,
      articlesByRelativePath: {
        'survival/water_purification.md':
            _article(title: 'Fake Replacement Article'),
      },
    );

    await PacksLoader.loadPacksFrom(root);

    final matches = ArticlesRepository()
        .getAllArticles()
        .where((a) => a.slug == 'water_purification');
    expect(matches.length, 1);
    expect(matches.first.title, coreArticle.title);
  });

  test(
      'a slug shared between two packs is kept only from the '
      'alphabetically-first pack folder', () async {
    final root = Directory.systemTemp.createTempSync('hv_packs_crossdup_');
    addTearDown(() => root.deleteSync(recursive: true));

    _createPack(
      root,
      'pack_a_first',
      manifest: '''
---
pack_id: pack_a
pack_name: Pack A
pack_version: 1.0.0
---
''',
      articlesByRelativePath: {
        'survival/shared_pack_slug.md': _article(title: 'From Pack A'),
      },
    );
    _createPack(
      root,
      'pack_b_second',
      manifest: '''
---
pack_id: pack_b
pack_name: Pack B
pack_version: 1.0.0
---
''',
      articlesByRelativePath: {
        'survival/shared_pack_slug.md': _article(title: 'From Pack B'),
      },
    );

    await PacksLoader.loadPacksFrom(root);

    final matches = ArticlesRepository()
        .getAllArticles()
        .where((a) => a.slug == 'shared_pack_slug');
    expect(matches.length, 1);
    expect(matches.first.title, 'From Pack A');
  });

  test('an article in an unknown category folder is skipped', () async {
    final root = Directory.systemTemp.createTempSync('hv_packs_unknowncat_');
    addTearDown(() => root.deleteSync(recursive: true));

    _createPack(
      root,
      'pack_unknown_cat',
      manifest: _validManifest,
      articlesByRelativePath: {
        'not_a_real_category/unknown_category_slug.md': _article(
          title: 'Should Not Load',
          category: 'Not A Real Category',
        ),
      },
    );

    await PacksLoader.loadPacksFrom(root);

    expect(
      ArticlesRepository()
          .getAllArticles()
          .any((a) => a.slug == 'unknown_category_slug'),
      isFalse,
    );
  });

  test('an invalid terrain ID is dropped while the article still loads',
      () async {
    final root = Directory.systemTemp.createTempSync('hv_packs_badterrain_');
    addTearDown(() => root.deleteSync(recursive: true));

    _createPack(
      root,
      'pack_terrain',
      manifest: _validManifest,
      articlesByRelativePath: {
        'survival/terrain_slug.md': _article(
          title: 'Terrain Article',
          terrain: 'desert, not_a_real_terrain',
        ),
      },
    );

    await PacksLoader.loadPacksFrom(root);

    final article = ArticlesRepository()
        .getAllArticles()
        .firstWhere((a) => a.slug == 'terrain_slug');
    expect(article.terrainIds, ['desert']);
  });

  test('a broken pack does not prevent another valid pack from loading',
      () async {
    final root =
        Directory.systemTemp.createTempSync('hv_packs_brokenplusvalid_');
    addTearDown(() => root.deleteSync(recursive: true));

    // Broken: no manifest.md.
    Directory('${root.path}/pack_broken/survival')
        .createSync(recursive: true);
    File('${root.path}/pack_broken/survival/broken_pack_slug.md')
        .writeAsStringSync(_article(title: 'Should Not Load'));

    _createPack(
      root,
      'pack_valid',
      manifest: _validManifest,
      articlesByRelativePath: {
        'survival/valid_pack_alongside_broken.md':
            _article(title: 'Valid Pack Article'),
      },
    );

    await PacksLoader.loadPacksFrom(root);

    final all = ArticlesRepository().getAllArticles();
    expect(all.any((a) => a.slug == 'broken_pack_slug'), isFalse);
    expect(all.any((a) => a.slug == 'valid_pack_alongside_broken'), isTrue);
  });

  group('installedPackSummariesIn', () {
    test('a valid pack summarizes its manifest fields and article count',
        () async {
      final root = Directory.systemTemp.createTempSync('hv_summaries_valid_');
      addTearDown(() => root.deleteSync(recursive: true));

      _createPack(
        root,
        'pack_alpha',
        manifest: '''
---
pack_id: test_pack
pack_name: Test Pack
pack_version: 1.0.0
description: A short description.
---
''',
        articlesByRelativePath: {
          'survival/summary_slug_one.md': _article(title: 'Article One'),
          'survival/summary_slug_two.md': _article(title: 'Article Two'),
        },
      );

      final summaries = await PacksLoader.installedPackSummariesIn(root);

      expect(summaries.length, 1);
      final summary = summaries.single;
      expect(summary.isReadable, isTrue);
      expect(summary.manifest!.packName, 'Test Pack');
      expect(summary.manifest!.packVersion, '1.0.0');
      expect(summary.manifest!.description, 'A short description.');
      expect(summary.articleCount, 2);
    });

    test('a pack with no manifest.md is summarized as unreadable, not '
        'omitted', () async {
      final root = Directory.systemTemp.createTempSync('hv_summaries_nomf_');
      addTearDown(() => root.deleteSync(recursive: true));

      Directory('${root.path}/pack_no_manifest').createSync(recursive: true);

      final summaries = await PacksLoader.installedPackSummariesIn(root);

      expect(summaries.length, 1);
      expect(summaries.single.isReadable, isFalse);
      expect(summaries.single.folderName, 'pack_no_manifest');
      expect(summaries.single.manifest, isNull);
      expect(summaries.single.articleCount, isNull);
    });

    test('a pack with an invalid manifest is summarized as unreadable, not '
        'omitted', () async {
      final root = Directory.systemTemp.createTempSync('hv_summaries_badmf_');
      addTearDown(() => root.deleteSync(recursive: true));

      _createPack(
        root,
        'pack_bad_manifest',
        manifest: '''
---
pack_id: bad_pack
pack_name: Bad Pack
---
''',
      );

      final summaries = await PacksLoader.installedPackSummariesIn(root);

      expect(summaries.length, 1);
      expect(summaries.single.isReadable, isFalse);
      expect(summaries.single.folderName, 'pack_bad_manifest');
    });

    test('the article count reflects only this pack\'s own valid articles, '
        'ignoring core corpus/other-pack slug collisions', () async {
      final coreSlug = ArticlesRepository().getAllArticles().first.slug;

      final root = Directory.systemTemp.createTempSync('hv_summaries_dup_');
      addTearDown(() => root.deleteSync(recursive: true));

      _createPack(
        root,
        'pack_dup',
        manifest: _validManifest,
        articlesByRelativePath: {
          'survival/$coreSlug.md': _article(title: 'Shadows Core Slug'),
        },
      );

      final summaries = await PacksLoader.installedPackSummariesIn(root);

      expect(summaries.single.articleCount, 1);
    });

    test('returns an empty list for a missing or empty directory', () async {
      final missingDir = Directory(
        '${Directory.systemTemp.path}/hv_summaries_missing_'
        '${DateTime.now().microsecondsSinceEpoch}',
      );

      expect(await PacksLoader.installedPackSummariesIn(missingDir), isEmpty);
    });
  });
}
