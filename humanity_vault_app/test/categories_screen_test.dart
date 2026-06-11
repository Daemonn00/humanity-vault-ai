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
}
