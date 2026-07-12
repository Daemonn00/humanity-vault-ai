import 'dart:io';
import 'dart:typed_data';

/// The outcome of one HTTP GET performed by [HttpFetcher].
class HttpFetchResult {
  const HttpFetchResult({required this.statusCode, required this.bodyBytes});

  final int statusCode;
  final List<int> bodyBytes;
}

/// Seam over "fetch bytes from a URL", so Vault Hub's two network
/// calls - the registry.json refresh and a pack ZIP download - can be
/// exercised in tests with a fake, with no real network call. Mirrors
/// the `ReleaseSource` seam used by the standalone Registry Generator
/// tool, for the same reason.
abstract class HttpFetcher {
  Future<HttpFetchResult> get(Uri url);
}

/// The real, dart:io-backed fetcher used at runtime. No external HTTP
/// package dependency, matching the project's low-dependency ethos.
class IoHttpFetcher implements HttpFetcher {
  const IoHttpFetcher();

  @override
  Future<HttpFetchResult> get(Uri url) async {
    final client = HttpClient();
    try {
      final request =
          await client.getUrl(url).timeout(const Duration(seconds: 15));
      final response =
          await request.close().timeout(const Duration(seconds: 60));

      final bytesBuilder = BytesBuilder(copy: false);
      await for (final chunk in response) {
        bytesBuilder.add(chunk);
      }

      return HttpFetchResult(
        statusCode: response.statusCode,
        bodyBytes: bytesBuilder.takeBytes(),
      );
    } finally {
      client.close(force: true);
    }
  }
}
