// Widget tests for VaultHubScreen: verifies the approved offline-first
// load sequence (cache renders immediately, background refresh updates
// in place, a failed refresh keeps the cached catalog visible with an
// offline indicator) and that tapping a pack navigates to its detail
// screen.
//
// VaultHubScreen reads/writes a real cache File via dart:io, which -
// like PackLibraryScreen's real disk I/O - does not complete under
// flutter_test's default fake-async pump loop. Every point where the
// screen awaits real disk I/O is triggered from inside a
// `tester.runAsync(...)` block, per the same pattern already
// established in pack_library_screen_test.dart.

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/vault_hub/data/http_fetcher.dart';
import 'package:humanity_vault_app/features/vault_hub/presentation/pack_detail_screen.dart';
import 'package:humanity_vault_app/features/vault_hub/presentation/vault_hub_screen.dart';

class _FakeHttpFetcher implements HttpFetcher {
  _FakeHttpFetcher({this.statusCode = 200, this.body, this.delay});

  final int statusCode;
  final String? body;

  /// Simulates a slow network response, so tests can observe the
  /// screen's state before the background refresh resolves.
  final Duration? delay;

  @override
  Future<HttpFetchResult> get(Uri url) async {
    if (delay != null) await Future<void>.delayed(delay!);
    return HttpFetchResult(
      statusCode: statusCode,
      bodyBytes: utf8.encode(body ?? ''),
    );
  }
}

String _registryJson(List<String> packNamesAndIds) {
  final packs = packNamesAndIds.map((idAndName) {
    final parts = idAndName.split('|');
    final id = parts[0];
    final name = parts[1];
    return {
      'pack_id': id,
      'pack_name': name,
      'description': 'A description for $name.',
      'category_tags': ['Survival'],
      'verification_summary': 'Verified Source',
      'versions': [
        {
          'version': '1.0.0',
          'changelog_summary': 'Initial release.',
          'download_url': 'https://example.test/$id.zip',
          'sha256': 'abc123',
          'size_bytes': 2048,
          'article_count': 3,
        },
      ],
    };
  }).toList();

  return jsonEncode({
    'generated_at': '2026-07-12T00:00:00.000Z',
    'packs': packs,
  });
}

Future<void> _pumpVaultHubScreen(
  WidgetTester tester, {
  required HttpFetcher fetcher,
  required File cacheFile,
  Duration wait = const Duration(milliseconds: 300),
}) async {
  await tester.runAsync(() async {
    await tester.pumpWidget(MaterialApp(
      home: VaultHubScreen(httpFetcher: fetcher, cacheFileOverride: cacheFile),
    ));
    await Future<void>.delayed(wait);
  });
  await tester.pump();
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory root;
  late File cacheFile;

  setUp(() {
    root = Directory.systemTemp.createTempSync('hv_vault_hub_');
    cacheFile = File('${root.path}/registry_cache.json');
  });

  tearDown(() {
    if (root.existsSync()) root.deleteSync(recursive: true);
  });

  testWidgets('shows the cached catalog immediately, before the '
      'background refresh resolves', (tester) async {
    cacheFile.writeAsStringSync(_registryJson(['hv_official_a|Cached Pack']));
    final fetcher = _FakeHttpFetcher(
      body: _registryJson(['hv_official_a|Refreshed Pack']),
      delay: const Duration(seconds: 3),
    );

    await _pumpVaultHubScreen(tester, fetcher: fetcher, cacheFile: cacheFile);

    expect(find.text('Cached Pack'), findsOneWidget);
    expect(find.text('Refreshed Pack'), findsNothing);
  });

  testWidgets('a successful background refresh updates the catalog in '
      'place', (tester) async {
    cacheFile.writeAsStringSync(_registryJson(['hv_official_a|Old Name']));
    final fetcher = _FakeHttpFetcher(
      body: _registryJson(['hv_official_a|New Name']),
    );

    await _pumpVaultHubScreen(
      tester,
      fetcher: fetcher,
      cacheFile: cacheFile,
      wait: const Duration(milliseconds: 500),
    );

    expect(find.text('New Name'), findsOneWidget);
    expect(find.text('Old Name'), findsNothing);

    // The refreshed content is also persisted back to the cache file.
    final onDisk = cacheFile.readAsStringSync();
    expect(onDisk, contains('New Name'));
  });

  testWidgets('a failed background refresh keeps the cached catalog '
      'visible with an offline indicator', (tester) async {
    cacheFile.writeAsStringSync(_registryJson(['hv_official_a|Cached Pack']));
    final fetcher = _FakeHttpFetcher(statusCode: 503);

    await _pumpVaultHubScreen(
      tester,
      fetcher: fetcher,
      cacheFile: cacheFile,
      wait: const Duration(milliseconds: 500),
    );

    expect(find.text('Cached Pack'), findsOneWidget);
    expect(find.textContaining('offline'), findsOneWidget);
  });

  testWidgets('shows an explicit empty/error state when there is no '
      'cache and the refresh fails', (tester) async {
    // cacheFile is never written in this test - no cache exists.
    final fetcher = _FakeHttpFetcher(statusCode: 503);

    await _pumpVaultHubScreen(
      tester,
      fetcher: fetcher,
      cacheFile: cacheFile,
      wait: const Duration(milliseconds: 500),
    );

    expect(find.text('Could not load the Vault Hub catalog.'), findsOneWidget);
    expect(find.widgetWithText(OutlinedButton, 'Retry'), findsOneWidget);
  });

  testWidgets('shows an empty state when the registry has no packs yet',
      (tester) async {
    cacheFile.writeAsStringSync(_registryJson(const []));
    final fetcher = _FakeHttpFetcher(body: _registryJson(const []));

    await _pumpVaultHubScreen(
      tester,
      fetcher: fetcher,
      cacheFile: cacheFile,
      wait: const Duration(milliseconds: 500),
    );

    expect(
      find.text('No Official Knowledge Packs are published yet.'),
      findsOneWidget,
    );
  });

  testWidgets('tapping a pack card opens its Pack Detail screen',
      (tester) async {
    cacheFile.writeAsStringSync(_registryJson(['hv_official_a|Tap Target Pack']));
    final fetcher = _FakeHttpFetcher(statusCode: 503);

    await _pumpVaultHubScreen(tester, fetcher: fetcher, cacheFile: cacheFile);

    await tester.tap(find.text('Tap Target Pack'));
    await tester.pumpAndSettle();

    expect(find.byType(PackDetailScreen), findsOneWidget);
    expect(
      find.descendant(
        of: find.byType(AppBar),
        matching: find.text('Tap Target Pack'),
      ),
      findsOneWidget,
    );
  });
}
