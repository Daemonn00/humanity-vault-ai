import 'package:flutter/material.dart';

import '../../emergency/models/emergency_topic.dart';
import '../models/terrain.dart';

/// Provides the canonical list of terrain contexts.
///
/// This is the single source of truth for valid terrain IDs - article
/// frontmatter `terrain:` tags are validated against this list. No
/// database or network access is used - the data is local and static
/// for the MVP.
class TerrainRegistry {
  static const List<Terrain> terrains = [
    Terrain(
      id: 'tropical_rainforest',
      displayName: 'Tropical Rainforest',
      icon: Icons.forest,
      summary: 'Dense, humid forest with heavy rainfall and biodiversity.',
      emergencyTopicPriorityOrder: [
        'Water',
        'Medical',
        'Shelter',
        'Fire',
        'Food & Foraging',
        'Communication',
        'Security & Defense',
      ],
    ),
    Terrain(
      id: 'desert',
      displayName: 'Desert',
      icon: Icons.wb_sunny,
      summary:
          'Arid environment with scarce water and extreme temperature swings.',
      emergencyTopicPriorityOrder: [
        'Water',
        'Shelter',
        'Medical',
        'Fire',
        'Communication',
        'Food & Foraging',
        'Security & Defense',
      ],
    ),
    Terrain(
      id: 'coastal',
      displayName: 'Coastal',
      icon: Icons.waves,
      summary: 'Shoreline environment shaped by tides, storms, and saltwater.',
      emergencyTopicPriorityOrder: [
        'Shelter',
        'Water',
        'Medical',
        'Communication',
        'Food & Foraging',
        'Fire',
        'Security & Defense',
      ],
    ),
    Terrain(
      id: 'urban',
      displayName: 'Urban',
      icon: Icons.location_city,
      summary:
          'Built environment with infrastructure, density, and security concerns.',
      emergencyTopicPriorityOrder: [
        'Security & Defense',
        'Water',
        'Communication',
        'Medical',
        'Fire',
        'Shelter',
        'Food & Foraging',
      ],
    ),
  ];

  List<Terrain> getTerrains() => terrains;

  /// Reorders [topics] so that any topic named in [terrainId]'s
  /// `emergencyTopicPriorityOrder` appears first (in that declared
  /// order), followed by every other topic in its original relative
  /// order. Never removes a topic. Returns [topics] unchanged if
  /// [terrainId] is null, unknown, or has an empty priority order.
  static List<EmergencyTopic> reorderTopicsForTerrain(
    List<EmergencyTopic> topics,
    String? terrainId,
  ) {
    if (terrainId == null) return topics;

    Terrain? terrain;
    for (final candidate in terrains) {
      if (candidate.id == terrainId) {
        terrain = candidate;
        break;
      }
    }
    if (terrain == null || terrain.emergencyTopicPriorityOrder.isEmpty) {
      return topics;
    }

    final topicsByName = {for (final topic in topics) topic.name: topic};
    final reordered = <EmergencyTopic>[];
    final seenNames = <String>{};

    for (final name in terrain.emergencyTopicPriorityOrder) {
      final topic = topicsByName[name];
      if (topic != null && seenNames.add(topic.name)) {
        reordered.add(topic);
      }
    }

    for (final topic in topics) {
      if (!seenNames.contains(topic.name)) {
        reordered.add(topic);
      }
    }

    return reordered;
  }
}
