// Tests for RegistryClient: the cache read/write pair used by the
// offline-first load sequence, and fetchRemote's failure handling.
// fetchRemote is exercised against an in-memory FakeHttpFetcher - no
// real network call, mirroring the FakeReleaseSource pattern used by
// the standalone Registry Generator's own tests.

import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/vault_hub/data/http_fetcher.dart';
import 'package:humanity_vault_app/features/vault_hub/data/registry_client.dart';

class _FakeHttpFetcher implements HttpFetcher {
  _FakeHttpFetcher({this.statusCode = 200, this.body, this.error});

  final int statusCode;
  final String? body;
  final Object? error;

  Uri? lastRequestedUrl;

  @override
  Future<HttpFetchResult> get(Uri url) async {
    lastRequestedUrl = url;
    if (error != null) throw error!;
    return HttpFetchResult(
      statusCode: statusCode,
      bodyBytes: utf8.encode(body ?? ''),
    );
  }
}

const _validRegistryJson = '''
{
  "generated_at": "2026-07-12T00:00:00.000Z",
  "packs": []
}
''';

void main() {
  group('RegistryClient.readCache / writeCache', () {
    late Directory root;

    setUp(() => root = Directory.systemTemp.createTempSync('hv_registry_'));
    tearDown(() => root.deleteSync(recursive: true));

    test('readCache returns null when the file does not exist', () async {
      final file = File('${root.path}/cache.json');
      expect(await RegistryClient.readCache(file), isNull);
    });

    test('readCache returns null for corrupt cached content', () async {
      final file = File('${root.path}/cache.json')
        ..writeAsStringSync('{ not valid json');
      expect(await RegistryClient.readCache(file), isNull);
    });

    test('writeCache then readCache round-trips valid registry JSON',
        () async {
      final file = File('${root.path}/cache.json');

      await RegistryClient.writeCache(file, _validRegistryJson);
      final data = await RegistryClient.readCache(file);

      expect(data, isNotNull);
      expect(data!.generatedAt, '2026-07-12T00:00:00.000Z');
      expect(data.packs, isEmpty);
    });

    test('writeCache creates the parent directory if needed', () async {
      final file = File('${root.path}/nested/dir/cache.json');

      await RegistryClient.writeCache(file, _validRegistryJson);

      expect(await file.exists(), isTrue);
    });
  });

  group('RegistryClient.fetchRemote', () {
    test('returns the parsed data and raw JSON on a 200 response',
        () async {
      final fetcher = _FakeHttpFetcher(body: _validRegistryJson);

      final result = await RegistryClient.fetchRemote(
        fetcher,
        url: 'https://example.test/registry.json',
      );

      expect(result, isNotNull);
      expect(result!.rawJson, _validRegistryJson);
      expect(result.data.generatedAt, '2026-07-12T00:00:00.000Z');
      expect(fetcher.lastRequestedUrl, Uri.parse('https://example.test/registry.json'));
    });

    test('returns null on a non-200 response', () async {
      final fetcher = _FakeHttpFetcher(statusCode: 404, body: _validRegistryJson);

      final result = await RegistryClient.fetchRemote(fetcher);

      expect(result, isNull);
    });

    test('returns null when the response body is not valid registry JSON',
        () async {
      final fetcher = _FakeHttpFetcher(body: '{ not json');

      final result = await RegistryClient.fetchRemote(fetcher);

      expect(result, isNull);
    });

    test('returns null (not a thrown exception) when the fetcher throws',
        () async {
      final fetcher = _FakeHttpFetcher(error: const SocketException('down'));

      final result = await RegistryClient.fetchRemote(fetcher);

      expect(result, isNull);
    });

    test('defaults to RegistryClient.defaultRegistryUrl when no url is given',
        () async {
      final fetcher = _FakeHttpFetcher(body: _validRegistryJson);

      await RegistryClient.fetchRemote(fetcher);

      expect(
        fetcher.lastRequestedUrl,
        Uri.parse(RegistryClient.defaultRegistryUrl),
      );
    });
  });
}
