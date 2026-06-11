// Widget test for Sprint 10: verifies the Article Detail screen renders
// all content sections and resolves Related Knowledge links.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/library/data/articles_repository.dart';
import 'package:humanity_vault_app/features/library/presentation/article_detail_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('renders article sections and related knowledge links',
      (tester) async {
    await ArticlesRepository.ensureLoaded();
    final article = ArticlesRepository()
        .getAllArticles()
        .firstWhere((a) => a.slug == 'basic_shelter_construction');

    await tester.pumpWidget(MaterialApp(
      home: ArticleDetailScreen(article: article),
    ));
    await tester.pumpAndSettle();

    expect(find.text('Basic Shelter Construction'), findsWidgets);

    for (final heading in [
      'Summary',
      'Main Content',
      'Benefits',
      'Sources',
      'Related Knowledge',
    ]) {
      await tester.scrollUntilVisible(find.text(heading), 400.0);
      expect(find.text(heading), findsOneWidget);
    }

    for (final relatedTitle in [
      'Basic Hand Tools and Their Uses',
      'Basic Navigation Without GPS or Compass',
      'Simple Structural Building Techniques',
    ]) {
      await tester.scrollUntilVisible(find.text(relatedTitle), 200.0);
      expect(find.text(relatedTitle), findsOneWidget);
    }
  });
}
