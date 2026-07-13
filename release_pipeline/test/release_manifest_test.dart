import 'dart:convert';
import 'dart:io';

import 'package:release_pipeline/src/release_manifest.dart';
import 'package:release_pipeline/src/release_pipeline.dart';
import 'package:test/test.dart';

const _validManifest = '''
---
pack_id: hv_official_test_pack
pack_name: Test Pack
pack_version: 1.0.0
description: A test pack.
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
''';

void main() {
  test('buildReleaseManifestJson produces the expected shape for a '
      'successful run', () async {
    final root = Directory.systemTemp.createTempSync('hv_release_manifest_');
    addTearDown(() => root.deleteSync(recursive: true));
    final officialPacksDir = Directory('${root.path}/official_packs')
      ..createSync(recursive: true);
    final packDir = Directory('${officialPacksDir.path}/test_pack')
      ..createSync(recursive: true);
    File('${packDir.path}/manifest.md').writeAsStringSync(_validManifest);
    File('${packDir.path}/article_one.md').writeAsStringSync(_validArticle);

    final result =
        await ReleasePipeline.run(packDir, targetVersion: '1.0.0');
    expect(result.succeeded, isTrue);

    final json = jsonDecode(buildReleaseManifestJson(result))
        as Map<String, dynamic>;

    expect(json['pack_id'], 'hv_official_test_pack');
    expect(json['version'], '1.0.0');
    expect(json['release_tag'], 'hv_official_test_pack-v1.0.0');
    expect(json['asset_file_name'], 'hv_official_test_pack-v1.0.0.zip');
    expect(json['sha256'], result.packagedRelease!.sha256);
    expect(json['size_bytes'], result.packagedRelease!.sizeBytes);
    expect(json['article_count'], 1);
    expect(json['checklist'], hasLength(8));
    expect(
      (json['checklist'] as List).every((step) => step['passed'] == true),
      isTrue,
    );
    expect(json['next_steps'], isNotEmpty);
  });

  test('throws for a failed pipeline run', () async {
    final root = Directory.systemTemp.createTempSync('hv_release_manifest_');
    addTearDown(() => root.deleteSync(recursive: true));
    final packDir = Directory('${root.path}/empty_pack')
      ..createSync(recursive: true);

    final result =
        await ReleasePipeline.run(packDir, targetVersion: '1.0.0');
    expect(result.succeeded, isFalse);

    expect(
      () => buildReleaseManifestJson(result),
      throwsA(isA<StateError>()),
    );
  });
}
