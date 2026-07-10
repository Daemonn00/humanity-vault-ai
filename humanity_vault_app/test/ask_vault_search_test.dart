// Unit tests for AskVaultSearch: the retrieval-only, two-pass layer over
// the existing ArticleSearch used by the "Ask the Vault" screen. Every
// test here treats ArticleSearch as an unmodified dependency - none of
// these tests touch article_search.dart or its own test suite.
//
// AskVaultSearch.search returns an AskVaultSearchResponse (articles +
// matchedTerms + queryPass) rather than a plain List<Article> - the
// single source of truth for which query-term set actually produced a
// given result, so callers (excerpt selection, highlighting) never need
// to re-derive or guess it. Most tests below only assert on
// response.articles, matching this file's original behavioral coverage;
// a dedicated group asserts the matchedTerms/queryPass contract itself.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/ask_vault/data/ask_vault_search.dart';
import 'package:humanity_vault_app/features/library/data/article_search.dart';
import 'package:humanity_vault_app/features/library/data/articles_repository.dart';
import 'package:humanity_vault_app/features/library/models/article.dart';
import 'package:humanity_vault_app/features/packs/data/packs_loader.dart';

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
  TestWidgetsFlutterBinding.ensureInitialized();

  test('pass 1 (raw query) returns a tier-0-2 match without needing '
      'normalization', () {
    final article = _article(
      slug: 'a',
      title: 'Water Purification',
      summary: 'Boil water for at least one minute before drinking.',
    );

    final response = AskVaultSearch.search([article], 'water purification');

    expect(response.articles, [article]);
  });

  test('bilingual normalization is only attempted when pass 1 yields no '
      'eligible result', () {
    // Raw query fails pass 1 because "how" appears nowhere in the
    // article; stripping "how"/"do"/"i" leaves "purify water", which
    // matches this article's summary directly.
    final article = _article(
      slug: 'a',
      title: 'Water Purification',
      summary: 'Purify water by boiling it for at least one minute.',
    );

    expect(ArticleSearch.search([article], 'how do I purify water'), isEmpty);

    final response = AskVaultSearch.search(
      [article],
      'how do I purify water',
    );

    expect(response.articles, [article]);
  });

  test('an all-filler-word query (English) returns no results without a '
      'usable second-pass query', () {
    final article = _article(
      slug: 'a',
      title: 'Water Purification',
      summary: 'Boil water for at least one minute before drinking.',
    );

    expect(
      AskVaultSearch.search([article], 'how do i').articles,
      isEmpty,
    );
  });

  test('an all-filler-word query (Indonesian) returns no results without '
      'a usable second-pass query', () {
    final article = _article(
      slug: 'a',
      title: 'Water Purification',
      summary: 'Boil water for at least one minute before drinking.',
    );

    expect(
      AskVaultSearch.search([article], 'bagaimana cara').articles,
      isEmpty,
    );
  });

  test(
      'the tier-0-2 eligibility predicate agrees with ArticleSearch\'s own '
      'tier boundary across fixtures for tiers 0 through 4', () {
    final tier0Title = _article(
      slug: 'tier0',
      title: 'Solar Still Construction',
      summary: 'An overview of building a solar still.',
    );
    final tier1Category = _article(
      slug: 'tier1',
      title: 'Untitled',
      category: 'Solar Survival',
      summary: 'General summary with no shared term.',
    );
    final tier2Summary = _article(
      slug: 'tier2',
      title: 'Untitled',
      summary: 'Uses a solar still to purify water.',
    );
    final tier3BenefitsOnly = _article(
      slug: 'tier3',
      title: 'Untitled',
      summary: 'A summary with no shared term at all.',
      benefits: ['Works well with solar power.'],
    );
    final tier4ContentOnly = _article(
      slug: 'tier4',
      title: 'Untitled',
      summary: 'A summary with no shared term at all.',
      content: 'Mentions solar only in the body.',
    );

    final all = [
      tier0Title,
      tier1Category,
      tier2Summary,
      tier3BenefitsOnly,
      tier4ContentOnly,
    ];

    // Sanity check: ArticleSearch itself matches every fixture on this
    // term (proves the fixtures are well-formed before asserting the
    // narrower Ask the Vault behavior below).
    expect(ArticleSearch.search(all, 'solar').length, all.length);

    final response = AskVaultSearch.search(all, 'solar');

    expect(
      response.articles,
      containsAll([tier0Title, tier1Category, tier2Summary]),
    );
    expect(response.articles, isNot(contains(tier3BenefitsOnly)));
    expect(response.articles, isNot(contains(tier4ContentOnly)));
  });

  test('a title/category match with an empty summary is skipped, not '
      'shown with a body fragment', () {
    final article = _article(
      slug: 'a',
      title: 'Water Purification',
      summary: '',
      content: 'Boiling is one reliable method.',
    );

    expect(
      AskVaultSearch.search([article], 'water purification').articles,
      isEmpty,
    );
  });

  test('a title/category match with a whitespace-only summary is treated '
      'as empty and skipped', () {
    final article = _article(
      slug: 'a',
      title: 'Water Purification',
      summary: '   \n  ',
    );

    expect(
      AskVaultSearch.search([article], 'water purification').articles,
      isEmpty,
    );
  });

  test('benefits/sources-only and content-only matches are always '
      'excluded, in both passes', () {
    final benefitsOnly = _article(
      slug: 'benefits_only',
      title: 'Untitled',
      summary: 'Unrelated summary.',
      benefits: ['Purifying water prevents illness.'],
    );
    final contentOnly = _article(
      slug: 'content_only',
      title: 'Untitled',
      summary: 'Unrelated summary.',
      content: 'A paragraph about purifying water in the field.',
    );

    expect(
      AskVaultSearch.search(
        [benefitsOnly, contentOnly],
        'purifying water',
      ).articles,
      isEmpty,
    );
  });

  test('results are capped at 3 even when more than 3 eligible matches '
      'exist', () {
    final articles = List.generate(
      5,
      (i) => _article(
        slug: 'water_$i',
        title: 'Water Purification $i',
        summary: 'Summary about water purification, entry $i.',
      ),
    );

    final response = AskVaultSearch.search(articles, 'water purification');

    expect(response.articles.length, 3);
  });

  test('every returned article\'s excerpt (its own summary field) is '
      'non-empty and unchanged from the source Article', () {
    final article = _article(
      slug: 'a',
      title: 'Water Purification',
      summary: 'Boil water for at least one minute before drinking.',
    );

    final response = AskVaultSearch.search([article], 'water purification');

    expect(response.articles.single.summary, article.summary);
    expect(response.articles.single.summary.trim(), isNotEmpty);
  });

  group('AskVaultSearchResponse matchedTerms and queryPass', () {
    test('a successful raw-query response exposes the exact raw terms '
        'and AskVaultQueryPass.raw', () {
      final article = _article(
        slug: 'a',
        title: 'Water Purification',
        summary: 'Boil water for at least one minute before drinking.',
      );

      final response = AskVaultSearch.search([article], 'Water Purification');

      expect(response.articles, [article]);
      expect(response.matchedTerms, ['water', 'purification']);
      expect(response.queryPass, AskVaultQueryPass.raw);
    });

    test('a successful bilingual-normalized fallback response exposes '
        'the exact normalized terms and AskVaultQueryPass.normalized',
        () {
      final article = _article(
        slug: 'a',
        title: 'Water Purification',
        summary: 'Purify water by boiling it for at least one minute.',
      );

      // Sanity check: the raw query alone does not match (forces the
      // normalized fallback).
      expect(
        AskVaultSearch.search([article], 'how do I purify water').articles,
        [article],
      );

      final response = AskVaultSearch.search(
        [article],
        'how do I purify water',
      );

      expect(response.matchedTerms, ['purify', 'water']);
      expect(response.queryPass, AskVaultQueryPass.normalized);
    });

    test('a no-result response returns empty articles, empty '
        'matchedTerms, and a null queryPass', () {
      final article = _article(
        slug: 'a',
        title: 'Water Purification',
        summary: 'Boil water for at least one minute before drinking.',
      );

      final response = AskVaultSearch.search(
        [article],
        'zzz_nonexistent_query_term_12345',
      );

      expect(response.articles, isEmpty);
      expect(response.matchedTerms, isEmpty);
      expect(response.queryPass, isNull);
    });

    test('an empty query string returns empty articles, empty '
        'matchedTerms, and a null queryPass', () {
      final article = _article(slug: 'a', title: 'Water Purification');

      final response = AskVaultSearch.search([article], '   ');

      expect(response.articles, isEmpty);
      expect(response.matchedTerms, isEmpty);
      expect(response.queryPass, isNull);
    });
  });

  group('installed Knowledge Pack articles', () {
    setUpAll(() async {
      await ArticlesRepository.ensureLoaded();
    });

    test('a pack-only article is matched identically to a core article',
        () async {
      final root =
          Directory.systemTemp.createTempSync('hv_ask_vault_pack_');
      addTearDown(() => root.deleteSync(recursive: true));

      final packDir = Directory('${root.path}/pack_ask_vault')
        ..createSync(recursive: true);
      File('${packDir.path}/manifest.md').writeAsStringSync('''
---
pack_id: ask_vault_test_pack
pack_name: Ask Vault Test Pack
pack_version: 1.0.0
---
''');
      final articleDir = Directory('${packDir.path}/survival')
        ..createSync(recursive: true);
      File('${articleDir.path}/pack_only_ask_vault_slug.md')
          .writeAsStringSync('''
---
title: Pack Only Ask Vault Article
category: Survival
---
## Summary
A pack-only summary about signaling for rescue.
''');

      await PacksLoader.loadPacksFrom(root);

      final response = AskVaultSearch.search(
        ArticlesRepository().getAllArticles(),
        'signaling for rescue',
      );

      expect(
        response.articles.any((a) => a.slug == 'pack_only_ask_vault_slug'),
        isTrue,
      );
    });
  });
}
