// Widget test for Sprint 10: verifies the About screen shows the
// project's mission, principles, and library status, and that it is
// reachable from the Home screen's app bar.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/core/theme/app_spacing.dart';
import 'package:humanity_vault_app/features/about/presentation/about_screen.dart';
import 'package:humanity_vault_app/features/library/data/articles_repository.dart';
import 'package:humanity_vault_app/main.dart';
import 'package:humanity_vault_app/shared/widgets/bottom_safe_area.dart';

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

  testWidgets(
      'scrolls the Import Knowledge Pack card fully above the Android '
      'system nav bar and it remains tappable while idle', (tester) async {
    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1.0;
    tester.view.padding = const FakeViewPadding(bottom: 48);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPadding);

    await tester.pumpWidget(const MaterialApp(home: AboutScreen()));
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(
      find.text('Import Knowledge Pack'),
      300.0,
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);

    final cardBottom =
        tester.getBottomLeft(find.text('Import Knowledge Pack')).dy;
    const safeVisibleBottom = 812 - 48;
    expect(
      cardBottom,
      lessThan(safeVisibleBottom),
      reason: 'The Import Knowledge Pack card must sit above the '
          'simulated system navigation bar, with comfortable clearance.',
    );

    // The row is a real, hit-testable InkWell while idle (not disabled).
    final inkWell = tester.widget<InkWell>(
      find.ancestor(
        of: find.text('Import Knowledge Pack'),
        matching: find.byType(InkWell),
      ),
    );
    expect(inkWell.onTap, isNotNull);
  });

  testWidgets(
      'the Import Knowledge Pack row stays fully above the nav bar and is '
      'disabled while in its loading state', (tester) async {
    // ImportPackRow is extracted from AboutScreen specifically so its
    // loading state can be driven directly and deterministically here,
    // rather than depending on the exact async timing of a real file
    // pick (which resolves too fast/unpredictably in the widget test
    // environment to reliably observe mid-flight). Wrapped in the same
    // BottomSafeArea + ListView structure the real screen uses, as the
    // last scrollable item, so the safe-area assertion below reflects
    // the real layout.
    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1.0;
    tester.view.padding = const FakeViewPadding(bottom: 48);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPadding);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BottomSafeArea(
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.screenPadding),
              children: const [
                ImportPackRow(isImporting: true, onTap: null),
              ],
            ),
          ),
        ),
      ),
    );
    // A single pump, not pumpAndSettle: CircularProgressIndicator
    // animates indefinitely, so pumpAndSettle would never terminate.
    // Nothing here is mid-transition - the widget is constructed
    // directly in its loading state - so one frame is sufficient.
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byIcon(Icons.chevron_right), findsNothing);

    final rowBottom =
        tester.getBottomLeft(find.text('Import Knowledge Pack')).dy;
    const safeVisibleBottom = 812 - 48;
    expect(
      rowBottom,
      lessThan(safeVisibleBottom),
      reason: 'The row must stay above the simulated system navigation '
          'bar even while showing the loading spinner.',
    );

    final inkWell = tester.widget<InkWell>(find.byType(InkWell));
    expect(inkWell.onTap, isNull, reason: 'Disabled while importing.');
  });
}
