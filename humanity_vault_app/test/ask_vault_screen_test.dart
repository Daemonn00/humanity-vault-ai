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

String _plainTextOf(List<TextSpan> spans) =>
    spans.map((span) => span.text ?? '').join();

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

  group('buildHighlightedSpans', () {
    test('reconstructs the exact original text', () {
      const text = 'Purify water by boiling it for at least one minute.';
      final spans = buildHighlightedSpans(
        text: text,
        terms: const ['water', 'boiling'],
        baseStyle: null,
        highlightStyle: null,
      );

      expect(_plainTextOf(spans), text);
    });

    test('a whole-word match is highlighted with the given style', () {
      const highlightStyle = TextStyle(fontWeight: FontWeight.w700);
      final spans = buildHighlightedSpans(
        text: 'Please start the fire safely.',
        terms: const ['start'],
        baseStyle: null,
        highlightStyle: highlightStyle,
      );

      expect(
        spans.any((s) => s.text == 'start' && s.style == highlightStyle),
        isTrue,
      );
    });

    test('whole-word rule: "art" does not highlight inside "start"', () {
      const highlightStyle = TextStyle(fontWeight: FontWeight.w700);
      final spans = buildHighlightedSpans(
        text: 'Please start the fire safely.',
        terms: const ['art'],
        baseStyle: null,
        highlightStyle: highlightStyle,
      );

      // No span isolates "art" as its own highlighted piece, and the
      // plain text is still reconstructed exactly (nothing was split
      // out of "start").
      expect(
        spans.any((s) => s.text == 'art' && s.style == highlightStyle),
        isFalse,
      );
      expect(
        _plainTextOf(spans),
        'Please start the fire safely.',
      );
    });

    test('matching is case-insensitive', () {
      const highlightStyle = TextStyle(fontWeight: FontWeight.w700);
      final spans = buildHighlightedSpans(
        text: 'WATER is essential.',
        terms: const ['water'],
        baseStyle: null,
        highlightStyle: highlightStyle,
      );

      expect(
        spans.any((s) => s.text == 'WATER' && s.style == highlightStyle),
        isTrue,
      );
    });

    test('an empty term list renders one plain span with the base style',
        () {
      const baseStyle = TextStyle(fontWeight: FontWeight.w400);
      final spans = buildHighlightedSpans(
        text: 'No terms to highlight here.',
        terms: const [],
        baseStyle: baseStyle,
        highlightStyle: null,
      );

      expect(spans, [const TextSpan(text: 'No terms to highlight here.', style: baseStyle)]);
    });
  });

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

  testWidgets(
      'a safety-classified article always shows the summary, never the '
      '"Best-matching passage" label, even with a perfect body match',
      (tester) async {
    final root = Directory.systemTemp.createTempSync('hv_ask_screen_safety_');
    addTearDown(() => root.deleteSync(recursive: true));

    const summaryText = 'A short safety-classified summary, unrelated.';
    await tester.runAsync(() => _installPack(root, 'phase_b_safety_pack', {
          'medicine/phase_b_safety_slug.md': '''
---
title: Zzzqqqsafetyterm Fixture
category: Medicine
---
## Summary
$summaryText
## Main Content
An unrelated first paragraph.

A paragraph clearly and only about zzzqqqsafetyterm.

An unrelated third paragraph.
''',
        }));

    await tester.pumpWidget(const MaterialApp(home: AskVaultScreen()));

    await tester.enterText(find.byType(TextField), 'zzzqqqsafetyterm');
    await tester.tap(find.text('Ask'));
    await tester.pump();

    expect(find.text('Zzzqqqsafetyterm Fixture'), findsOneWidget);
    expect(find.text(summaryText), findsOneWidget);
    expect(
      find.text('Best-matching passage (not the full article)'),
      findsNothing,
    );
    expect(
      find.text('Safety-related - read the full article before acting'),
      findsOneWidget,
    );
  });

  testWidgets(
      'a non-safety article with a clear unique paragraph winner shows '
      'that passage and the "Best-matching passage" label', (tester) async {
    final root =
        Directory.systemTemp.createTempSync('hv_ask_screen_nonsafety_');
    addTearDown(() => root.deleteSync(recursive: true));

    const winningParagraph =
        'A paragraph clearly and only about zzzqqqnonsafetyterm.';
    await tester.runAsync(() => _installPack(root, 'phase_b_nonsafety_pack', {
          'communication/phase_b_nonsafety_slug.md': '''
---
title: Zzzqqqnonsafetyterm Fixture
category: Communication
---
## Summary
An unrelated summary that does not mention the unique term.
## Main Content
An unrelated first paragraph about general communication basics.

$winningParagraph

An unrelated third paragraph about something else entirely.
''',
        }));

    await tester.pumpWidget(const MaterialApp(home: AskVaultScreen()));

    await tester.enterText(find.byType(TextField), 'zzzqqqnonsafetyterm');
    await tester.tap(find.text('Ask'));
    await tester.pump();

    expect(find.text('Zzzqqqnonsafetyterm Fixture'), findsOneWidget);
    expect(find.text(winningParagraph), findsOneWidget);
    expect(
      find.text('Best-matching passage (not the full article)'),
      findsOneWidget,
    );
    expect(
      find.text('Safety-related - read the full article before acting'),
      findsNothing,
    );
    // The excerpt still carries the universal verbatim label.
    expect(find.text('Exact source text'), findsOneWidget);
  });

  testWidgets(
      'a taller card from a longer content excerpt still clears the '
      'Android system nav bar at 375x812 with a 48px inset, and Open '
      'source still works', (tester) async {
    final root =
        Directory.systemTemp.createTempSync('hv_ask_screen_longexcerpt_');
    addTearDown(() => root.deleteSync(recursive: true));

    final longWinningParagraph =
        '${List.generate(60, (i) => 'word$i').join(' ')} '
        'zzzqqqlongexcerptterm.';
    await tester.runAsync(() => _installPack(root, 'phase_b_long_pack', {
          'communication/phase_b_long_slug.md': '''
---
title: Zzzqqqlongexcerptterm Fixture
category: Communication
---
## Summary
An unrelated short summary.
## Main Content
An unrelated first paragraph.

$longWinningParagraph

An unrelated third paragraph.
''',
        }));

    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1.0;
    tester.view.padding = const FakeViewPadding(bottom: 48);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPadding);

    await tester.pumpWidget(const MaterialApp(home: AskVaultScreen()));

    await tester.enterText(find.byType(TextField), 'zzzqqqlongexcerptterm');
    await tester.tap(find.text('Ask'));
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(find.text(longWinningParagraph), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('Open source'),
      300.0,
      scrollable: find.byType(Scrollable).last,
    );
    await tester.pump();

    final buttonBottom = tester.getBottomLeft(find.text('Open source')).dy;
    const safeVisibleBottom = 812 - 48;
    expect(
      buttonBottom,
      lessThan(safeVisibleBottom),
      reason: 'The taller result card must still sit above the simulated '
          'system navigation bar, with comfortable clearance.',
    );

    await tester.tap(find.text('Open source'));
    await tester.pumpAndSettle();

    expect(find.byType(ArticleDetailScreen), findsOneWidget);
  });

  testWidgets(
      'highlighting uses the response\'s supplied matchedTerms, not raw '
      'query terms: a filler word stripped by bilingual normalization is '
      'never highlighted, even though it appears literally in the text',
      (tester) async {
    final root = Directory.systemTemp.createTempSync('hv_ask_screen_filler_');
    addTearDown(() => root.deleteSync(recursive: true));

    const summaryText = 'The zzzqqqfillertest is clearly explained here.';
    await tester.runAsync(() => _installPack(root, 'phase_b1_filler_pack', {
          'communication/phase_b1_filler_slug.md': '''
---
title: Zzzqqqfillertest Fixture
category: Communication
---
## Summary
$summaryText
''',
        }));

    await tester.pumpWidget(const MaterialApp(home: AskVaultScreen()));

    // "how"/"do"/"i" appear nowhere in the fixture, so the raw pass
    // matches nothing and AskVaultSearch falls back to the bilingual-
    // normalized query, whose only surviving term is "zzzqqqfillertest".
    await tester.enterText(
      find.byType(TextField),
      'how do i zzzqqqfillertest',
    );
    await tester.tap(find.text('Ask'));
    await tester.pump();

    expect(find.text('Zzzqqqfillertest Fixture'), findsOneWidget);

    final richText = tester
        .widgetList<RichText>(find.byType(RichText))
        .firstWhere((rt) => rt.text.toPlainText() == summaryText);
    // Text.rich(mySpan) wraps mySpan inside an additional outer TextSpan
    // that Flutter's own Text widget creates to carry the effective
    // style, so the actual highlight spans built by buildHighlightedSpans
    // are one level deeper than RichText.text itself.
    final outerSpan = richText.text as TextSpan;
    final mySpan = outerSpan.children!.single as TextSpan;
    final children = mySpan.children!.cast<TextSpan>();

    bool isBold(TextSpan span) => span.style?.fontWeight == FontWeight.w700;

    expect(
      children.any((c) => c.text == 'zzzqqqfillertest' && isBold(c)),
      isTrue,
      reason: 'The normalized term supplied by AskVaultSearchResponse '
          'must be highlighted.',
    );
    expect(
      children.any(
        (c) => (c.text == 'The' || c.text == 'is') && isBold(c),
      ),
      isFalse,
      reason: 'A filler word stripped during normalization must never be '
          'highlighted, even though it appears literally in the summary.',
    );
  });
}
