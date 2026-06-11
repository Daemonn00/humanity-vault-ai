// Smoke test for Sprint 9: verifies manually-curated related_articles
// links resolve to real articles via ArticlesRepository.getRelatedArticles.

import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/library/data/articles_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('basic_shelter_construction related articles resolve', () async {
    await ArticlesRepository.ensureLoaded();
    final repo = ArticlesRepository();
    final article = repo
        .getAllArticles()
        .firstWhere((a) => a.slug == 'basic_shelter_construction');

    final relatedSlugs =
        repo.getRelatedArticles(article).map((a) => a.slug).toSet();

    expect(relatedSlugs, contains('simple_structural_building_techniques'));
    expect(relatedSlugs, contains('basic_hand_tools_and_their_uses'));
  });
}
