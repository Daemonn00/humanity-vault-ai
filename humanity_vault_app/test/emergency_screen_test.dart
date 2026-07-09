// Widget test for Sprint 10: verifies the Emergency Mode screen lists all
// topics and that a topic's "Learn More" section resolves linked articles.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/emergency/presentation/emergency_category_screen.dart';
import 'package:humanity_vault_app/features/emergency/presentation/emergency_screen.dart';
import 'package:humanity_vault_app/features/library/data/articles_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('lists all emergency topics and shows Learn More links',
      (tester) async {
    await ArticlesRepository.ensureLoaded();

    tester.view.physicalSize = const Size(1080, 3000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MaterialApp(home: EmergencyScreen()));
    await tester.pumpAndSettle();

    const topicNames = [
      'Water',
      'Fire',
      'Medical',
      'Shelter',
      'Communication',
      'Food & Foraging',
      'Security & Defense',
    ];
    for (final name in topicNames) {
      expect(find.text(name), findsOneWidget);
    }

    await tester.tap(find.text('Shelter'));
    await tester.pumpAndSettle();

    expect(find.byType(EmergencyCategoryScreen), findsOneWidget);
    expect(find.text('Learn More'), findsOneWidget);
    expect(find.text('Basic Shelter Construction'), findsOneWidget);
  });

  testWidgets(
      'no terrain selected preserves the baseline topic order',
      (tester) async {
    await ArticlesRepository.ensureLoaded();

    tester.view.physicalSize = const Size(1080, 3000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MaterialApp(home: EmergencyScreen()));
    await tester.pumpAndSettle();

    final titleFinder = find.descendant(
      of: find.byType(GridView),
      matching: find.byType(Text),
    );
    final names = tester
        .widgetList<Text>(titleFinder)
        .map((widget) => widget.data!)
        .toList();

    expect(names, [
      'Water',
      'Fire',
      'Medical',
      'Shelter',
      'Communication',
      'Food & Foraging',
      'Security & Defense',
    ]);
  });

  testWidgets(
      'selecting a terrain reorders topics and all remain visible/tappable',
      (tester) async {
    await ArticlesRepository.ensureLoaded();

    tester.view.physicalSize = const Size(1080, 3000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MaterialApp(home: EmergencyScreen()));
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(ChoiceChip, 'Desert'));
    await tester.pumpAndSettle();

    final titleFinder = find.descendant(
      of: find.byType(GridView),
      matching: find.byType(Text),
    );
    final names = tester
        .widgetList<Text>(titleFinder)
        .map((widget) => widget.data!)
        .toList();

    // Desert's priority order starts with Water, Shelter - Water is
    // already first, so Shelter moving to second position is the
    // observable change from the baseline order.
    expect(names.first, 'Water');
    expect(names[1], 'Shelter');
    expect(names.toSet(), {
      'Water',
      'Fire',
      'Medical',
      'Shelter',
      'Communication',
      'Food & Foraging',
      'Security & Defense',
    });

    for (final name in names) {
      expect(find.text(name), findsOneWidget);
    }
  });

  testWidgets('tapping the selected chip again clears the selection',
      (tester) async {
    await ArticlesRepository.ensureLoaded();

    tester.view.physicalSize = const Size(1080, 3000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MaterialApp(home: EmergencyScreen()));
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(ChoiceChip, 'Desert'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(ChoiceChip, 'Desert'));
    await tester.pumpAndSettle();

    final titleFinder = find.descendant(
      of: find.byType(GridView),
      matching: find.byType(Text),
    );
    final names = tester
        .widgetList<Text>(titleFinder)
        .map((widget) => widget.data!)
        .toList();

    expect(names, [
      'Water',
      'Fire',
      'Medical',
      'Shelter',
      'Communication',
      'Food & Foraging',
      'Security & Defense',
    ]);
  });

  testWidgets(
      'labels the terrain selector and visually marks the selected chip',
      (tester) async {
    await ArticlesRepository.ensureLoaded();

    tester.view.physicalSize = const Size(1080, 3000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MaterialApp(home: EmergencyScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Terrain — optional'), findsOneWidget);

    await tester.tap(find.widgetWithText(ChoiceChip, 'Desert'));
    await tester.pumpAndSettle();

    final desertChip = tester.widget<ChoiceChip>(
      find.widgetWithText(ChoiceChip, 'Desert'),
    );
    final coastalChip = tester.widget<ChoiceChip>(
      find.widgetWithText(ChoiceChip, 'Coastal'),
    );
    expect(desertChip.selected, isTrue);
    expect(coastalChip.selected, isFalse);
  });

  testWidgets('renders without overflow at a narrow 375x812 viewport',
      (tester) async {
    await ArticlesRepository.ensureLoaded();

    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1.0;
    tester.view.padding = const FakeViewPadding(bottom: 48);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPadding);

    await tester.pumpWidget(const MaterialApp(home: EmergencyScreen()));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
  });
}
