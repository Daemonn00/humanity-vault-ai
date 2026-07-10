// Widget tests for AskVaultScreen: verifies the idle, results, and
// no-supported-answer states render correctly, that results link to the
// exact source article, that the universal "Exact source text" and the
// additional safety marker appear, that a body-fragment/tier-3/4-only
// match never surfaces as a result, and that submitting a new query
// replaces the prior result outright (no accumulated history).

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/ask_vault/presentation/ask_vault_screen.dart';
import 'package:humanity_vault_app/features/library/data/articles_repository.dart';
import 'package:humanity_vault_app/features/library/presentation/article_detail_screen.dart';
import 'package:humanity_vault_app/features/library/presentation/search_screen.dart';
import 'package:humanity_vault_app/features/packs/data/packs_loader.dart';

Future<void> _installPack(
  Directory root,
  String folderName,
  Map<String, String> articlesByRelativePath,
) async {
  final packDir = Directory('${root.path}/$folderName')
    ..createSync(recursive: true);
  File('${packDir.path}/manifest.md').writeAsStringSync('''
---
pack_id: ${folderName}_pack
pack_name: ${folderName}_pack
pack_version: 1.0.0
---
''');
  articlesByRelativePath.forEach((relativePath, content) {
    final file = File('${packDir.path}/$relativePath');
    file.parent.createSync(recursive: true);
    file.writeAsStringSync(content);
  });
  await PacksLoader.loadPacksFrom(root);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await ArticlesRepository.ensureLoaded();
  });

  testWidgets('shows the idle/prompt state before any query is submitted',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(home: AskVaultScreen()));

    expect(
      find.text(
        'Ask a question to find exact matching passages already written '
        'in the Vault.',
      ),
      findsOneWidget,
    );
    expect(
      find.text('I could not find a supported answer in this Vault.'),
      findsNothing,
    );
  });

  testWidgets(
      'shows a result with title, category, verbatim summary excerpt, '
      'the Exact source text label, and an Open source action, and it '
      'carries the additional Safety-related marker', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: AskVaultScreen()));

    await tester.enterText(
      find.byType(TextField),
      'water purification using boiling',
    );
    await tester.tap(find.text('Ask'));
    await tester.pump();

    expect(find.text('Water Purification Using Boiling'), findsOneWidget);
    expect(find.text('Exact source text'), findsWidgets);
    expect(find.text('Open source'), findsWidgets);
    // Survival-category content is safety-classified.
    expect(
      find.text('Safety-related - read the full article before acting'),
      findsWidgets,
    );
  });

  testWidgets(
      'tapping Open source navigates to ArticleDetailScreen for the '
      'exact matching article', (tester) async {
    // A generous viewport so the matched result's "Open source" button
    // is laid out on-screen without needing a scroll first.
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MaterialApp(home: AskVaultScreen()));

    await tester.enterText(
      find.byType(TextField),
      'water purification using boiling',
    );
    await tester.tap(find.text('Ask'));
    await tester.pump();

    // The query may return more than one eligible result, so the "Open
    // source" button belonging specifically to the Water Purification
    // tile is targeted, rather than assuming it is the first result.
    final resultCard = find.ancestor(
      of: find.text('Water Purification Using Boiling'),
      matching: find.byType(Card),
    );
    await tester.tap(
      find.descendant(of: resultCard, matching: find.text('Open source')),
    );
    await tester.pumpAndSettle();

    expect(find.byType(ArticleDetailScreen), findsOneWidget);
    expect(find.text('Water Purification Using Boiling'), findsWidgets);
  });

  testWidgets(
      'shows the no-supported-answer message and a working link to '
      'Search Knowledge when nothing eligible matches', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: AskVaultScreen()));

    await tester.enterText(
      find.byType(TextField),
      'zzz_nonexistent_query_term_12345',
    );
    await tester.tap(find.text('Ask'));
    await tester.pump();

    expect(
      find.text('I could not find a supported answer in this Vault.'),
      findsOneWidget,
    );

    await tester.tap(find.text('Search Knowledge instead'));
    await tester.pumpAndSettle();

    expect(find.byType(SearchScreen), findsOneWidget);
  });

  testWidgets(
      'a query matching only tier 3/4 content shows the '
      'no-supported-answer state, not a body-fragment result',
      (tester) async {
    final root = Directory.systemTemp.createTempSync('hv_ask_screen_tier4_');
    addTearDown(() => root.deleteSync(recursive: true));

    // Real dart:io calls inside a testWidgets body do not complete under
    // plain pump() - they must run inside tester.runAsync().
    await tester.runAsync(() => _installPack(root, 'tier4_only_pack', {
          'survival/tier4_only_ask_screen_slug.md': '''
---
title: Untitled Tier Four Fixture
category: Survival
---
## Summary
Unrelated summary with no shared term at all.
## Main Content
Mentions zzzqqqtierfouronly only in the body content.
''',
        }));

    await tester.pumpWidget(const MaterialApp(home: AskVaultScreen()));

    await tester.enterText(find.byType(TextField), 'zzzqqqtierfouronly');
    await tester.tap(find.text('Ask'));
    await tester.pump();

    expect(
      find.text('I could not find a supported answer in this Vault.'),
      findsOneWidget,
    );
    expect(find.text('Untitled Tier Four Fixture'), findsNothing);
  });

  testWidgets(
      'submitting a second, different query replaces the shown results '
      'outright - no accumulated history is rendered', (tester) async {
    final root = Directory.systemTemp.createTempSync('hv_ask_screen_hist_');
    addTearDown(() => root.deleteSync(recursive: true));

    await tester.runAsync(() => _installPack(root, 'history_test_pack', {
          'survival/ask_screen_history_slug_a.md': '''
---
title: Ask Screen History Fixture Alpha
category: Survival
---
## Summary
A short summary about zzzqqqhistoryalpha.
''',
          'survival/ask_screen_history_slug_b.md': '''
---
title: Ask Screen History Fixture Beta
category: Survival
---
## Summary
A short summary about zzzqqqhistorybeta.
''',
        }));

    await tester.pumpWidget(const MaterialApp(home: AskVaultScreen()));

    await tester.enterText(find.byType(TextField), 'zzzqqqhistoryalpha');
    await tester.tap(find.text('Ask'));
    await tester.pump();
    expect(find.text('Ask Screen History Fixture Alpha'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'zzzqqqhistorybeta');
    await tester.tap(find.text('Ask'));
    await tester.pump();

    expect(find.text('Ask Screen History Fixture Beta'), findsOneWidget);
    expect(find.text('Ask Screen History Fixture Alpha'), findsNothing);
  });

  testWidgets(
      'the bottom-most result clears the Android system nav bar at '
      '375x812 with a 48px inset', (tester) async {
    final root = Directory.systemTemp.createTempSync('hv_ask_screen_safe_');
    addTearDown(() => root.deleteSync(recursive: true));

    await tester.runAsync(() => _installPack(root, 'safe_area_test_pack', {
          for (var i = 0; i < 3; i++)
            'survival/ask_screen_safe_area_slug_$i.md': '''
---
title: Ask Screen Safe Area Fixture $i
category: Survival
---
## Summary
A short summary about zzzqqqsafearea number $i.
''',
        }));

    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1.0;
    tester.view.padding = const FakeViewPadding(bottom: 48);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPadding);

    await tester.pumpWidget(const MaterialApp(home: AskVaultScreen()));

    await tester.enterText(find.byType(TextField), 'zzzqqqsafearea');
    await tester.tap(find.text('Ask'));
    await tester.pump();

    expect(tester.takeException(), isNull);

    // AskVaultScreen has two Scrollable widgets (the TextField's internal
    // EditableText plus the results ListView), so the results list's
    // Scrollable must be given explicitly - scrollUntilVisible's default
    // auto-detection throws "too many elements" otherwise.
    await tester.scrollUntilVisible(
      find.text('Ask Screen Safe Area Fixture 2'),
      300.0,
      scrollable: find.byType(Scrollable).last,
    );
    await tester.pump();

    final tileBottom =
        tester.getBottomLeft(find.text('Ask Screen Safe Area Fixture 2')).dy;
    const safeVisibleBottom = 812 - 48;
    expect(
      tileBottom,
      lessThan(safeVisibleBottom),
      reason: 'The bottom-most Ask the Vault result must sit above the '
          'simulated system navigation bar, with comfortable clearance.',
    );
  });
}
