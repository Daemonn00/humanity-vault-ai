import 'dart:convert';
import 'dart:io';

import 'models.dart';

/// Thrown when a release lookup or asset download fails for a reason
/// other than "no matching release exists" (network failure, malformed
/// response, etc.) - kept distinct from a clean "not found" so the
/// orchestrator can log a diagnostic warning while still excluding the
/// pack from this run either way (see RegistryGenerator).
class ReleaseLookupException implements Exception {
  ReleaseLookupException(this.message);
  final String message;

  @override
  String toString() => 'ReleaseLookupException: $message';
}

/// Abstraction over "does a published release exist for this pack, and
/// what's in it" - the sole publication gate the generator trusts. A
/// real, GitHub-backed implementation is provided below; tests use an
/// in-memory fake instead of making network calls.
abstract class ReleaseSource {
  /// Looks up a published release for [packId] matching
  /// [expectedVersion] exactly. Returns null if no such release exists
  /// (the pack is skipped silently). Throws [ReleaseLookupException] on
  /// a genuine lookup failure (network error, malformed response).
  Future<ReleaseInfo?> findRelease(String packId, String expectedVersion);

  /// Downloads the raw bytes of a release asset.
  Future<List<int>> downloadAsset(ReleaseAsset asset);
}

/// Looks up releases via the real GitHub REST API. Tag convention:
/// `<pack_id>-v<version>` (e.g. `hv_official_field_comm_wayfinding-v1.0.0`),
/// chosen so a single repository can host releases for multiple packs
/// without tag collisions, ahead of that actually happening.
class GitHubReleaseSource implements ReleaseSource {
  GitHubReleaseSource({
    this.owner = 'Daemonn00',
    this.repo = 'humanity-vault-ai',
    HttpClient? httpClient,
  }) : _client = httpClient ?? HttpClient();

  final String owner;
  final String repo;
  final HttpClient _client;

  static const _userAgent = 'humanity-vault-registry-generator';

  @override
  Future<ReleaseInfo?> findRelease(
    String packId,
    String expectedVersion,
  ) async {
    final expectedTag = '$packId-v$expectedVersion';
    final uri = Uri.parse(
      'https://api.github.com/repos/$owner/$repo/releases/tags/$expectedTag',
    );

    late final HttpClientResponse response;
    try {
      final request = await _client.getUrl(uri);
      request.headers.set(HttpHeaders.userAgentHeader, _userAgent);
      request.headers.set(
        HttpHeaders.acceptHeader,
        'application/vnd.github+json',
      );
      response = await request.close().timeout(const Duration(seconds: 15));
    } catch (e) {
      throw ReleaseLookupException(
        'network error looking up release for $packId: $e',
      );
    }

    if (response.statusCode == 404) {
      await response.drain<void>();
      return null; // No matching release - the expected, silent case.
    }
    if (response.statusCode != 200) {
      await response.drain<void>();
      throw ReleaseLookupException(
        'unexpected status ${response.statusCode} looking up release for $packId',
      );
    }

    final Map<String, dynamic> json;
    try {
      final body = await response.transform(utf8.decoder).join();
      json = jsonDecode(body) as Map<String, dynamic>;
    } catch (e) {
      throw ReleaseLookupException(
        'malformed release response for $packId: $e',
      );
    }

    final tagName = json['tag_name'] as String? ?? '';
    final prefix = '$packId-v';
    if (!tagName.startsWith(prefix)) return null;
    final version = tagName.substring(prefix.length);
    if (version != expectedVersion) return null;

    final rawAssets = (json['assets'] as List?) ?? const [];
    final assets = rawAssets.map((a) {
      final m = a as Map<String, dynamic>;
      return ReleaseAsset(
        name: m['name'] as String? ?? '',
        downloadUrl: m['browser_download_url'] as String? ?? '',
      );
    }).toList();

    final publishedAtRaw = json['published_at'] as String?;
    return ReleaseInfo(
      tagName: tagName,
      version: version,
      publishedAt: publishedAtRaw != null
          ? DateTime.parse(publishedAtRaw)
          : DateTime.now().toUtc(),
      body: json['body'] as String? ?? '',
      assets: assets,
    );
  }

  @override
  Future<List<int>> downloadAsset(ReleaseAsset asset) async {
    try {
      final uri = Uri.parse(asset.downloadUrl);
      final request = await _client.getUrl(uri);
      request.headers.set(HttpHeaders.userAgentHeader, _userAgent);
      request.followRedirects = true;
      final response = await request.close().timeout(
        const Duration(seconds: 60),
      );
      if (response.statusCode != 200) {
        await response.drain<void>();
        throw ReleaseLookupException(
          'unexpected status ${response.statusCode} downloading ${asset.name}',
        );
      }
      final bytes = <int>[];
      await for (final chunk in response) {
        bytes.addAll(chunk);
      }
      return bytes;
    } on ReleaseLookupException {
      rethrow;
    } catch (e) {
      throw ReleaseLookupException('failed to download ${asset.name}: $e');
    }
  }
}
