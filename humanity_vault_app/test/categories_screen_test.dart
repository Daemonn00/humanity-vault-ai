// Widget test for Sprint 10: verifies the Browse Categories screen lists
// all categories and navigates to a category's article list.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/library/data/articles_repository.dart';
import 'package:humanity_vault_app/features/library/presentation/article_list_screen.dart';
import 'package:humanity_vault_app/features/library/presentation/categories_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('lists all categories and opens an article list on tap',
      (tester) async {
    await ArticlesRepository.ensureLoaded();

    tester.view.physicalSize = const Size(1080, 3000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MaterialApp(home: CategoriesScreen()));
    await tester.pumpAndSettle();

    const categoryNames = [
      'Survival',
      'Medicine',
      'Agriculture',
      'Engineering',
      'Electronics',
      'Construction',
      'History',
      'Philosophy',
      'Islam',
      'Local Wisdom',
      'Communication',
    ];
    for (final name in categoryNames) {
      expect(find.text(name), findsOneWidget);
    }

    await tester.tap(find.text('Survival'));
    await tester.pumpAndSettle();

    expect(find.byType(ArticleListScreen), findsOneWidget);
  });

  testWidgets(
      'scrolls the final category fully above the Android system nav bar '
      'on a narrow phone viewport', (tester) async {
    await ArticlesRepository.ensureLoaded();

    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1.0;
    // Simulate a typical Android 3-button navigation bar inset.
    tester.view.padding = const FakeViewPadding(bottom: 48);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPadding);

    await tester.pumpWidget(const MaterialApp(home: CategoriesScreen()));
    await tester.pumpAndSettle();

    await tester.drag(find.byType(GridView), const Offset(0, -2000));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.text('Communication'), findsOneWidget);

    final cardBottom = tester.getBottomLeft(find.text('Communication')).dy;
    final safeVisibleBottom = 812 - 48;
    expect(
      cardBottom,
      lessThan(safeVisibleBottom),
      reason: 'The last category card must sit above the simulated system '
          'navigation bar, with comfortable clearance, not just a few px.',
    );
  });
}
