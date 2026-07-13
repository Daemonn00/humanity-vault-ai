// A real end-to-end run of bin/release.dart as a subprocess, against
// a temp fixture pack directory - proving the CLI as a whole (argument
// parsing, checklist execution, artifact writing, exit codes) works,
// not just its individual pure-function pieces.

import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

const _validManifest = '''
---
pack_id: hv_official_e2e_test_pack
pack_name: End to End Test Pack
pack_version: 1.0.0
description: A test pack for end-to-end release pipeline verification.
---
''';

const _validArticle = '''
---
title: Test Article
category: Survival
verification_level: Verified Source
---
## Summary
A summary.

## Main Content
Content.

## Benefits
- One

## Sources
- A source
''';

void main() {
  test('a successful release run writes a ZIP and release-manifest.json, '
      'and exits 0', () async {
    final packageRoot = Directory.current.path;
    final fixtureRoot =
        Directory.systemTemp.createTempSync('hv_release_e2e_');
    final outDir = Directory('${fixtureRoot.path}/out');
    addTearDown(() => fixtureRoot.deleteSync(recursive: true));

    final packDir = Directory('${fixtureRoot.path}/hv_official_e2e_test_pack')
      ..createSync(recursive: true);
    File('${packDir.path}/manifest.md').writeAsStringSync(_validManifest);
    File('${packDir.path}/article_one.md').writeAsStringSync(_validArticle);

    final result = await Process.run(
      'dart',
      [
        'run',
        'bin/release.dart',
        packDir.path,
        '1.0.0',
        '--out',
        outDir.path,
      ],
      workingDirectory: packageRoot,
    );

    expect(
      result.exitCode,
      0,
      reason: 'stdout: ${result.stdout}\nstderr: ${result.stderr}',
    );
    expect(result.stdout, contains('[PASS] generatedRegistryValidity'));
    expect(result.stdout, contains('Release checklist passed'));

    final zipFile =
        File('${outDir.path}/hv_official_e2e_test_pack-v1.0.0.zip');
    expect(zipFile.existsSync(), isTrue);

    final manifestFile = File(
      '${outDir.path}/hv_official_e2e_test_pack-v1.0.0-release-manifest.json',
    );
    expect(manifestFile.existsSync(), isTrue);

    final manifestJson =
        jsonDecode(manifestFile.readAsStringSync()) as Map<String, dynamic>;
    expect(manifestJson['pack_id'], 'hv_official_e2e_test_pack');
    expect(manifestJson['release_tag'], 'hv_official_e2e_test_pack-v1.0.0');
    expect(manifestJson['article_count'], 1);
  });

  test('a failing pack exits non-zero and writes no artifacts', () async {
    final packageRoot = Directory.current.path;
    final fixtureRoot =
        Directory.systemTemp.createTempSync('hv_release_e2e_fail_');
    final outDir = Directory('${fixtureRoot.path}/out');
    addTearDown(() => fixtureRoot.deleteSync(recursive: true));

    // Manifest version deliberately does not match the target version.
    final packDir = Directory('${fixtureRoot.path}/hv_official_bad_pack')
      ..createSync(recursive: true);
    File('${packDir.path}/manifest.md').writeAsStringSync(_validManifest);
    File('${packDir.path}/article_one.md').writeAsStringSync(_validArticle);

    final result = await Process.run(
      'dart',
      [
        'run',
        'bin/release.dart',
        packDir.path,
        '9.9.9',
        '--out',
        outDir.path,
      ],
      workingDirectory: packageRoot,
    );

    expect(result.exitCode, isNot(0));
    expect(result.stderr, contains('failed - stopping immediately'));
    expect(outDir.existsSync(), isFalse);
  });

  test('missing arguments exit with a usage error', () async {
    final packageRoot = Directory.current.path;

    final result = await Process.run(
      'dart',
      ['run', 'bin/release.dart'],
      workingDirectory: packageRoot,
    );

    expect(result.exitCode, 2);
    expect(result.stderr, contains('Usage:'));
  });
}
