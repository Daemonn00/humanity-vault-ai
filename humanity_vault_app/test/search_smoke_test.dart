// Smoke test for Sprint 9: verifies the Search Knowledge screen returns
// expected results for known title and category queries.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/library/data/articles_repository.dart';
import 'package:humanity_vault_app/features/library/presentation/search_screen.dart';

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
}
