// Unit tests for ArticleSearch: the pure, dependency-free full-text
// search + tiered ranking function used by SearchScreen.

import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/library/data/article_search.dart';
import 'package:humanity_vault_app/features/library/models/article.dart';

Article _article({
  required String slug,
  String title = 'Untitled',
  String category = 'Survival',
  String summary = '',
  String content = '',
  List<String> benefits = const [],
  List<String> sources = const [],
}) {
  return Article(
    title: title,
    category: category,
    summary: summary,
    content: content,
    benefits: benefits,
    sources: sources,
    slug: slug,
  );
}

void main() {
  test('matches a term that appears only in the summary', () {
    final article = _article(
      slug: 'a',
      title: 'Campfire Basics',
      summary: 'Staying properly hydrated is critical in the field.',
      content: 'No relevant term here.',
    );

    final results = ArticleSearch.search([article], 'hydrated');

    expect(results, [article]);
  });

  test('matches a term that appears only in the content', () {
    final article = _article(
      slug: 'a',
      title: 'Campfire Basics',
      summary: 'How to build a fire.',
      content: 'A solar still can purify water through evaporation.',
    );

    final results = ArticleSearch.search([article], 'evaporation');

    expect(results, [article]);
  });

  test('multi-term query requires every term, found in any field', () {
    final withBoth = _article(
      slug: 'both',
      title: 'Water Purification',
      content: 'Boiling is one of the most reliable methods.',
    );
    final onlyWater = _article(
      slug: 'water_only',
      title: 'Water Storage',
      content: 'Store water in clean containers.',
    );

    final results =
        ArticleSearch.search([withBoth, onlyWater], 'water boiling');

    expect(results, [withBoth]);
  });

  test('title matches rank above content-only matches for the same term',
      () {
    final contentOnly = _article(
      slug: 'content_only',
      title: 'Campfire Basics',
      content: 'Mentions solar in passing.',
    );
    final titleMatch = _article(
      slug: 'title_match',
      title: 'Solar Still Construction',
      content: 'Details about evaporation.',
    );

    // contentOnly is listed first in the input to prove ranking - not
    // input order - determines the result order.
    final results =
        ArticleSearch.search([contentOnly, titleMatch], 'solar');

    expect(results, [titleMatch, contentOnly]);
  });

  test('matching is case-insensitive', () {
    final article = _article(slug: 'a', title: 'Solar Still Construction');

    final results = ArticleSearch.search([article], 'SOLAR');

    expect(results, [article]);
  });

  test('empty or whitespace-only query returns no results', () {
    final article = _article(slug: 'a', title: 'Solar Still Construction');

    expect(ArticleSearch.search([article], ''), isEmpty);
    expect(ArticleSearch.search([article], '   '), isEmpty);
  });

  test('an article matching in multiple fields appears only once', () {
    final article = _article(
      slug: 'a',
      title: 'Water Purification',
      summary: 'Water safety overview.',
      content: 'More detail about water.',
    );

    final results = ArticleSearch.search([article], 'water');

    expect(results.length, 1);
  });
}
