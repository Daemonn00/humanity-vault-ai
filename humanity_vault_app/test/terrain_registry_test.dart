// Phase 1 foundation tests for the Terrain system: verifies the static
// TerrainRegistry is internally consistent and that its references
// resolve against real articles and emergency topics.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/emergency/data/emergency_repository.dart';
import 'package:humanity_vault_app/features/library/data/articles_repository.dart';
import 'package:humanity_vault_app/features/terrain/data/terrain_registry.dart';
import 'package:humanity_vault_app/features/terrain/models/terrain.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('terrain IDs are unique and non-empty', () {
    final ids = TerrainRegistry.terrains.map((terrain) => terrain.id);

    expect(ids.every((id) => id.isNotEmpty), isTrue);
    expect(ids.toSet().length, ids.length);
  });

  test('every relatedArticleSlugs entry resolves to a real article', () async {
    await ArticlesRepository.ensureLoaded();
    final validSlugs =
        ArticlesRepository().getAllArticles().map((article) => article.slug).toSet();

    for (final terrain in TerrainRegistry.terrains) {
      for (final slug in terrain.relatedArticleSlugs) {
        expect(
          validSlugs.contains(slug),
          isTrue,
          reason: '${terrain.id} references unknown article slug "$slug"',
        );
      }
    }
  });

  test('every emergencyTopicPriorityOrder entry resolves to a real topic', () {
    final validTopicNames =
        EmergencyRepository.topics.map((topic) => topic.name).toSet();

    for (final terrain in TerrainRegistry.terrains) {
      for (final topicName in terrain.emergencyTopicPriorityOrder) {
        expect(
          validTopicNames.contains(topicName),
          isTrue,
          reason:
              '${terrain.id} references unknown emergency topic "$topicName"',
        );
      }
    }
  });

  test('a broken slug reference is detected as invalid', () async {
    await ArticlesRepository.ensureLoaded();
    final validSlugs =
        ArticlesRepository().getAllArticles().map((article) => article.slug).toSet();

    const brokenTerrain = Terrain(
      id: 'test_only_broken',
      displayName: 'Test Only',
      icon: Icons.help,
      summary: 'Fixture used to prove the slug check can fail.',
      relatedArticleSlugs: ['this_slug_does_not_exist'],
    );

    expect(validSlugs.contains(brokenTerrain.relatedArticleSlugs.first), isFalse);
  });
}
