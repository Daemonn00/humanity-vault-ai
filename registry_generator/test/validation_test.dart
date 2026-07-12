import 'package:registry_generator/src/models.dart';
import 'package:registry_generator/src/validation.dart';
import 'package:test/test.dart';

PackManifest _manifest({
  String packId = 'hv_official_test_pack',
  String packVersion = '1.0.0',
}) {
  return PackManifest(
    packId: packId,
    packName: 'Test Pack',
    packVersion: packVersion,
    description: 'A test pack.',
  );
}

PackArticle _article({
  required String slug,
  String title = 'Untitled',
  String category = 'Survival',
  String? verificationLevel,
  List<String> terrain = const [],
}) {
  return PackArticle(
    slug: slug,
    title: title,
    category: category,
    verificationLevel: verificationLevel,
    terrain: terrain,
  );
}

void main() {
  group('PackValidation.isWellFormedSemver', () {
    test('accepts X.Y.Z', () {
      expect(PackValidation.isWellFormedSemver('1.0.0'), isTrue);
      expect(PackValidation.isWellFormedSemver('12.34.56'), isTrue);
    });

    test('rejects malformed versions', () {
      expect(PackValidation.isWellFormedSemver('1.0'), isFalse);
      expect(PackValidation.isWellFormedSemver('v1.0.0'), isFalse);
      expect(PackValidation.isWellFormedSemver('1.0.0-beta'), isFalse);
      expect(PackValidation.isWellFormedSemver(''), isFalse);
    });
  });

  group('PackValidation.isOfficialPackId', () {
    test('requires the hv_official_ prefix', () {
      expect(PackValidation.isOfficialPackId('hv_official_foo'), isTrue);
      expect(PackValidation.isOfficialPackId('community_foo'), isFalse);
      expect(PackValidation.isOfficialPackId('foo'), isFalse);
    });
  });

  group('PackValidation.validate', () {
    test('a well-formed pack with valid articles has no errors', () {
      final result = PackValidation.validate(
        manifest: _manifest(),
        articles: [
          _article(slug: 'article_one', verificationLevel: 'Verified Source'),
          _article(slug: 'article_two', category: 'Communication'),
        ],
        releaseVersion: '1.0.0',
      );

      expect(result.hasErrors, isFalse);
      expect(result.validArticles, hasLength(2));
    });

    test('a non-hv_official_ pack_id is a hard error', () {
      final result = PackValidation.validate(
        manifest: _manifest(packId: 'community_foo'),
        articles: [_article(slug: 'a')],
        releaseVersion: '1.0.0',
      );

      expect(result.hasErrors, isTrue);
      expect(
        result.issues.any((i) => i.message.contains('hv_official_')),
        isTrue,
      );
    });

    test('a manifest/release version mismatch is a hard error', () {
      final result = PackValidation.validate(
        manifest: _manifest(packVersion: '1.0.0'),
        articles: [_article(slug: 'a')],
        releaseVersion: '1.0.1',
      );

      expect(result.hasErrors, isTrue);
      expect(
        result.issues.any((i) => i.message.contains('does not match')),
        isTrue,
      );
    });

    test('an invalid category excludes only that article, as a warning',
        () {
      final result = PackValidation.validate(
        manifest: _manifest(),
        articles: [
          _article(slug: 'good', category: 'Survival'),
          _article(slug: 'bad', category: 'Not A Real Category'),
        ],
        releaseVersion: '1.0.0',
      );

      expect(result.hasErrors, isFalse);
      expect(result.validArticles.map((a) => a.slug), ['good']);
      expect(
        result.issues.any((i) => i.isWarning && i.message.contains('bad')),
        isTrue,
      );
    });

    test('an invalid verification_level is a hard error for that article',
        () {
      final result = PackValidation.validate(
        manifest: _manifest(),
        articles: [
          _article(slug: 'a', verificationLevel: 'Extremely Verified'),
        ],
        releaseVersion: '1.0.0',
      );

      expect(result.hasErrors, isTrue);
    });

    test('an invalid terrain ID is dropped but the article is kept, as a '
        'warning', () {
      final result = PackValidation.validate(
        manifest: _manifest(),
        articles: [
          _article(slug: 'a', terrain: ['desert', 'not_a_real_terrain']),
        ],
        releaseVersion: '1.0.0',
      );

      expect(result.hasErrors, isFalse);
      expect(result.validArticles.single.terrain, ['desert']);
      expect(
        result.issues.any(
          (i) => i.isWarning && i.message.contains('not_a_real_terrain'),
        ),
        isTrue,
      );
    });

    test('a slug colliding with the core corpus is a hard error', () {
      final result = PackValidation.validate(
        manifest: _manifest(),
        articles: [_article(slug: 'water_purification')],
        releaseVersion: '1.0.0',
      );

      expect(result.hasErrors, isTrue);
      expect(
        result.issues.any((i) => i.message.contains('core corpus')),
        isTrue,
      );
    });

    test('a duplicate slug within the same pack is a hard error', () {
      final result = PackValidation.validate(
        manifest: _manifest(),
        articles: [
          _article(slug: 'dup', title: 'First'),
          _article(slug: 'dup', title: 'Second'),
        ],
        releaseVersion: '1.0.0',
      );

      expect(result.hasErrors, isTrue);
      expect(result.validArticles, hasLength(1));
    });

    test('zero valid articles is a hard error', () {
      final result = PackValidation.validate(
        manifest: _manifest(),
        articles: [_article(slug: 'a', category: 'Not A Real Category')],
        releaseVersion: '1.0.0',
      );

      expect(result.hasErrors, isTrue);
      expect(
        result.issues.any((i) => i.message.contains('no valid articles')),
        isTrue,
      );
    });
  });

  group('PackValidation.verificationSummary', () {
    test('is Verified Source only when every article is', () {
      expect(
        PackValidation.verificationSummary([
          _article(slug: 'a', verificationLevel: 'Verified Source'),
          _article(slug: 'b', verificationLevel: 'Verified Source'),
        ]),
        'Verified Source',
      );
    });

    test('is Unverified if any single article is Unverified (weakest '
        'link)', () {
      expect(
        PackValidation.verificationSummary([
          _article(slug: 'a', verificationLevel: 'Verified Source'),
          _article(slug: 'b', verificationLevel: 'Unverified'),
        ]),
        'Unverified',
      );
    });

    test('treats a missing verification_level as Unverified', () {
      expect(
        PackValidation.verificationSummary([
          _article(slug: 'a', verificationLevel: 'Verified Source'),
          _article(slug: 'b'),
        ]),
        'Unverified',
      );
    });

    test('falls back to Community Verified for a mix with no Unverified '
        'and no full Verified Source coverage', () {
      expect(
        PackValidation.verificationSummary([
          _article(slug: 'a', verificationLevel: 'Historical Source'),
          _article(slug: 'b', verificationLevel: 'Community Verified'),
        ]),
        'Community Verified',
      );
    });
  });
}
