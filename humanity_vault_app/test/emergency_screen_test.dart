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
}
