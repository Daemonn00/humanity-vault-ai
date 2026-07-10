import '../../emergency/data/emergency_repository.dart';
import '../../library/models/article.dart';

/// Identifies articles whose content is safety-relevant, so
/// AskVaultScreen can show an additional, clearly visible marker.
///
/// This has no effect on which articles are matched or what text is
/// shown - the excerpt and eligibility rules in [AskVaultSearch] are
/// already verbatim-only and uniform for every article regardless of
/// this classification. It exists purely to surface an extra label for
/// safety-relevant results.
bool isSafetyClassified(Article article) {
  const safetyTerms = ['medicine', 'survival', 'security', 'hunting', 'foraging'];
  final category = article.category.toLowerCase();
  final subcategory = article.subcategory?.toLowerCase() ?? '';
  if (safetyTerms.any(
    (term) => category.contains(term) || subcategory.contains(term),
  )) {
    return true;
  }

  return EmergencyRepository().getTopics().any(
    (topic) => topic.articleSlugs.contains(article.slug),
  );
}
