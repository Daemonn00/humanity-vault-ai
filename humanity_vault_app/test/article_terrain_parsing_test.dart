// Verifies the optional `terrain:` frontmatter field parses into
// Article.terrainIds, that untagged articles keep working exactly as
// before, and that every tag applied during content tagging resolves to
// a real TerrainRegistry ID.

import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/library/data/markdown_article_parser.dart';
import 'package:humanity_vault_app/features/library/data/articles_repository.dart';
import 'package:humanity_vault_app/features/terrain/data/terrain_registry.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('terrain frontmatter parses into a list of terrain IDs', () {
    final doc = MarkdownArticleParser.parse('''
---
title: Solar Still Construction
category: Survival
terrain: desert, coastal
---
## Summary
Test article.
''');

    expect(
      MarkdownArticleParser.splitList(doc.field('terrain')),
      ['desert', 'coastal'],
    );
  });

  test('missing terrain frontmatter parses to an empty list', () {
    final doc = MarkdownArticleParser.parse('''
---
title: Basic Fire Starting
category: Survival
---
## Summary
Test article.
''');

    expect(MarkdownArticleParser.splitList(doc.field('terrain')), isEmpty);
  });

  test('untagged articles still load with an empty terrainIds list', () async {
    await ArticlesRepository.ensureLoaded();
    final articles = ArticlesRepository().getAllArticles();

    expect(articles, isNotEmpty);
    expect(articles.any((article) => article.terrainIds.isEmpty), isTrue);
  });

  test('every tagged article uses only valid TerrainRegistry IDs', () async {
    await ArticlesRepository.ensureLoaded();
    final validTerrainIds =
        TerrainRegistry.terrains.map((terrain) => terrain.id).toSet();
    final articles = ArticlesRepository().getAllArticles();

    for (final article in articles) {
      for (final terrainId in article.terrainIds) {
        expect(
          validTerrainIds.contains(terrainId),
          isTrue,
          reason: '${article.slug} references unknown terrain "$terrainId"',
        );
      }
    }
  });
}
