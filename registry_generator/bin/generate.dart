import 'dart:convert';
import 'dart:io';

import 'package:registry_generator/src/registry_generator.dart';
import 'package:registry_generator/src/release_source.dart';

/// Runs the Registry Generator against the real official_packs/
/// directory and writes registry/registry.json. Run from anywhere -
/// paths are resolved relative to this script's own location, two
/// levels up (registry_generator/bin/ -> repo root).
Future<void> main(List<String> args) async {
  final repoRoot = Directory(
    File(Platform.script.toFilePath()).parent.parent.parent.path,
  );
  final officialPacksDir = Directory('${repoRoot.path}/official_packs');
  final registryDir = Directory('${repoRoot.path}/registry');
  final registryFile = File('${registryDir.path}/registry.json');

  final generator = RegistryGenerator(releaseSource: GitHubReleaseSource());
  final output = await generator.generate(officialPacksDir);

  if (!await registryDir.exists()) {
    await registryDir.create(recursive: true);
  }
  const encoder = JsonEncoder.withIndent('  ');
  await registryFile.writeAsString('${encoder.convert(output.toJson())}\n');

  stdout.writeln('Registry Generator v${generator.generatorVersion}');
  stdout.writeln('Scanned: official_packs/');
  var included = 0, noRelease = 0, warnings = 0;
  for (final outcome in generator.outcomes) {
    switch (outcome.status) {
      case PackOutcomeStatus.included:
        included++;
        stdout.writeln('  [included] ${outcome.packDirName}');
      case PackOutcomeStatus.noRelease:
        noRelease++;
      case PackOutcomeStatus.noPackId:
        warnings++;
        stdout.writeln(
          '  [warning] ${outcome.packDirName}: no manifest.md / pack_id',
        );
      case PackOutcomeStatus.releaseLookupFailed:
        warnings++;
        stdout.writeln(
          '  [warning] ${outcome.packDirName}: release lookup failed - '
          '${outcome.detail}',
        );
      case PackOutcomeStatus.validationFailed:
        warnings++;
        stdout.writeln(
          '  [error] ${outcome.packDirName}: released but invalid - '
          '${outcome.detail}',
        );
      case PackOutcomeStatus.noZipAsset:
        warnings++;
        stdout.writeln(
          '  [warning] ${outcome.packDirName}: release has no .zip asset',
        );
    }
  }
  stdout.writeln(
    'Summary: $included included, $noRelease not yet released '
    '(skipped silently), $warnings warning(s)/error(s).',
  );
  stdout.writeln('Wrote ${registryFile.path}');
}
