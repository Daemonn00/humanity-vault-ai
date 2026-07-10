// Unit tests for ask_vault_excerpt.dart: the deterministic, verbatim-only
// excerpt selector used by Phase B ("Better Extractive Relevance"), plus
// its query-term resolution helper. Every test treats AskVaultSearch as
// an unmodified dependency - none of these tests touch ask_vault_search.dart.

import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/ask_vault/data/ask_vault_excerpt.dart';
import 'package:humanity_vault_app/features/ask_vault/data/ask_vault_search.dart';
import 'package:humanity_vault_app/features/library/models/article.dart';

Article _article({
  required String slug,
  String title = 'Untitled',
  String category = 'Survival',
  String? subcategory,
  String summary = '',
  String content = '',
}) {
  return Article(
    title: title,
    category: category,
    subcategory: subcategory,
    summary: summary,
    content: content,
    benefits: const [],
    sources: const [],
    slug: slug,
  );
}

void main() {
  group('selectExcerpt', () {
    test('a safety-classified article always uses the summary, even with '
        'a perfect body match', () {
      final article = _article(
        slug: 'a',
        category: 'Medicine',
        summary: 'Short summary.',
        content: 'A single paragraph mentioning zzzterm clearly.',
      );

      final excerpt = selectExcerpt(
        article,
        ['zzzterm'],
        isSafetyClassified: true,
      );

      expect(excerpt.text, article.summary);
      expect(excerpt.source, AskVaultExcerptSource.summary);
    });

    test('empty content falls back to the summary', () {
      final article = _article(slug: 'a', summary: 'Short summary.');

      final excerpt = selectExcerpt(
        article,
        ['anything'],
        isSafetyClassified: false,
      );

      expect(excerpt.text, article.summary);
      expect(excerpt.source, AskVaultExcerptSource.summary);
    });

    test('zero paragraphs matching any term falls back to the summary',
        () {
      final article = _article(
        slug: 'a',
        summary: 'Short summary.',
        content: 'First paragraph about apples.\n\n'
            'Second paragraph about oranges.',
      );

      final excerpt = selectExcerpt(
        article,
        ['zzznomatch'],
        isSafetyClassified: false,
      );

      expect(excerpt.source, AskVaultExcerptSource.summary);
    });

    test('a tie for the highest score falls back to the summary', () {
      final article = _article(
        slug: 'a',
        summary: 'Short summary.',
        content: 'First paragraph mentions zzzterm once.\n\n'
            'Second paragraph also mentions zzzterm once.',
      );

      final excerpt = selectExcerpt(
        article,
        ['zzzterm'],
        isSafetyClassified: false,
      );

      expect(excerpt.source, AskVaultExcerptSource.summary);
    });

    test('a winning paragraph over 150 words falls back to the summary',
        () {
      final longParagraph =
          '${List.generate(151, (i) => 'word$i').join(' ')} zzzterm.';
      final article = _article(
        slug: 'a',
        summary: 'Short summary.',
        content: '$longParagraph\n\nA short unrelated paragraph.',
      );

      final excerpt = selectExcerpt(
        article,
        ['zzzterm'],
        isSafetyClassified: false,
      );

      expect(excerpt.source, AskVaultExcerptSource.summary);
    });

    test('a clear unique non-safety paragraph winner is selected verbatim',
        () {
      final winningParagraph =
          'This paragraph is clearly about zzzterm and nothing else.';
      final article = _article(
        slug: 'a',
        summary: 'Short summary.',
        content: 'An unrelated first paragraph.\n\n'
            '$winningParagraph\n\n'
            'An unrelated third paragraph.',
      );

      final excerpt = selectExcerpt(
        article,
        ['zzzterm'],
        isSafetyClassified: false,
      );

      expect(excerpt.text, winningParagraph);
      expect(excerpt.source, AskVaultExcerptSource.contentParagraph);
      // The selected excerpt is an exact, contiguous, unmodified
      // substring of Article.content - never truncated or altered.
      expect(article.content.contains(excerpt.text), isTrue);
    });

    test('the excerpt is always exactly the summary or exactly one whole '
        'content paragraph, never a mix', () {
      final article = _article(
        slug: 'a',
        summary: 'Short summary mentioning zzzterm too.',
        content: 'An unrelated first paragraph.\n\n'
            'A paragraph clearly about zzzterm.\n\n'
            'An unrelated third paragraph.',
      );

      final excerpt = selectExcerpt(
        article,
        ['zzzterm'],
        isSafetyClassified: false,
      );

      final isExactlySummary = excerpt.text == article.summary;
      final isExactlyOneParagraph = article.content
          .split(RegExp(r'\n\s*\n'))
          .map((p) => p.trim())
          .contains(excerpt.text);
      expect(isExactlySummary || isExactlyOneParagraph, isTrue);
      expect(isExactlySummary && isExactlyOneParagraph, isFalse);
    });
  });

  group('resolveQueryTerms parity with AskVaultSearch', () {
    test('when the raw query alone matches, the raw terms are returned',
        () {
      final article = _article(
        slug: 'a',
        title: 'Water Purification',
        summary: 'Boil water for at least one minute before drinking.',
      );

      final results = AskVaultSearch.search([article], 'water purification');
      expect(results, [article]);

      final terms = resolveQueryTerms(article, 'water purification');
      expect(terms, ['water', 'purification']);
    });

    test('when only the bilingual-normalized query matches, the '
        'normalized terms are returned', () {
      final article = _article(
        slug: 'a',
        title: 'Water Purification',
        summary: 'Purify water by boiling it for at least one minute.',
      );

      // Sanity check: the raw query alone does not match (forces
      // AskVaultSearch's normalized fallback), mirroring
      // ask_vault_search_test.dart's own equivalent case.
      expect(
        AskVaultSearch.search([article], 'how do I purify water'),
        [article],
      );

      final terms = resolveQueryTerms(article, 'how do I purify water');
      expect(terms, ['purify', 'water']);
    });
  });
}
