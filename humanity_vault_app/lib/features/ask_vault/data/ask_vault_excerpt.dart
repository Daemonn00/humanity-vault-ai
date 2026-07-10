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
/// search pass (raw or bilingual-normalized) produced this result. The
/// caller is expected to supply this directly from
/// AskVaultSearchResponse.matchedTerms (ask_vault_search.dart) - the
/// single source of truth for which terms actually matched; this file
/// has no dependency on that module and never re-derives terms itself.
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
