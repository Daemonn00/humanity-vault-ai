import 'dart:convert';

/// TEMPORARY: a hand-maintained, app-local mirror of the fields Vault
/// Hub needs from the Registry Generator's schema
/// (registry_generator/lib/src/models.dart RegistryPackEntry.toJson()).
///
/// This is tracked debt, not an intentional second source of truth -
/// replace both copies with a single shared schema package if one is
/// ever introduced. Until then, any change to the registry schema must
/// be applied here too.
///
/// Only reads the first (and, in v0.1, only) entry of a pack's
/// `versions` array, matching the registry's current single-version
/// scope.
class RegistryPackEntry {
  const RegistryPackEntry({
    required this.packId,
    required this.packName,
    required this.description,
    required this.categoryTags,
    required this.verificationSummary,
    required this.version,
    required this.changelogSummary,
    required this.downloadUrl,
    required this.sha256,
    required this.sizeBytes,
    required this.articleCount,
  });

  final String packId;
  final String packName;
  final String? description;
  final List<String> categoryTags;
  final String verificationSummary;
  final String version;
  final String changelogSummary;
  final String downloadUrl;
  final String sha256;
  final int sizeBytes;
  final int articleCount;

  /// Parses one entry of the registry's `packs` array. Returns null if
  /// any field this screen actually needs is missing, empty, or
  /// malformed - a single bad entry is skipped rather than breaking
  /// the whole catalog.
  static RegistryPackEntry? tryParse(Map<String, dynamic> json) {
    try {
      final versions = json['versions'];
      if (versions is! List || versions.isEmpty) return null;
      final latest = versions.first;
      if (latest is! Map<String, dynamic>) return null;

      final packId = json['pack_id'];
      final packName = json['pack_name'];
      final downloadUrl = latest['download_url'];
      final sha256 = latest['sha256'];
      final version = latest['version'];
      if (packId is! String ||
          packId.isEmpty ||
          packName is! String ||
          packName.isEmpty ||
          downloadUrl is! String ||
          downloadUrl.isEmpty ||
          sha256 is! String ||
          sha256.isEmpty ||
          version is! String ||
          version.isEmpty) {
        return null;
      }

      final categoryTagsRaw = json['category_tags'];
      final categoryTags = categoryTagsRaw is List
          ? categoryTagsRaw.map((e) => e.toString()).toList()
          : const <String>[];

      final description = json['description'];
      final changelogSummary = latest['changelog_summary'];
      final sizeBytes = latest['size_bytes'];
      final articleCount = latest['article_count'];
      final verificationSummary = json['verification_summary'];

      return RegistryPackEntry(
        packId: packId,
        packName: packName,
        description: description is String ? description : null,
        categoryTags: categoryTags,
        verificationSummary:
            verificationSummary is String ? verificationSummary : 'Unverified',
        version: version,
        changelogSummary: changelogSummary is String ? changelogSummary : '',
        downloadUrl: downloadUrl,
        sha256: sha256,
        sizeBytes: sizeBytes is num ? sizeBytes.toInt() : 0,
        articleCount: articleCount is num ? articleCount.toInt() : 0,
      );
    } catch (_) {
      return null;
    }
  }
}

/// TEMPORARY: an app-local mirror of the full registry document. See
/// [RegistryPackEntry] for why this duplication exists and how it is
/// meant to be retired.
class RegistryData {
  const RegistryData({required this.generatedAt, required this.packs});

  final String generatedAt;
  final List<RegistryPackEntry> packs;

  /// Parses a full registry.json document. Returns null if [raw] is
  /// not valid JSON or has no top-level `packs` array - never throws.
  /// Individual malformed pack entries are skipped rather than failing
  /// the whole parse (see [RegistryPackEntry.tryParse]).
  static RegistryData? tryParse(String raw) {
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) return null;
      final packsJson = decoded['packs'];
      if (packsJson is! List) return null;

      final packs = packsJson
          .whereType<Map<String, dynamic>>()
          .map(RegistryPackEntry.tryParse)
          .whereType<RegistryPackEntry>()
          .toList();

      final generatedAt = decoded['generated_at'];
      return RegistryData(
        generatedAt: generatedAt is String ? generatedAt : '',
        packs: packs,
      );
    } catch (_) {
      return null;
    }
  }
}
