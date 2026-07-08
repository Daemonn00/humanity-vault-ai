// Phase 1 foundation tests: verifies the optional `terrain:` frontmatter
// field parses into Article.terrainIds, and that existing (untagged)
// articles keep working exactly as before.

import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/library/data/markdown_article_parser.dart';
import 'package:humanity_vault_app/features/library/data/articles_repository.dart';

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

  test('every currently loaded article is untagged (Phase 1 baseline)', () async {
    await ArticlesRepository.ensureLoaded();
    final articles = ArticlesRepository().getAllArticles();

    expect(articles, isNotEmpty);
    expect(articles.every((article) => article.terrainIds.isEmpty), isTrue);
  });
}
