// Basic smoke test for the Humanity Vault AI home screen.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:humanity_vault_app/features/ask_vault/presentation/ask_vault_screen.dart';
import 'package:humanity_vault_app/features/library/data/articles_repository.dart';
import 'package:humanity_vault_app/main.dart';

void main() {
  testWidgets('Home screen shows title, main actions, and library counts',
      (WidgetTester tester) async {
    await ArticlesRepository.ensureLoaded();

    // A generous viewport so all four Home actions lay out without
    // needing to scroll for this basic content assertion.
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const HumanityVaultApp());

    expect(find.text('Humanity Vault AI'), findsWidgets);
    expect(find.text('Browse Categories'), findsOneWidget);
    expect(find.text('Search Knowledge'), findsOneWidget);
    expect(find.text('Emergency Mode'), findsOneWidget);
    expect(find.text('Ask the Vault'), findsOneWidget);
    expect(find.text('11 categories · 31 articles'), findsOneWidget);
  });

  testWidgets(
      'scrolls every Home action fully above the Android system nav bar',
      (WidgetTester tester) async {
    await ArticlesRepository.ensureLoaded();

    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1.0;
    tester.view.padding = const FakeViewPadding(bottom: 48);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPadding);

    await tester.pumpWidget(const HumanityVaultApp());
    await tester.pumpAndSettle();

    const safeVisibleBottom = 812 - 48;
    // Ask the Vault is the newest, most exploratory action, so it is
    // appended after Emergency Mode rather than inserted before it -
    // every card, not just the last, must still clear the nav bar.
    for (final label in [
      'Browse Categories',
      'Search Knowledge',
      'Emergency Mode',
      'Ask the Vault',
    ]) {
      await tester.scrollUntilVisible(find.text(label), 300.0);
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);

      final cardBottom = tester.getBottomLeft(find.text(label)).dy;
      expect(
        cardBottom,
        lessThan(safeVisibleBottom),
        reason: 'The "$label" Home action must sit above the simulated '
            'system navigation bar, with comfortable clearance.',
      );
    }
  });

  testWidgets('tapping Emergency Mode opens the Terrain selector',
      (WidgetTester tester) async {
    await ArticlesRepository.ensureLoaded();
    await tester.pumpWidget(const HumanityVaultApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Emergency Mode'));
    await tester.pumpAndSettle();

    expect(find.text('Terrain — optional'), findsOneWidget);
  });

  testWidgets('tapping Ask the Vault opens the Ask the Vault screen',
      (WidgetTester tester) async {
    await ArticlesRepository.ensureLoaded();
    await tester.pumpWidget(const HumanityVaultApp());
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(find.text('Ask the Vault'), 300.0);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Ask the Vault'));
    await tester.pumpAndSettle();

    expect(find.byType(AskVaultScreen), findsOneWidget);
  });
}
