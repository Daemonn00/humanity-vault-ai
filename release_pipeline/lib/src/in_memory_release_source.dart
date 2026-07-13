import 'package:registry_generator/src/models.dart';
import 'package:registry_generator/src/release_source.dart';

/// A [ReleaseSource] backed by exactly one in-memory release.
///
/// Used to dry-run the existing, unmodified `RegistryGenerator`
/// against a pack that has been packaged but not yet actually
/// published as a GitHub Release - proving "the Registry Generator
/// would accept this exact package" before a human or CI creates the
/// real release. This is never used as a stand-in for
/// `GitHubReleaseSource` at real publish time; it recognizes only the
/// one (packId, version) pair it was seeded with, so running it
/// against a directory containing other packs never accidentally
/// validates or includes them (they correctly come back as
/// `PackOutcomeStatus.noRelease`, the ordinary silent case).
class InMemoryReleaseSource implements ReleaseSource {
  InMemoryReleaseSource({
    required String packId,
    required String version,
    required List<int> zipBytes,
    required String assetFileName,
    String changelogSummary = '',
  })  : _packId = packId,
        _version = version,
        _zipBytes = zipBytes,
        _assetFileName = assetFileName,
        _changelogSummary = changelogSummary;

  final String _packId;
  final String _version;
  final List<int> _zipBytes;
  final String _assetFileName;
  final String _changelogSummary;

  @override
  Future<ReleaseInfo?> findRelease(
    String packId,
    String expectedVersion,
  ) async {
    if (packId != _packId || expectedVersion != _version) return null;
    return ReleaseInfo(
      tagName: '$_packId-v$_version',
      version: _version,
      publishedAt: DateTime.now().toUtc(),
      body: _changelogSummary,
      assets: [
        ReleaseAsset(
          name: _assetFileName,
          downloadUrl: 'local-dry-run://$_assetFileName',
        ),
      ],
    );
  }

  @override
  Future<List<int>> downloadAsset(ReleaseAsset asset) async => _zipBytes;
}
