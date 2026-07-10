import '../../library/data/article_search.dart';
import '../../library/models/article.dart';

/// Retrieval-only "Ask the Vault" search: a single-turn layer over the
/// existing [ArticleSearch], never modifying it.
///
/// Every result is guaranteed to carry a non-empty, verbatim
/// [Article.summary] and to have earned what [ArticleSearch] itself
/// treats as a title/category/summary-tier match - callers never see a
/// body-fragment, bullet-only, or fabricated answer.
class AskVaultSearch {
  AskVaultSearch._();

  static const int maxResults = 3;

  static const List<String> _fillerWords = [
    // English question/filler words.
    'how', 'do', 'does', 'is', 'are', 'i', 'to', 'the', 'a', 'an', 'in',
    'on', 'at', 'of', 'for', 'my', 'can', 'what', 'should', 'why', 'when',
    'where', 'you', 'please', 'tell', 'me',
    // Indonesian question/filler words.
    'bagaimana', 'cara', 'apa', 'apakah', 'adalah', 'saya', 'ke', 'di',
    'pada', 'dari', 'untuk', 'bisa', 'tolong', 'jelaskan', 'yang', 'itu',
    'ini', 'gimana', 'dong',
  ];

  /// Returns up to [maxResults] articles that directly answer [rawQuery],
  /// or an empty list if nothing in the Vault supports an answer.
  ///
  /// Pass 1 searches [rawQuery] as typed. Only if that yields no eligible
  /// result does pass 2 strip a small fixed list of English/Indonesian
  /// filler words and search again - [ArticleSearch.search] itself is
  /// called unchanged in both passes.
  static List<Article> search(List<Article> articles, String rawQuery) {
    final trimmed = rawQuery.trim();
    if (trimmed.isEmpty) return const [];

    final rawTerms = _termsOf(trimmed);
    final firstPass = _eligible(
      ArticleSearch.search(articles, trimmed),
      rawTerms,
    );
    if (firstPass.isNotEmpty) {
      return firstPass.take(maxResults).toList();
    }

    final normalized = _normalizeBilingual(trimmed);
    if (normalized.isEmpty) return const [];

    final normalizedTerms = _termsOf(normalized);
    final secondPass = _eligible(
      ArticleSearch.search(articles, normalized),
      normalizedTerms,
    );
    return secondPass.take(maxResults).toList();
  }

  static List<String> _termsOf(String query) => query
      .toLowerCase()
      .split(RegExp(r'\s+'))
      .where((term) => term.isNotEmpty)
      .toList();

  /// Strips leading/trailing punctuation and drops any term that
  /// exact-matches [_fillerWords], rejoining the survivors with a single
  /// space. Returns an empty string if nothing meaningful survives.
  static String _normalizeBilingual(String query) {
    final terms = query
        .toLowerCase()
        .split(RegExp(r'\s+'))
        .map((term) => term.replaceAll(RegExp(r'^[?!.,;:]+|[?!.,;:]+$'), ''))
        .where((term) => term.isNotEmpty && !_fillerWords.contains(term))
        .toList();
    return terms.join(' ');
  }

  /// Keeps only results that earned a title/category/subcategory/summary
  /// match for at least one of [terms] (mirroring ArticleSearch's own
  /// tier 0-2 boundary without touching its private tiering) and that
  /// carry a non-empty summary suitable for verbatim display.
  static List<Article> _eligible(
    List<Article> searchResults,
    List<String> terms,
  ) {
    return searchResults
        .where((article) => _hasUsableSummary(article))
        .where((article) => _isTitleCategoryOrSummaryMatch(article, terms))
        .toList();
  }

  static bool _hasUsableSummary(Article article) =>
      article.summary.trim().isNotEmpty;

  /// Re-derives, from Article's own public fields, whether [article]
  /// would have earned ArticleSearch's tier 0, 1, or 2 for [terms] - i.e.
  /// whether at least one term appears in title, category/subcategory, or
  /// summary - as opposed to only benefits/sources (tier 3) or content
  /// (tier 4). By the time this runs, ArticleSearch.search has already
  /// guaranteed every term in [terms] is present somewhere in the
  /// article; this only narrows down whether that guarantee is satisfied
  /// via one of the three fields Ask the Vault is allowed to surface.
  static bool _isTitleCategoryOrSummaryMatch(
    Article article,
    List<String> terms,
  ) {
    final title = article.title.toLowerCase();
    final category = article.category.toLowerCase();
    final subcategory = article.subcategory?.toLowerCase();
    final summary = article.summary.toLowerCase();

    bool inTitle(String term) => title.contains(term);
    bool inCategory(String term) =>
        category.contains(term) || (subcategory?.contains(term) ?? false);
    bool inSummary(String term) => summary.contains(term);

    return terms.any(inTitle) || terms.any(inCategory) || terms.any(inSummary);
  }
}
