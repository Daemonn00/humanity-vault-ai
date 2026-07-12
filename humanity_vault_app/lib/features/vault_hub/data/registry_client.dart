import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../models/registry_pack_entry.dart';
import 'http_fetcher.dart';

/// The result of a successful remote registry fetch: the parsed data,
/// plus the raw JSON text it came from (so callers can cache exactly
/// what was fetched, byte-for-byte).
class RemoteRegistryFetch {
  const RemoteRegistryFetch({required this.data, required this.rawJson});

  final RegistryData data;
  final String rawJson;
}

/// Loads the Vault Hub catalog from registry.json, offline-first: the
/// local cache is always what gets read and rendered first; the
/// network is only ever used to refresh that cache in the background.
///
/// Never reads or writes this repo's own registry/registry.json - this
/// is a client fetching a published URL, like any other consumer of
/// the Registry Generator's output.
class RegistryClient {
  RegistryClient._();

  /// Raw GitHub content URL for the registry this repo's Registry
  /// Generator publishes, per the approved v0.1 hosting decision.
  static const String defaultRegistryUrl = 'https://raw.githubusercontent.com'
      '/Daemonn00/humanity-vault-ai/main/registry/registry.json';

  static const String _cacheFileName = 'vault_hub_registry_cache.json';

  /// Real entry point: resolves the cache file location via
  /// path_provider. Returns null if path_provider itself fails - a
  /// storage-resolution failure must never crash the catalog screen,
  /// only make it behave as if there were no cache yet.
  static Future<File?> cacheFile() async {
    try {
      final documents = await getApplicationDocumentsDirectory();
      return File('${documents.path}/$_cacheFileName');
    } catch (_) {
      return null;
    }
  }

  /// Reads and parses whatever is cached at [file]. Returns null if
  /// the file doesn't exist or can't be parsed - a missing or corrupt
  /// cache is always treated as "no cache yet", never as an error.
  static Future<RegistryData?> readCache(File file) async {
    try {
      if (!await file.exists()) return null;
      return RegistryData.tryParse(await file.readAsString());
    } catch (_) {
      return null;
    }
  }

  /// Best-effort cache write. Failing to persist a refreshed catalog
  /// must never surface as a user-facing error - the next successful
  /// background refresh simply tries again.
  static Future<void> writeCache(File file, String rawJson) async {
    try {
      await file.parent.create(recursive: true);
      await file.writeAsString(rawJson);
    } catch (_) {
      // Best-effort only.
    }
  }

  /// Fetches the registry via [fetcher] from [url] (defaults to
  /// [defaultRegistryUrl]). Returns null on any network, HTTP, or
  /// parse failure - a failed background refresh is never surfaced as
  /// an error while a cached catalog is already on screen (Section 7
  /// of the approved plan).
  static Future<RemoteRegistryFetch?> fetchRemote(
    HttpFetcher fetcher, {
    String? url,
  }) async {
    try {
      final uri = Uri.parse(url ?? defaultRegistryUrl);
      final result = await fetcher.get(uri);
      if (result.statusCode != 200) return null;

      final rawJson = utf8.decode(result.bodyBytes, allowMalformed: true);
      final data = RegistryData.tryParse(rawJson);
      if (data == null) return null;

      return RemoteRegistryFetch(data: data, rawJson: rawJson);
    } catch (_) {
      return null;
    }
  }
}
