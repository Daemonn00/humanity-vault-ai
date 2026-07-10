import '../../library/data/article_search.dart';
import '../../library/models/article.dart';

/// Which field an [AskVaultExcerpt]'s text came from.
enum AskVaultExcerptSource {
  /// [Article.summary], verbatim - Phase A's original, universal default.
  summary,

  /// Exactly one whole, blank-line-delimited paragraph of
  /// [Article.content], verbatim.
  contentParagraph,
}

/// The verbatim text to display for one Ask the Vault result, plus which
/// field it came from - so the UI can show the extra "Best-matching
/// passage" label only when a content paragraph (not the summary) was
/// selected, without ever needing to inspect or alter the text itself.
class AskVaultExcerpt {
  const AskVaultExcerpt({required this.text, required this.source});

  final String text;
  final AskVaultExcerptSource source;
}

/// A paragraph longer than this is never selected - it is treated the
/// same as "no confident pick" and falls back to the summary, since a
/// paragraph this long is more likely to itself span multiple sub-ideas
/// and stops serving as a quick, scannable answer.
const int maxExcerptParagraphWords = 150;

/// Deterministically selects the verbatim text to show for [article]
/// given [terms] - the exact query term set from whichever Phase A
/// search pass (raw or bilingual-normalized) produced this result; see
/// [resolveQueryTerms].
///
/// Never combines fields: the result is always either the article's own
/// summary, or exactly one whole paragraph of its content. Safety-
/// classified articles ([isSafetyClassified] - the caller's own
/// evaluation of ask_vault_safety.dart's `isSafetyClassified(article)`,
/// passed in rather than recomputed here so this file has no dependency
/// on that module) always receive the summary; paragraph scoring is
/// never attempted for them, no exceptions.
AskVaultExcerpt selectExcerpt(
  Article article,
  List<String> terms, {
  required bool isSafetyClassified,
}) {
  if (isSafetyClassified) {
    return AskVaultExcerpt(
      text: article.summary,
      source: AskVaultExcerptSource.summary,
    );
  }

  final paragraphs = _paragraphsOf(article.content);
  if (paragraphs.isEmpty) {
    return AskVaultExcerpt(
      text: article.summary,
      source: AskVaultExcerptSource.summary,
    );
  }

  final distinctTerms = terms.toSet();
  final scores = paragraphs
      .map((paragraph) => _score(paragraph, distinctTerms))
      .toList();
  final maxScore = scores.reduce((a, b) => a > b ? a : b);
  if (maxScore == 0) {
    return AskVaultExcerpt(
      text: article.summary,
      source: AskVaultExcerptSource.summary,
    );
  }

  final winnerIndexes = [
    for (var i = 0; i < scores.length; i++)
      if (scores[i] == maxScore) i,
  ];
  if (winnerIndexes.length > 1) {
    return AskVaultExcerpt(
      text: article.summary,
      source: AskVaultExcerptSource.summary,
    );
  }

  final winningParagraph = paragraphs[winnerIndexes.single];
  if (_wordCount(winningParagraph) > maxExcerptParagraphWords) {
    return AskVaultExcerpt(
      text: article.summary,
      source: AskVaultExcerptSource.summary,
    );
  }

  return AskVaultExcerpt(
    text: winningParagraph,
    source: AskVaultExcerptSource.contentParagraph,
  );
}

/// Splits [content] into blank-line-delimited paragraphs, trimmed, empty
/// blocks dropped.
List<String> _paragraphsOf(String content) {
  return content
      .replaceAll('\r\n', '\n')
      .split(RegExp(r'\n\s*\n'))
      .map((paragraph) => paragraph.trim())
      .where((paragraph) => paragraph.isNotEmpty)
      .toList();
}

int _score(String paragraph, Set<String> distinctTerms) {
  final lower = paragraph.toLowerCase();
  return distinctTerms.where((term) => lower.contains(term)).length;
}

int _wordCount(String text) =>
    text.trim().split(RegExp(r'\s+')).where((w) => w.isNotEmpty).length;

// --- Query term resolution -------------------------------------------
//
// AskVaultSearch.search (ask_vault_search.dart) tries the raw query
// first and only falls back to a bilingual-normalized query if the raw
// pass matches nothing; it does not expose which pass actually produced
// a given result, and that file is out of scope to modify in this
// phase. The functions below re-derive the correct term set for one
// already-known result without needing AskVaultSearch's internals: if
// the raw terms alone already explain why [article] qualifies (a term
// appears in its title/category/subcategory/summary), the raw pass must
// be what matched it, since AskVaultSearch never runs its normalized
// fallback once the raw pass finds anything at all. Otherwise, the
// normalized terms must be what matched instead. The filler-word list
// below is intentionally kept identical to AskVaultSearch's own private
// list; ask_vault_excerpt_test.dart includes a parity check against
// AskVaultSearch.search's real behavior to guard against silent drift
// between the two copies.

const List<String> _fillerWords = [
  // English question/filler words.
  'how', 'do', 'does', 'is', 'are', 'i', 'to', 'the', 'a', 'an', 'in',
  'on', 'at', 'of', 'for', 'my', 'can', 'what', 'should', 'why', 'when',
  'where', 'you', 'please', 'tell', 'me',
  // Indonesian question/filler words.
  'bagaimana', 'cara', 'apa', 'apakah', 'adalah', 'saya', 'ke', 'di',
  'pada', 'dari', 'untuk', 'bisa', 'tolong', 'jelaskan', 'yang', 'itu',
  'ini', 'gimana', 'dong',
];

/// Re-derives which term set - [rawQuery]'s own terms, or its bilingual-
/// normalized fallback - actually explains why [article] is present in
/// an `AskVaultSearch.search(articles, rawQuery)` result.
///
/// The real, unmodified [ArticleSearch.search] is called (not
/// re-implemented) to correctly check whether the raw terms alone would
/// even be considered a match at all - it requires every term to be
/// present somewhere across all of an article's fields, and a short
/// term such as "i" can trivially substring-match inside an unrelated
/// word (e.g. "purification"), so that full gate must be reused
/// verbatim rather than approximated by the narrower title/category/
/// summary check alone.
List<String> resolveQueryTerms(Article article, String rawQuery) {
  final trimmed = rawQuery.trim();
  final rawTerms = _termsOf(trimmed);
  final rawPassMatches = ArticleSearch.search([article], trimmed).isNotEmpty;
  if (rawPassMatches && _matchesTitleCategoryOrSummary(article, rawTerms)) {
    return rawTerms;
  }
  return _termsOf(_normalizeBilingual(trimmed));
}

List<String> _termsOf(String query) => query
    .toLowerCase()
    .split(RegExp(r'\s+'))
    .where((term) => term.isNotEmpty)
    .toList();

String _normalizeBilingual(String query) {
  final terms = query
      .toLowerCase()
      .split(RegExp(r'\s+'))
      .map((term) => term.replaceAll(RegExp(r'^[?!.,;:]+|[?!.,;:]+$'), ''))
      .where((term) => term.isNotEmpty && !_fillerWords.contains(term))
      .toList();
  return terms.join(' ');
}

bool _matchesTitleCategoryOrSummary(Article article, List<String> terms) {
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
