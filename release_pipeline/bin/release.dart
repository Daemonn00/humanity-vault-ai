import 'dart:io';

import 'package:release_pipeline/src/release_manifest.dart';
import 'package:release_pipeline/src/release_pipeline.dart';

/// CLI entry point for the official Knowledge Pack release workflow.
///
/// Usage:
///   dart run bin/release.dart <pack_dir> <version> [--out <dir>]
///
/// Runs the full release checklist against <pack_dir> for the
/// intended release <version>, failing immediately (non-zero exit,
/// no further steps attempted) at the first check that doesn't pass.
/// On success, writes the packaged release ZIP and a
/// release-manifest.json describing it to <dir> (default: dist/,
/// relative to this package - gitignored, regenerate rather than
/// hand-edit).
///
/// Never writes into <pack_dir>, never touches
/// registry/registry.json, never creates a real GitHub Release - see
/// README.md and RELEASE_CHECKLIST.md for what happens after this
/// tool succeeds.
Future<void> main(List<String> arguments) async {
  final parsed = _parseArguments(arguments);
  if (parsed == null) {
    stderr.writeln(
      'Usage: dart run bin/release.dart <pack_dir> <version> [--out <dir>]',
    );
    exitCode = 2;
    return;
  }

  final packDir = Directory(parsed.packDirPath);
  if (!await packDir.exists()) {
    stderr.writeln('Pack directory not found: ${packDir.path}');
    exitCode = 2;
    return;
  }

  stdout.writeln('Running release checklist for ${packDir.path} '
      '(target version ${parsed.version})...\n');

  final result = await ReleasePipeline.run(packDir, targetVersion: parsed.version);

  for (final step in result.steps) {
    final mark = step.passed ? 'PASS' : 'FAIL';
    stdout.writeln('[$mark] ${step.step.name}: ${step.detail}');
  }

  if (!result.succeeded) {
    stderr.writeln('\nRelease checklist failed - stopping immediately. '
        'No ZIP was written, no registry check ran beyond this point.');
    exitCode = 1;
    return;
  }

  final outDir = Directory(parsed.outDirPath ?? _defaultOutDir());
  await outDir.create(recursive: true);

  final packaged = result.packagedRelease!;
  final zipFile = File('${outDir.path}/${packaged.fileName}');
  await zipFile.writeAsBytes(packaged.zipBytes);

  final manifestJson = buildReleaseManifestJson(result);
  final manifestFileName =
      '${result.registryEntry!.packId}-v${parsed.version}-release-manifest.json';
  final manifestFile = File('${outDir.path}/$manifestFileName');
  await manifestFile.writeAsString(manifestJson);

  stdout.writeln('\nRelease checklist passed. Prepared:');
  stdout.writeln('  ${zipFile.path}');
  stdout.writeln('  ${manifestFile.path}');
  stdout.writeln('\nExpected release tag: ${result.expectedTag}');
  stdout.writeln('\nThis tool did not create a GitHub Release, did not run '
      'the real Registry Generator, and did not touch registry.json - '
      'see the manifest\'s "next_steps" for what to do next.');
}

class _ParsedArguments {
  const _ParsedArguments({
    required this.packDirPath,
    required this.version,
    this.outDirPath,
  });

  final String packDirPath;
  final String version;
  final String? outDirPath;
}

_ParsedArguments? _parseArguments(List<String> arguments) {
  final positional = <String>[];
  String? outDirPath;

  for (var i = 0; i < arguments.length; i++) {
    final arg = arguments[i];
    if (arg == '--out') {
      if (i + 1 >= arguments.length) return null;
      outDirPath = arguments[i + 1];
      i++;
    } else {
      positional.add(arg);
    }
  }

  if (positional.length != 2) return null;
  return _ParsedArguments(
    packDirPath: positional[0],
    version: positional[1],
    outDirPath: outDirPath,
  );
}

String _defaultOutDir() {
  final scriptPath = Platform.script.toFilePath();
  // release_pipeline/bin/release.dart -> two levels up is
  // release_pipeline/, then into dist/.
  final packageRoot = File(scriptPath).parent.parent.path;
  return '$packageRoot/dist';
}
