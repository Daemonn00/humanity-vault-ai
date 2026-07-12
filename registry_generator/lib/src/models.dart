/// The four fields the app's manifest parser actually reads.
class PackManifest {
  const PackManifest({
    required this.packId,
    required this.packName,
    required this.packVersion,
    this.description,
  });

  final String packId;
  final String packName;
  final String packVersion;
  final String? description;
}

/// One article's frontmatter fields relevant to registry generation.
class PackArticle {
  const PackArticle({
    required this.slug,
    required this.title,
    required this.category,
    this.subcategory,
    this.verificationLevel,
    this.terrain = const [],
  });

  final String slug;
  final String title;
  final String category;
  final String? subcategory;
  final String? verificationLevel;
  final List<String> terrain;
}

/// A downloadable asset attached to a GitHub Release.
class ReleaseAsset {
  const ReleaseAsset({required this.name, required this.downloadUrl});

  final String name;
  final String downloadUrl;
}

/// The subset of GitHub Release metadata this tool needs - the sole
/// publication gate the generator trusts. See ReleaseSource.
class ReleaseInfo {
  const ReleaseInfo({
    required this.tagName,
    required this.version,
    required this.publishedAt,
    required this.body,
    required this.assets,
  });

  final String tagName;

  /// The version portion decoded from the tag (e.g. "1.0.0" from tag
  /// "hv_official_field_comm_wayfinding-v1.0.0").
  final String version;
  final DateTime publishedAt;
  final String body;
  final List<ReleaseAsset> assets;
}

/// One fully-validated, released pack, ready to be serialized into
/// registry.json.
class RegistryPackEntry {
  const RegistryPackEntry({
    required this.packId,
    required this.packName,
    required this.description,
    required this.categoryTags,
    required this.trustTier,
    required this.verificationSummary,
    required this.latestVersion,
    required this.version,
    required this.publishDate,
    required this.changelogSummary,
    required this.downloadUrl,
    required this.sha256,
    required this.sizeBytes,
    required this.articleCount,
    required this.sourceCommit,
  });

  final String packId;
  final String packName;
  final String? description;
  final List<String> categoryTags;
  final String trustTier;
  final String verificationSummary;
  final String latestVersion;
  final String version;
  final DateTime publishDate;
  final String changelogSummary;
  final String downloadUrl;
  final String sha256;
  final int sizeBytes;
  final int articleCount;
  final String? sourceCommit;

  Map<String, Object?> toJson() => {
    'pack_id': packId,
    'pack_name': packName,
    'description': description,
    'category_tags': categoryTags,
    'trust_tier': trustTier,
    'verification_summary': verificationSummary,
    'latest_version': latestVersion,
    'asset_type': 'knowledge_pack',
    'license': null,
    'dependencies': const [],
    'versions': [
      {
        'version': version,
        'publish_date': publishDate.toIso8601String(),
        'changelog_summary': changelogSummary,
        'download_url': downloadUrl,
        'sha256': sha256,
        'size_bytes': sizeBytes,
        'article_count': articleCount,
        'compatibility': {
          'min_app_version': null,
          'recommended_app_version': null,
        },
        'deprecated': false,
        'deprecated_reason': null,
        'replacement_pack_id': null,
        'archived': false,
        'source_commit': sourceCommit,
      },
    ],
  };
}

/// The complete generated registry.
class RegistryOutput {
  const RegistryOutput({
    required this.schemaVersion,
    required this.generatedAt,
    required this.generatorVersion,
    required this.sourceRepositories,
    required this.packs,
  });

  final String schemaVersion;
  final DateTime generatedAt;
  final String generatorVersion;
  final List<String> sourceRepositories;
  final List<RegistryPackEntry> packs;

  Map<String, Object?> toJson() => {
    'registry_schema_version': schemaVersion,
    'generated_at': generatedAt.toIso8601String(),
    'generator_version': generatorVersion,
    'pack_count': packs.length,
    'source_repositories': sourceRepositories,
    'packs': packs.map((p) => p.toJson()).toList(),
  };
}
