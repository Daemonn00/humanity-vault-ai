// Widget tests for PackLibraryScreen: verifies installed packs (both
// readable and unreadable-manifest ones) are listed, that removal
// requires confirmation, that cancelling a confirmation leaves the
// pack in place, and that confirming actually deletes it from disk
// and updates the list.
//
// PackLibraryScreen reads real files via dart:io (Directory/File),
// which - unlike the bundled-asset loads elsewhere in this app - do
// not complete under flutter_test's default fake-async pump loop.
// Every point where the screen awaits real disk I/O (initial load,
// and the remove action) is followed by `tester.runAsync(...)` to let
// that real async work actually run, then a single `tester.pump()` to
// rebuild with the result. `pumpAndSettle()` is avoided throughout
// since the loading and per-row-removing states show an indeterminate
// CircularProgressIndicator, which never settles.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/library/data/articles_repository.dart';
import 'package:humanity_vault_app/features/packs/presentation/pack_library_screen.dart';

const _validManifest = '''
---
pack_id: test_pack
pack_name: Test Pack
pack_version: 1.0.0
description: A short description.
---
''';

Directory _createPack(
  Directory root,
  String folderName, {
  String? manifest,
}) {
  final packDir = Directory('${root.path}/$folderName')
    ..createSync(recursive: true);
  if (manifest != null) {
    File('${packDir.path}/manifest.md').writeAsStringSync(manifest);
  }
  return packDir;
}

/// Pumps [PackLibraryScreen] for [root] and waits for its initial,
/// real-disk-I/O-backed load to finish.
Future<void> _pumpLibraryScreen(WidgetTester tester, Directory root) async {
  await tester.runAsync(() async {
    await tester.pumpWidget(MaterialApp(
      home: PackLibraryScreen(packsDirectoryOverride: root),
    ));
    await Future<void>.delayed(const Duration(milliseconds: 200));
  });
  await tester.pump();
}

/// Taps [finder] and lets the real disk I/O it triggers (e.g. the
/// Remove action's delete-then-rescan) actually run to completion,
/// then rebuilds. The tap itself must happen inside the same
/// `runAsync` block as the wait - real I/O kicked off from a plain
/// `tester.tap()` outside `runAsync` runs in the fake-async test zone
/// and never resolves, no matter how long is waited afterward.
Future<void> _tapAndAwaitRealIO(WidgetTester tester, Finder finder) async {
  await tester.runAsync(() async {
    await tester.tap(finder);
    for (var i = 0; i < 5; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 200));
    }
  });
  await tester.pump();
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await ArticlesRepository.ensureLoaded();
  });

  testWidgets('shows an empty state when no packs are installed',
      (tester) async {
    final root = Directory.systemTemp.createTempSync('hv_lib_empty_');
    addTearDown(() => root.deleteSync(recursive: true));

    await _pumpLibraryScreen(tester, root);

    expect(find.text('No Knowledge Packs installed yet.'), findsOneWidget);
  });

  testWidgets('lists a readable pack and a pack with an unreadable manifest',
      (tester) async {
    final root = Directory.systemTemp.createTempSync('hv_lib_list_');
    addTearDown(() => root.deleteSync(recursive: true));

    _createPack(root, 'pack_good', manifest: _validManifest);
    _createPack(root, 'pack_bad'); // no manifest.md

    await _pumpLibraryScreen(tester, root);

    expect(find.text('Test Pack'), findsOneWidget);
    expect(find.textContaining('v1.0.0'), findsOneWidget);
    expect(find.text('pack_bad'), findsOneWidget);
    expect(
      find.text('Unreadable pack - its manifest could not be parsed.'),
      findsOneWidget,
    );
  });

  testWidgets('cancelling the confirmation dialog leaves the pack installed',
      (tester) async {
    final root = Directory.systemTemp.createTempSync('hv_lib_cancel_');
    addTearDown(() => root.deleteSync(recursive: true));

    final packDir = _createPack(root, 'pack_keep', manifest: _validManifest);

    await _pumpLibraryScreen(tester, root);

    await tester.tap(find.byTooltip('Remove pack'));
    await tester.pump();
    await tester.pump();

    expect(find.text('Remove Test Pack?'), findsOneWidget);

    await tester.tap(find.text('Cancel'));
    await tester.pump();
    await tester.pump();

    expect(find.text('Test Pack'), findsOneWidget);
    expect(packDir.existsSync(), isTrue);
  });

  testWidgets(
      'confirming removal deletes the pack from disk and updates the list',
      (tester) async {
    final root = Directory.systemTemp.createTempSync('hv_lib_confirm_');
    addTearDown(() {
      if (root.existsSync()) root.deleteSync(recursive: true);
    });

    final packDir =
        _createPack(root, 'pack_remove', manifest: _validManifest);

    await _pumpLibraryScreen(tester, root);

    // The whole tap-dialog-confirm-remove sequence runs inside one
    // runAsync block: an async function's continuation after `await`
    // stays anchored to the zone it started in, so opening the
    // confirmation dialog outside runAsync would leave the later
    // `await PackStorage.removePack(...)` stuck in the fake-async
    // test zone even though the confirming tap itself is wrapped.
    await tester.runAsync(() async {
      await tester.tap(find.byTooltip('Remove pack'));
      await Future<void>.delayed(const Duration(milliseconds: 100));
    });
    await tester.pump();

    await _tapAndAwaitRealIO(tester, find.text('Remove'));
    // A further round: removing kicks off a second real-I/O
    // operation (the post-removal rescan) whose own continuation
    // needs one more bridge into the real zone to finish and rebuild.
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 300)),
    );
    await tester.pump();

    expect(packDir.existsSync(), isFalse);
    expect(find.text('No Knowledge Packs installed yet.'), findsOneWidget);
    expect(find.textContaining('Removed.'), findsOneWidget);
  });
}
