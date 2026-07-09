// Widget test for Sprint 10: verifies the About screen shows the
// project's mission, principles, and library status, and that it is
// reachable from the Home screen's app bar.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/about/presentation/about_screen.dart';
import 'package:humanity_vault_app/features/library/data/articles_repository.dart';
import 'package:humanity_vault_app/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await ArticlesRepository.ensureLoaded();
  });

  testWidgets('shows mission, core principles, and library status',
      (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MaterialApp(home: AboutScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Humanity Vault AI'), findsOneWidget);
    expect(find.text('Mission'), findsOneWidget);
    expect(find.text('Core Principles'), findsOneWidget);
    expect(find.text('Offline & Private'), findsOneWidget);
    expect(find.text('Offline First'), findsOneWidget);
    expect(
      find.textContaining('11 categories · 31 articles'),
      findsOneWidget,
    );
    expect(find.text('Knowledge Packs'), findsOneWidget);
    expect(find.text('Import Knowledge Pack'), findsOneWidget);
  });

  testWidgets('is reachable from the Home screen app bar', (tester) async {
    await tester.pumpWidget(const HumanityVaultApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('About'));
    await tester.pumpAndSettle();

    expect(find.byType(AboutScreen), findsOneWidget);
    expect(find.text('Mission'), findsOneWidget);
  });
}
