import 'package:flutter/material.dart';

import '../models/terrain.dart';

/// Provides the canonical list of terrain contexts.
///
/// This is the single source of truth for valid terrain IDs - article
/// frontmatter `terrain:` tags are validated against this list. No
/// database or network access is used - the data is local and static
/// for the MVP. Hazard, priority-order, and related-article fields are
/// intentionally left empty in Phase 1; populating them is content work
/// for a later phase, not part of the foundation layer.
class TerrainRegistry {
  static const List<Terrain> terrains = [
    Terrain(
      id: 'tropical_rainforest',
      displayName: 'Tropical Rainforest',
      icon: Icons.forest,
      summary: 'Dense, humid forest with heavy rainfall and biodiversity.',
    ),
    Terrain(
      id: 'desert',
      displayName: 'Desert',
      icon: Icons.wb_sunny,
      summary:
          'Arid environment with scarce water and extreme temperature swings.',
    ),
    Terrain(
      id: 'coastal',
      displayName: 'Coastal',
      icon: Icons.waves,
      summary: 'Shoreline environment shaped by tides, storms, and saltwater.',
    ),
    Terrain(
      id: 'urban',
      displayName: 'Urban',
      icon: Icons.location_city,
      summary:
          'Built environment with infrastructure, density, and security concerns.',
    ),
  ];

  List<Terrain> getTerrains() => terrains;
}
