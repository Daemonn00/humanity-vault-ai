// Basic smoke test for the Humanity Vault AI home screen.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:humanity_vault_app/features/library/data/articles_repository.dart';
import 'package:humanity_vault_app/main.dart';

void main() {
  testWidgets('Home screen shows title, main actions, and library counts',
      (WidgetTester tester) async {
    await ArticlesRepository.ensureLoaded();
    await tester.pumpWidget(const HumanityVaultApp());

    expect(find.text('Humanity Vault AI'), findsWidgets);
    expect(find.text('Browse Categories'), findsOneWidget);
    expect(find.text('Search Knowledge'), findsOneWidget);
    expect(find.text('Emergency Mode'), findsOneWidget);
    expect(find.text('11 categories · 31 articles'), findsOneWidget);
  });

  testWidgets(
      'scrolls the final Emergency Mode action fully above the Android '
      'system nav bar and it remains tappable', (WidgetTester tester) async {
    await ArticlesRepository.ensureLoaded();

    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1.0;
    tester.view.padding = const FakeViewPadding(bottom: 48);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPadding);

    await tester.pumpWidget(const HumanityVaultApp());
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(find.text('Emergency Mode'), 300.0);
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);

    final cardBottom = tester.getBottomLeft(find.text('Emergency Mode')).dy;
    const safeVisibleBottom = 812 - 48;
    expect(
      cardBottom,
      lessThan(safeVisibleBottom),
      reason: 'The final Home screen action must sit above the '
          'simulated system navigation bar, with comfortable clearance.',
    );

    await tester.tap(find.text('Emergency Mode'));
    await tester.pumpAndSettle();

    expect(find.text('Terrain — optional'), findsOneWidget);
  });
}
