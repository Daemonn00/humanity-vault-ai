// A real end-to-end run of bin/build.dart against the actual
// templates/ + content/ + assets/, proving the build pipeline works
// as a whole - not just its individual pure-function pieces.

import 'dart:io';

import 'package:test/test.dart';

void main() {
  test('the real build produces every expected output page and asset',
      () async {
    final websiteRoot = Directory.current.path;

    final result = await Process.run(
      'dart',
      ['run', 'bin/build.dart'],
      workingDirectory: websiteRoot,
    );

    expect(
      result.exitCode,
      0,
      reason: 'stdout: ${result.stdout}\nstderr: ${result.stderr}',
    );

    const expectedPaths = [
      'index.html',
      'packs/index.html',
      'packs/detail.html',
      'download/index.html',
      'docs/index.html',
      'docs/what-is-humanity-vault.html',
      'docs/installing-a-knowledge-pack.html',
      'docs/authoring-a-knowledge-pack.html',
      'docs/offline-usage.html',
      'docs/faq.html',
      'changelog/index.html',
      'assets/css/tokens.css',
      'assets/css/base.css',
      'assets/css/components.css',
      'assets/js/registry-client.js',
      'assets/js/format.js',
      'assets/js/packs-page.js',
      'assets/js/pack-detail-page.js',
      'assets/js/home-stats.js',
      'assets/js/nav.js',
    ];

    for (final relativePath in expectedPaths) {
      final file = File('$websiteRoot/dist/$relativePath');
      expect(file.existsSync(), isTrue, reason: '$relativePath was not built');
    }

    // The site never reads or writes the repo's own registry.json -
    // the build output must not contain a copy of it.
    expect(
      File('$websiteRoot/dist/registry.json').existsSync(),
      isFalse,
    );
  });
}
