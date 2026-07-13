import 'dart:convert';

import 'release_pipeline.dart';

/// Builds the JSON artifact a human or CI uses to actually create the
/// real GitHub Release, once every checklist step has passed. Pure
/// function - never touches disk itself; the caller decides where (or
/// whether) to write it.
String buildReleaseManifestJson(ReleasePipelineResult result) {
  final packaged = result.packagedRelease;
  final entry = result.registryEntry;
  if (!result.succeeded || packaged == null || entry == null) {
    throw StateError(
      'cannot build a release manifest for a pipeline run that did not '
      'succeed',
    );
  }

  final json = {
    'pack_id': entry.packId,
    'pack_name': entry.packName,
    'version': entry.version,
    'release_tag': result.expectedTag,
    'asset_file_name': packaged.fileName,
    'sha256': packaged.sha256,
    'size_bytes': packaged.sizeBytes,
    'article_count': entry.articleCount,
    'verification_summary': entry.verificationSummary,
    'category_tags': entry.categoryTags,
    'generated_at': DateTime.now().toUtc().toIso8601String(),
    'checklist': [
      for (final step in result.steps)
        {
          'step': step.step.name,
          'passed': step.passed,
          'detail': step.detail,
        },
    ],
    'next_steps': [
      'Create a GitHub Release with tag "${result.expectedTag}" and '
          'upload the ZIP at the path this tool printed.',
      'Re-run the existing Registry Generator '
          '(registry_generator/bin/generate.dart) for real against the '
          'now-published release.',
      'Commit and push the regenerated registry/registry.json - never '
          'hand-edit it.',
    ],
  };

  return const JsonEncoder.withIndent('  ').convert(json);
}
