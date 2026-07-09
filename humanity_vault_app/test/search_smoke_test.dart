// Smoke test for Sprint 9: verifies the Search Knowledge screen returns
// expected results for known title and category queries.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/library/data/article_search.dart';
import 'package:humanity_vault_app/features/library/data/articles_repository.dart';
import 'package:humanity_vault_app/features/library/presentation/article_detail_screen.dart';
import 'package:humanity_vault_app/features/library/presentation/search_screen.dart';
import 'package:humanity_vault_app/shared/widgets/article_index_tile.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await ArticlesRepository.ensureLoaded();
  });

  testWidgets('searching by title returns the matching article',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SearchScreen()));

    await tester.enterText(find.byType(TextField), 'water purification');
    await tester.pumpAndSettle();

    expect(find.text('Water Purification Using Boiling'), findsOneWidget);
  });

  testWidgets('searching by category returns matching articles',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SearchScreen()));

    await tester.enterText(find.byType(TextField), 'construction');
    await tester.pumpAndSettle();

    expect(
        find.text('Simple Structural Building Techniques'), findsOneWidget);
  });

  testWidgets(
      'shows a result count matching the visible results, with category '
      'metadata and no chevrons', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: SearchScreen()));

    await tester.enterText(find.byType(TextField), 'water');
    await tester.pumpAndSettle();

    final matches = ArticleSearch.search(
      ArticlesRepository().getAllArticles(),
      'water',
    ).length;
    final countLabel = matches == 1 ? '1 result' : '$matches results';

    expect(find.text(countLabel), findsOneWidget);
    expect(find.byIcon(Icons.chevron_right), findsNothing);
    // Category metadata remains visible on result rows.
    expect(find.text('Survival'), findsWidgets);
  });

  testWidgets(
      'long titles render without overflow at a narrow 375x812 viewport '
      'and results still open Article Detail', (tester) async {
    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1.0;
    tester.view.padding = const FakeViewPadding(bottom: 48);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPadding);

    await tester.pumpWidget(const MaterialApp(home: SearchScreen()));

    // Longest title in the corpus exercises maxLines/ellipsis safety.
    await tester.enterText(
        find.byType(TextField), 'historical civilization collapse');
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);

    await tester.tap(find.byType(ArticleIndexTile).first);
    await tester.pumpAndSettle();

    expect(find.byType(ArticleDetailScreen), findsOneWidget);
  });
}
