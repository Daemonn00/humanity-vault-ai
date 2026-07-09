// Widget test for Sprint 10: verifies the Article List screen shows a
// category's articles and opens the Article Detail screen on tap.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/library/data/articles_repository.dart';
import 'package:humanity_vault_app/features/library/data/categories_repository.dart';
import 'package:humanity_vault_app/features/library/presentation/article_detail_screen.dart';
import 'package:humanity_vault_app/features/library/presentation/article_list_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('lists articles for a category and opens article detail',
      (tester) async {
    await ArticlesRepository.ensureLoaded();
    final survival = CategoriesRepository()
        .getCategories()
        .firstWhere((c) => c.folderName == 'survival');

    await tester.pumpWidget(MaterialApp(
      home: ArticleListScreen(category: survival),
    ));
    await tester.pumpAndSettle();

    expect(
        find.text('Basic Navigation Without GPS or Compass'), findsOneWidget);

    await tester.tap(find.text('Basic Navigation Without GPS or Compass'));
    await tester.pumpAndSettle();

    expect(find.byType(ArticleDetailScreen), findsOneWidget);
  });

  testWidgets(
      'shows 01..N index markers in order, without chevrons, '
      'and renders safely on a narrow phone with a system-nav inset',
      (tester) async {
    await ArticlesRepository.ensureLoaded();
    final survival = CategoriesRepository()
        .getCategories()
        .firstWhere((c) => c.folderName == 'survival');
    final articles = ArticlesRepository().getArticles(survival.folderName);

    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1.0;
    tester.view.padding = const FakeViewPadding(bottom: 48);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPadding);

    await tester.pumpWidget(MaterialApp(
      home: ArticleListScreen(category: survival),
    ));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.chevron_right), findsNothing);

    // Scroll through the whole list and confirm every index marker
    // appears in the existing article order.
    for (var i = 0; i < articles.length; i++) {
      final marker = (i + 1).toString().padLeft(2, '0');
      await tester.scrollUntilVisible(
        find.text(marker),
        200,
        scrollable: find.byType(Scrollable),
      );
      expect(find.text(marker), findsOneWidget,
          reason: 'index marker $marker should render for '
              '${articles[i].title}');
    }

    expect(tester.takeException(), isNull);
  });
}
