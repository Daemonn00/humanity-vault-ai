import 'package:flutter/material.dart';

/// Represents one terrain/environment context used to prioritize
/// existing knowledge and Emergency Mode topics.
class Terrain {
  const Terrain({
    required this.id,
    required this.displayName,
    required this.icon,
    required this.summary,
    this.primaryHazards = const [],
    this.emergencyTopicPriorityOrder = const [],
    this.relatedArticleSlugs = const [],
  });

  /// Stable snake_case identifier (e.g. `desert`), matches the values
  /// used in article frontmatter `terrain:` tags.
  final String id;

  /// Display name shown to the user.
  final String displayName;

  /// Icon representing this terrain.
  final IconData icon;

  /// One or two sentence framing of the environment.
  final String summary;

  /// Short, terrain-specific hazard facts. Not how-to guidance -
  /// procedural content stays in knowledge articles.
  final List<String> primaryHazards;

  /// Ordered list of EmergencyTopic.name values used to reorder
  /// Emergency Mode topics when this terrain is selected.
  final List<String> emergencyTopicPriorityOrder;

  /// Optional curated "start here" article slugs for this terrain.
  final List<String> relatedArticleSlugs;
}
