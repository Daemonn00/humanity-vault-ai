import 'dart:convert';

import 'package:release_pipeline/src/in_memory_release_source.dart';
import 'package:test/test.dart';

void main() {
  group('InMemoryReleaseSource', () {
    late InMemoryReleaseSource source;
    final zipBytes = utf8.encode('fake zip bytes');

    setUp(() {
      source = InMemoryReleaseSource(
        packId: 'hv_official_test_pack',
        version: '1.0.0',
        zipBytes: zipBytes,
        assetFileName: 'hv_official_test_pack-v1.0.0.zip',
        changelogSummary: 'Test changelog.',
      );
    });

    test('findRelease returns a matching release for the exact seeded '
        'packId/version', () async {
      final release =
          await source.findRelease('hv_official_test_pack', '1.0.0');

      expect(release, isNotNull);
      expect(release!.tagName, 'hv_official_test_pack-v1.0.0');
      expect(release.version, '1.0.0');
      expect(release.body, 'Test changelog.');
      expect(release.assets, hasLength(1));
      expect(release.assets.single.name, 'hv_official_test_pack-v1.0.0.zip');
    });

    test('findRelease returns null for a different packId', () async {
      final release = await source.findRelease('hv_official_other', '1.0.0');
      expect(release, isNull);
    });

    test('findRelease returns null for a different version', () async {
      final release =
          await source.findRelease('hv_official_test_pack', '2.0.0');
      expect(release, isNull);
    });

    test('downloadAsset always returns the seeded bytes', () async {
      final release =
          await source.findRelease('hv_official_test_pack', '1.0.0');
      final bytes = await source.downloadAsset(release!.assets.single);
      expect(bytes, zipBytes);
    });
  });
}
