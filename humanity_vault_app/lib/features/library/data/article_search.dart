import '../models/article.dart';

/// Offline full-text search over the in-memory article corpus.
///
/// No index, no external dependency: every call rescans the already-
/// loaded [Article] list directly, which is cheap at this corpus size.
class ArticleSearch {
  ArticleSearch._();

  /// Returns articles matching every whitespace-separated term in
  /// [query] (case-insensitive substring match; a term may be found in
  /// a different field than another term on the same article).
  ///
  /// Results are grouped into stable tiers by the best field a match
  /// came from - title, then category/subcategory, then summary, then
  /// benefits/sources, then content - preserving [articles]' original
  /// relative order within each tier. Returns an empty list for an
  /// empty or whitespace-only query.
  static List<Article> search(List<Article> articles, String query) {
    final terms = query
        .trim()
        .toLowerCase()
        .split(RegExp(r'\s+'))
        .where((term) => term.isNotEmpty)
        .toList();

    if (terms.isEmpty) return const [];

    final tiers = List.generate(5, (_) => <Article>[]);

    for (final article in articles) {
      final tier = _bestMatchTier(article, terms);
      if (tier != null) {
        tiers[tier].add(article);
      }
    }

    return tiers.expand((tier) => tier).toList();
  }

  /// Returns the best (lowest) tier in which [article] matches every
  /// term in [terms], or null if any term is missing from every field.
  static int? _bestMatchTier(Article article, List<String> terms) {
    final title = article.title.toLowerCase();
    final category = article.category.toLowerCase();
    final subcategory = article.subcategory?.toLowerCase();
    final summary = article.summary.toLowerCase();
    final benefitsAndSources = [...article.benefits, ...article.sources]
        .map((item) => item.toLowerCase())
        .toList();
    final content = article.content.toLowerCase();

    bool inTitle(String term) => title.contains(term);
    bool inCategory(String term) =>
        category.contains(term) || (subcategory?.contains(term) ?? false);
    bool inSummary(String term) => summary.contains(term);
    bool inBenefitsOrSources(String term) =>
        benefitsAndSources.any((item) => item.contains(term));
    bool inContent(String term) => content.contains(term);

    bool inAnyField(String term) =>
        inTitle(term) ||
        inCategory(term) ||
        inSummary(term) ||
        inBenefitsOrSources(term) ||
        inContent(term);

    if (!terms.every(inAnyField)) return null;

    if (terms.any(inTitle)) return 0;
    if (terms.any(inCategory)) return 1;
    if (terms.any(inSummary)) return 2;
    if (terms.any(inBenefitsOrSources)) return 3;
    return 4;
  }
}
