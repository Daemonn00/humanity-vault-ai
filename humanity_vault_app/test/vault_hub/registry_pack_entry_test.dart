// Tests for the TEMPORARY app-local registry schema mirror
// (RegistryPackEntry / RegistryData) - specifically that it parses the
// exact shape the Registry Generator's RegistryPackEntry.toJson() /
// RegistryOutput.toJson() produce, and degrades gracefully (skips,
// never throws) on malformed input.

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/vault_hub/models/registry_pack_entry.dart';

Map<String, dynamic> _validPackJson({
  String packId = 'hv_official_test_pack',
  String? version = '1.0.0',
}) {
  return {
    'pack_id': packId,
    'pack_name': 'Test Pack',
    'description': 'A test pack.',
    'category_tags': ['Communication', 'Survival'],
    'trust_tier': 'official',
    'verification_summary': 'Verified Source',
    'latest_version': version,
    'asset_type': 'knowledge_pack',
    'license': null,
    'dependencies': const [],
    'versions': version == null
        ? const []
        : [
            {
              'version': version,
              'publish_date': '2026-07-10T00:00:00.000Z',
              'changelog_summary': 'Initial release.',
              'download_url': 'https://example.test/pack.zip',
              'sha256': 'abc123',
              'size_bytes': 2048,
              'article_count': 4,
              'compatibility': {
                'min_app_version': null,
                'recommended_app_version': null,
              },
              'deprecated': false,
              'deprecated_reason': null,
              'replacement_pack_id': null,
              'archived': false,
              'source_commit': 'deadbeef',
            },
          ],
  };
}

void main() {
  group('RegistryPackEntry.tryParse', () {
    test('parses every field from a well-formed registry pack entry', () {
      final entry = RegistryPackEntry.tryParse(_validPackJson());

      expect(entry, isNotNull);
      expect(entry!.packId, 'hv_official_test_pack');
      expect(entry.packName, 'Test Pack');
      expect(entry.description, 'A test pack.');
      expect(entry.categoryTags, ['Communication', 'Survival']);
      expect(entry.verificationSummary, 'Verified Source');
      expect(entry.version, '1.0.0');
      expect(entry.changelogSummary, 'Initial release.');
      expect(entry.downloadUrl, 'https://example.test/pack.zip');
      expect(entry.sha256, 'abc123');
      expect(entry.sizeBytes, 2048);
      expect(entry.articleCount, 4);
    });

    test('returns null when versions is missing or empty', () {
      final json = _validPackJson()..remove('versions');
      expect(RegistryPackEntry.tryParse(json), isNull);

      final emptyVersions = _validPackJson(version: null);
      expect(RegistryPackEntry.tryParse(emptyVersions), isNull);
    });

    test('returns null when pack_id is missing', () {
      final json = _validPackJson()..remove('pack_id');
      expect(RegistryPackEntry.tryParse(json), isNull);
    });

    test('returns null when the version entry has no download_url or sha256',
        () {
      final json = _validPackJson();
      (json['versions'] as List).first['download_url'] = null;
      expect(RegistryPackEntry.tryParse(json), isNull);
    });

    test('defaults an absent description and verification_summary rather '
        'than failing', () {
      final json = _validPackJson()
        ..remove('description')
        ..remove('verification_summary');
      final entry = RegistryPackEntry.tryParse(json);

      expect(entry, isNotNull);
      expect(entry!.description, isNull);
      expect(entry.verificationSummary, 'Unverified');
    });

    test('never throws on completely malformed input', () {
      expect(
        () => RegistryPackEntry.tryParse({'versions': 'not a list'}),
        returnsNormally,
      );
      expect(RegistryPackEntry.tryParse({'versions': 'not a list'}), isNull);
    });
  });

  group('RegistryData.tryParse', () {
    test('parses a full registry document with multiple packs', () {
      final raw = '''
      {
        "registry_schema_version": "1",
        "generated_at": "2026-07-12T00:00:00.000Z",
        "generator_version": "0.1.0",
        "pack_count": 2,
        "source_repositories": ["Daemonn00/humanity-vault-ai"],
        "packs": [${jsonEncode(_validPackJson(packId: "hv_official_a"))},
                  ${jsonEncode(_validPackJson(packId: "hv_official_b"))}]
      }
      ''';

      final data = RegistryData.tryParse(raw);

      expect(data, isNotNull);
      expect(data!.generatedAt, '2026-07-12T00:00:00.000Z');
      expect(data.packs, hasLength(2));
      expect(
        data.packs.map((p) => p.packId).toSet(),
        {'hv_official_a', 'hv_official_b'},
      );
    });

    test('skips a single malformed pack entry rather than failing the '
        'whole parse', () {
      final raw = '''
      {
        "generated_at": "2026-07-12T00:00:00.000Z",
        "packs": [${jsonEncode(_validPackJson(packId: "hv_official_good"))},
                  {"pack_id": "hv_official_bad"}]
      }
      ''';

      final data = RegistryData.tryParse(raw);

      expect(data, isNotNull);
      expect(data!.packs, hasLength(1));
      expect(data.packs.single.packId, 'hv_official_good');
    });

    test('returns null for invalid JSON', () {
      expect(RegistryData.tryParse('{ not json'), isNull);
    });

    test('returns null when there is no top-level packs array', () {
      expect(RegistryData.tryParse('{"generated_at": "x"}'), isNull);
    });

    test('an empty packs array parses to an empty, valid catalog', () {
      final data = RegistryData.tryParse(
        '{"generated_at": "x", "packs": []}',
      );
      expect(data, isNotNull);
      expect(data!.packs, isEmpty);
    });
  });
}
