// Unit tests for isSafetyClassified: the two-signal check (category/
// subcategory string match, or membership in an EmergencyRepository
// topic's articleSlugs) used to show the additional "Safety-related"
// marker on Ask the Vault results. This has no bearing on which
// articles are matched or what text is shown - see ask_vault_search_test.

import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/ask_vault/data/ask_vault_safety.dart';
import 'package:humanity_vault_app/features/library/models/article.dart';

Article _article({
  required String slug,
  String title = 'Untitled',
  String category = 'Survival',
  String? subcategory,
  String summary = '',
}) {
  return Article(
    title: title,
    category: category,
    subcategory: subcategory,
    summary: summary,
    content: '',
    benefits: const [],
    sources: const [],
    slug: slug,
  );
}

void main() {
  test('an article whose category is Medicine is classified safety-relevant',
      () {
    final article = _article(slug: 'a', category: 'Medicine');
    expect(isSafetyClassified(article), isTrue);
  });

  test(
      'an article whose category is Survival is classified safety-relevant',
      () {
    final article = _article(slug: 'a', category: 'Survival');
    expect(isSafetyClassified(article), isTrue);
  });

  test(
      'an article whose subcategory names a safety term is classified '
      'safety-relevant even when its category does not', () {
    final article = _article(
      slug: 'a',
      category: 'Agriculture',
      subcategory: 'Foraging',
    );
    expect(isSafetyClassified(article), isTrue);
  });

  test(
      'an article whose slug appears in an EmergencyRepository topic is '
      'classified safety-relevant even when its category name does not '
      'say so', () {
    final article = _article(
      slug: 'water_purification',
      category: 'Engineering',
    );
    expect(isSafetyClassified(article), isTrue);
  });

  test('an article matching neither signal is not classified '
      'safety-relevant', () {
    final article = _article(
      slug: 'not_a_real_slug_anywhere',
      category: 'History',
    );
    expect(isSafetyClassified(article), isFalse);
  });
}
