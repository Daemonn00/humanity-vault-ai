// Smoke test for Sprint 9: verifies every Emergency Mode articleSlugs
// entry resolves to a real article in ArticlesRepository.

import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/emergency/data/emergency_repository.dart';
import 'package:humanity_vault_app/features/library/data/articles_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('every emergency topic articleSlug resolves to a known article',
      () async {
    await ArticlesRepository.ensureLoaded();
    final knownSlugs =
        ArticlesRepository().getAllArticles().map((a) => a.slug).toSet();

    for (final topic in EmergencyRepository.topics) {
      for (final slug in topic.articleSlugs) {
        expect(
          knownSlugs.contains(slug),
          isTrue,
          reason: '${topic.name} references unknown article slug "$slug"',
        );
      }
    }
  });
}
