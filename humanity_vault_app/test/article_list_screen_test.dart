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
}
