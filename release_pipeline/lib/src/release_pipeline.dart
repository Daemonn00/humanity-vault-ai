import 'dart:io';

import 'package:registry_generator/src/models.dart';
import 'package:registry_generator/src/pack_reader.dart';
import 'package:registry_generator/src/registry_generator.dart';
import 'package:registry_generator/src/validation.dart';

import 'in_memory_release_source.dart';
import 'packager.dart';

/// The ordered official release checklist. The pipeline stops at the
/// first failing step - later steps are never attempted.
enum ReleaseStep {
  manifestReadable,
  versionConsistency,
  structuralValidation,
  packaging,
  zipFilenameConvention,
  checksum,
  registryGenerationDryRun,
  generatedRegistryValidity,
}

/// The outcome of one checklist step.
class ReleaseStepResult {
  const ReleaseStepResult({
    required this.step,
    required this.passed,
    required this.detail,
  });

  final ReleaseStep step;
  final bool passed;
  final String detail;
}

/// The outcome of a full pipeline run.
class ReleasePipelineResult {
  const ReleasePipelineResult({
    required this.steps,
    required this.succeeded,
    this.packagedRelease,
    this.registryEntry,
    this.expectedTag,
  });

  final List<ReleaseStepResult> steps;
  final bool succeeded;
  final PackagedRelease? packagedRelease;
  final RegistryPackEntry? registryEntry;
  final String? expectedTag;

  /// The step that stopped the pipeline - null on success. Since the
  /// pipeline always stops immediately, this is always the last entry
  /// in [steps] when [succeeded] is false.
  ReleaseStepResult? get failure {
    if (succeeded) return null;
    return steps.isEmpty ? null : steps.last;
  }
}

/// Runs the official Knowledge Pack release checklist against
/// [packDir] for an intended [targetVersion] release, failing
/// immediately at the first check that doesn't pass.
///
/// Read-only with respect to [packDir] and the rest of the repo: never
/// writes into official_packs/, never reads REVIEW_NOTES.md/
/// CHANGELOG.md/LICENSE (via PackReader), never touches
/// registry/registry.json. Reuses PackReader, PackValidation, and
/// RegistryGenerator exactly as they already exist in
/// registry_generator - none of that is duplicated or modified here.
class ReleasePipeline {
  ReleasePipeline._();

  static Future<ReleasePipelineResult> run(
    Directory packDir, {
    required String targetVersion,
  }) async {
    final steps = <ReleaseStepResult>[];

    ReleasePipelineResult fail(ReleaseStep step, String detail) {
      steps.add(ReleaseStepResult(step: step, passed: false, detail: detail));
      return ReleasePipelineResult(steps: steps, succeeded: false);
    }

    // 1. Manifest readable.
    final manifest = await PackReader.readManifest(packDir);
    if (manifest == null) {
      return fail(
        ReleaseStep.manifestReadable,
        'manifest.md is missing or missing a required field '
        '(pack_id, pack_name, pack_version)',
      );
    }
    steps.add(
      ReleaseStepResult(
        step: ReleaseStep.manifestReadable,
        passed: true,
        detail: 'pack_id=${manifest.packId}, '
            'pack_version=${manifest.packVersion}',
      ),
    );

    // 2. Version consistency: manifest version vs. the intended
    //    release/tag version, well-formed semver, hv_official_ prefix.
    if (!PackValidation.isWellFormedSemver(targetVersion)) {
      return fail(
        ReleaseStep.versionConsistency,
        'target version "$targetVersion" is not well-formed semver (X.Y.Z)',
      );
    }
    if (manifest.packVersion != targetVersion) {
      return fail(
        ReleaseStep.versionConsistency,
        'manifest pack_version "${manifest.packVersion}" does not match '
        'the intended release version "$targetVersion"',
      );
    }
    if (!PackValidation.isOfficialPackId(manifest.packId)) {
      return fail(
        ReleaseStep.versionConsistency,
        'pack_id "${manifest.packId}" does not use the hv_official_ prefix',
      );
    }
    final expectedTag = '${manifest.packId}-v$targetVersion';
    steps.add(
      ReleaseStepResult(
        step: ReleaseStep.versionConsistency,
        passed: true,
        detail: 'manifest version matches the intended release version; '
            'expected release tag: $expectedTag',
      ),
    );

    // 3. Structural validation (categories, verification levels,
    //    terrain, slug collisions) - identical rules the Registry
    //    Generator itself enforces after a real release is published.
    final articles = await PackReader.readArticles(packDir);
    final validation = PackValidation.validate(
      manifest: manifest,
      articles: articles,
      releaseVersion: targetVersion,
    );
    if (validation.hasErrors) {
      final message = validation.issues
          .where((i) => !i.isWarning)
          .map((i) => i.message)
          .join('; ');
      return fail(ReleaseStep.structuralValidation, message);
    }
    steps.add(
      ReleaseStepResult(
        step: ReleaseStep.structuralValidation,
        passed: true,
        detail: '${validation.validArticles.length} valid article(s)',
      ),
    );

    // 4. Packaging.
    final PackagedRelease packaged;
    try {
      packaged = Packager.package(
        packDir,
        packId: manifest.packId,
        version: targetVersion,
      );
    } catch (e) {
      return fail(ReleaseStep.packaging, 'failed to build release ZIP: $e');
    }
    steps.add(
      ReleaseStepResult(
        step: ReleaseStep.packaging,
        passed: true,
        detail: '${packaged.sizeBytes} bytes',
      ),
    );

    // 5. ZIP filename convention.
    final expectedFileName = Packager.fileNameFor(
      manifest.packId,
      targetVersion,
    );
    if (packaged.fileName != expectedFileName) {
      return fail(
        ReleaseStep.zipFilenameConvention,
        'packaged filename "${packaged.fileName}" does not match the '
        'expected convention "$expectedFileName"',
      );
    }
    steps.add(
      ReleaseStepResult(
        step: ReleaseStep.zipFilenameConvention,
        passed: true,
        detail: packaged.fileName,
      ),
    );

    // 6. Checksum.
    if (packaged.sha256.length != 64) {
      return fail(
        ReleaseStep.checksum,
        'computed checksum is not a valid SHA-256 hex digest',
      );
    }
    steps.add(
      ReleaseStepResult(
        step: ReleaseStep.checksum,
        passed: true,
        detail: packaged.sha256,
      ),
    );

    // 7. Registry generation dry run - reuses the real, unmodified
    //    RegistryGenerator against an in-memory stand-in for a
    //    published release, seeded with exactly this packaged ZIP.
    final dryRunSource = InMemoryReleaseSource(
      packId: manifest.packId,
      version: targetVersion,
      zipBytes: packaged.zipBytes,
      assetFileName: packaged.fileName,
      changelogSummary: 'Dry run - no real release published yet.',
    );
    final generator = RegistryGenerator(releaseSource: dryRunSource);
    final RegistryOutput output;
    try {
      output = await generator.generate(packDir.parent);
    } catch (e) {
      return fail(
        ReleaseStep.registryGenerationDryRun,
        'registry generation dry run threw: $e',
      );
    }

    final dirName = _dirName(packDir);
    final outcome = generator.outcomes.firstWhere(
      (o) => o.packDirName == dirName,
      orElse: () => const PackOutcome(
        packDirName: '',
        status: PackOutcomeStatus.noPackId,
      ),
    );
    if (outcome.status != PackOutcomeStatus.included) {
      final suffix = outcome.detail != null ? ', ${outcome.detail}' : '';
      return fail(
        ReleaseStep.registryGenerationDryRun,
        'dry run did not include this pack '
        '(status: ${outcome.status}$suffix)',
      );
    }
    steps.add(
      const ReleaseStepResult(
        step: ReleaseStep.registryGenerationDryRun,
        passed: true,
        detail: 'the Registry Generator would include this pack',
      ),
    );

    // 8. Generated registry validity - cross-check the dry run's own
    //    entry against the packaged artifact's own values.
    RegistryPackEntry? entry;
    for (final candidate in output.packs) {
      if (candidate.packId == manifest.packId) {
        entry = candidate;
        break;
      }
    }
    if (entry == null) {
      return fail(
        ReleaseStep.generatedRegistryValidity,
        'dry run reported this pack as included, but no matching entry '
        'was found in the generated registry',
      );
    }

    final mismatches = <String>[];
    if (entry.version != targetVersion) mismatches.add('version');
    if (entry.sha256 != packaged.sha256) mismatches.add('sha256');
    if (entry.sizeBytes != packaged.sizeBytes) mismatches.add('sizeBytes');
    if (entry.articleCount != validation.validArticles.length) {
      mismatches.add('articleCount');
    }
    if (mismatches.isNotEmpty) {
      return fail(
        ReleaseStep.generatedRegistryValidity,
        'generated registry entry does not match the packaged artifact: '
        '${mismatches.join(', ')}',
      );
    }
    steps.add(
      const ReleaseStepResult(
        step: ReleaseStep.generatedRegistryValidity,
        passed: true,
        detail: 'registry entry matches the packaged artifact exactly',
      ),
    );

    return ReleasePipelineResult(
      steps: steps,
      succeeded: true,
      packagedRelease: packaged,
      registryEntry: entry,
      expectedTag: expectedTag,
    );
  }

  static String _dirName(Directory dir) =>
      dir.uri.pathSegments.where((s) => s.isNotEmpty).last;
}
