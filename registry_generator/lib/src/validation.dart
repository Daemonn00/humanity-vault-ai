import 'models.dart';

/// A single validation problem found while checking a pack.
class ValidationIssue {
  const ValidationIssue({required this.message, required this.isWarning});

  /// Human-readable description of the problem.
  final String message;

  /// Warnings do not exclude the pack; errors do.
  final bool isWarning;
}

/// The outcome of validating one released pack.
class ValidationResult {
  const ValidationResult({
    required this.issues,
    required this.validArticles,
  });

  final List<ValidationIssue> issues;

  /// Articles that passed per-article checks (bad category articles
  /// are dropped from the count here, mirroring the app's own loader;
  /// this does not fail the whole pack).
  final List<PackArticle> validArticles;

  bool get hasErrors => issues.any((i) => !i.isWarning);
}

/// Hard rules the app itself already enforces - kept in exact sync so
/// the generator never accepts something the app would reject, or vice
/// versa.
class PackValidation {
  PackValidation._();

  static const List<String> validCategories = [
    'Survival',
    'Medicine',
    'Agriculture',
    'Engineering',
    'Electronics',
    'Construction',
    'History',
    'Philosophy',
    'Islam',
    'Local Wisdom',
    'Communication',
  ];

  static const List<String> validTerrainIds = [
    'tropical_rainforest',
    'desert',
    'coastal',
    'urban',
  ];

  static const List<String> validVerificationLevels = [
    'Verified Source',
    'Community Verified',
    'Historical Source',
    'Unverified',
  ];

  /// Snapshot of the 31 core-corpus article slugs as of the last time
  /// this list was checked against humanity_vault_app/knowledge/. This
  /// tool never reads that folder at runtime (see README.md) - kept
  /// intentionally static so this is a hardcoded snapshot requiring a
  /// manual update if the core corpus ever changes (a known, accepted
  /// v0.1 limitation - see the implementation report's Risks section).
  static const Set<String> coreCorpusSlugs = {
    'basic_circuits_and_battery_power',
    'basic_cpr',
    'basic_hand_tools_and_their_uses',
    'basic_mechanics_for_tool_and_equipment_repair',
    'basic_navigation_without_gps_or_compass',
    'basic_shelter_construction',
    'core_pillars_of_practice',
    'critical_thinking_and_evaluating_information',
    'daily_dua',
    'emergency_communications_basics',
    'emergency_fire_safety',
    'emergency_phone_power_management',
    'fire_starting_without_matches',
    'food_preservation_basics',
    'foundational_ethics_and_decision_making_under_scarcity',
    'growing_staple_food_crops',
    'how_writing_and_numeracy_systems_work',
    'lessons_from_historical_civilization_collapse_and_recovery',
    'power_bank_survival_guide',
    'radio_communication_fundamentals',
    'recognizing_and_treating_dehydration',
    'sanitation_hygiene_and_disease_prevention',
    'seed_saving_basics',
    'simple_machines',
    'simple_structural_building_techniques',
    'traditional_weather_prediction_and_seasonal_indicators',
    'water_purification',
    'water_storage_and_long_term_water_safety',
    'water_wheel_and_wind_power_basics',
    'well_digging_and_safe_water_access',
    'wound_care_and_bleeding_control',
  };

  static final RegExp _semver = RegExp(r'^\d+\.\d+\.\d+$');

  static bool isWellFormedSemver(String version) => _semver.hasMatch(version);

  static bool isOfficialPackId(String packId) =>
      packId.startsWith('hv_official_');

  /// Validates [manifest] and [articles] together. Does not read
  /// REVIEW_NOTES.md or re-judge editorial provenance - format/
  /// structure only.
  static ValidationResult validate({
    required PackManifest manifest,
    required List<PackArticle> articles,
    required String releaseVersion,
  }) {
    final issues = <ValidationIssue>[];

    if (!isOfficialPackId(manifest.packId)) {
      issues.add(
        ValidationIssue(
          message:
              'pack_id "${manifest.packId}" does not use the hv_official_ prefix',
          isWarning: false,
        ),
      );
    }

    if (!isWellFormedSemver(manifest.packVersion)) {
      issues.add(
        ValidationIssue(
          message:
              'pack_version "${manifest.packVersion}" is not well-formed semver (X.Y.Z)',
          isWarning: false,
        ),
      );
    }

    if (manifest.packVersion != releaseVersion) {
      issues.add(
        ValidationIssue(
          message:
              'manifest pack_version "${manifest.packVersion}" does not match '
              'the release version "$releaseVersion"',
          isWarning: false,
        ),
      );
    }

    final validArticles = <PackArticle>[];
    final seenSlugs = <String>{};

    for (final article in articles) {
      if (coreCorpusSlugs.contains(article.slug)) {
        issues.add(
          ValidationIssue(
            message:
                'article slug "${article.slug}" collides with a core corpus slug',
            isWarning: false,
          ),
        );
        continue;
      }
      if (!seenSlugs.add(article.slug)) {
        issues.add(
          ValidationIssue(
            message: 'duplicate article slug "${article.slug}" within this pack',
            isWarning: false,
          ),
        );
        continue;
      }
      if (!validCategories.contains(article.category)) {
        issues.add(
          ValidationIssue(
            message:
                'article "${article.slug}" has an invalid category '
                '"${article.category}" - excluded from article_count',
            isWarning: true,
          ),
        );
        continue;
      }
      if (article.verificationLevel != null &&
          !validVerificationLevels.contains(article.verificationLevel)) {
        issues.add(
          ValidationIssue(
            message:
                'article "${article.slug}" has an invalid verification_level '
                '"${article.verificationLevel}"',
            isWarning: false,
          ),
        );
        continue;
      }
      final invalidTerrain = article.terrain
          .where((t) => !validTerrainIds.contains(t))
          .toList();
      if (invalidTerrain.isNotEmpty) {
        issues.add(
          ValidationIssue(
            message:
                'article "${article.slug}" has invalid terrain IDs '
                '${invalidTerrain.join(', ')} - dropped, article kept',
            isWarning: true,
          ),
        );
      }
      validArticles.add(
        PackArticle(
          slug: article.slug,
          title: article.title,
          category: article.category,
          subcategory: article.subcategory,
          verificationLevel: article.verificationLevel,
          terrain: article.terrain
              .where(validTerrainIds.contains)
              .toList(),
        ),
      );
    }

    if (validArticles.isEmpty) {
      issues.add(
        const ValidationIssue(
          message: 'no valid articles found in this pack',
          isWarning: false,
        ),
      );
    }

    return ValidationResult(issues: issues, validArticles: validArticles);
  }

  /// Computes the pack-level verification_summary as the weakest
  /// verification_level found among [articles] ("weakest link" rule):
  /// Unverified beats everything if present at all; else Verified
  /// Source only if every article is Verified Source; otherwise
  /// Community Verified as the deterministic tie-break default for a
  /// mix of Community Verified / Historical Source with no Unverified
  /// and no full Verified Source coverage.
  static String verificationSummary(List<PackArticle> articles) {
    final levels = articles
        .map((a) => a.verificationLevel ?? 'Unverified')
        .toSet();
    if (levels.contains('Unverified')) return 'Unverified';
    if (levels.every((l) => l == 'Verified Source')) return 'Verified Source';
    return 'Community Verified';
  }
}
