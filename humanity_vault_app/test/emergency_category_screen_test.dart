// Widget test for EmergencyCategoryScreen: verifies the final "Learn
// More" related-article item can be scrolled fully above the Android
// system navigation bar and remains tappable.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/emergency/data/emergency_repository.dart';
import 'package:humanity_vault_app/features/emergency/presentation/emergency_category_screen.dart';
import 'package:humanity_vault_app/features/library/data/articles_repository.dart';
import 'package:humanity_vault_app/features/library/models/article.dart';
import 'package:humanity_vault_app/features/library/presentation/article_detail_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
      'scrolls the final Learn More item fully above the Android system '
      'nav bar and it remains tappable', (tester) async {
    await ArticlesRepository.ensureLoaded();
    // The Water topic has 4 linked article slugs - the longest list of
    // any Emergency topic - giving a meaningful "final item" to check.
    final topic =
        EmergencyRepository().getTopics().firstWhere((t) => t.name == 'Water');

    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1.0;
    tester.view.padding = const FakeViewPadding(bottom: 48);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPadding);

    await tester.pumpWidget(MaterialApp(
      home: EmergencyCategoryScreen(topic: topic),
    ));
    await tester.pumpAndSettle();

    final articlesBySlug = {
      for (final article in ArticlesRepository().getAllArticles())
        article.slug: article,
    };
    final linkedArticles = topic.articleSlugs
        .map((slug) => articlesBySlug[slug])
        .whereType<Article>()
        .toList();
    final finalTitle = linkedArticles.last.title;

    await tester.scrollUntilVisible(find.text(finalTitle), 300.0);
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);

    final tileBottom = tester.getBottomLeft(find.text(finalTitle)).dy;
    const safeVisibleBottom = 812 - 48;
    expect(
      tileBottom,
      lessThan(safeVisibleBottom),
      reason: 'The final Learn More item must sit above the simulated '
          'system navigation bar, with comfortable clearance.',
    );

    await tester.tap(find.text(finalTitle));
    await tester.pumpAndSettle();

    expect(find.byType(ArticleDetailScreen), findsOneWidget);
  });
}
