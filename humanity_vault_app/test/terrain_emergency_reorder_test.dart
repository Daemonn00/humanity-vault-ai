// Unit tests for TerrainRegistry.reorderTopicsForTerrain: the pure
// function that reorders Emergency Mode topics by terrain priority
// without ever hiding a topic.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/emergency/models/emergency_topic.dart';
import 'package:humanity_vault_app/features/terrain/data/terrain_registry.dart';

void main() {
  // "Extra Topic A/B" are not named in any registry terrain's priority
  // order, so they exercise the "unprioritized" fallback path.
  const topics = [
    EmergencyTopic(name: 'Water', icon: Icons.water_drop, steps: [], reminders: []),
    EmergencyTopic(name: 'Extra Topic A', icon: Icons.help, steps: [], reminders: []),
    EmergencyTopic(name: 'Shelter', icon: Icons.cabin, steps: [], reminders: []),
    EmergencyTopic(name: 'Extra Topic B', icon: Icons.help, steps: [], reminders: []),
  ];

  test('prioritized topics appear first in declared order', () {
    final result = TerrainRegistry.reorderTopicsForTerrain(
      topics,
      'desert',
    );

    // Desert's priority order is Water, Shelter, Medical, Fire, ... -
    // Water and Shelter are the only two present in this topic set, and
    // must appear first, in that order.
    expect(result.map((t) => t.name).take(2), ['Water', 'Shelter']);
  });

  test('unprioritized topics keep their original relative order', () {
    final result = TerrainRegistry.reorderTopicsForTerrain(
      topics,
      'desert',
    );

    // Extra Topic A and B are not in desert's priority list at all, so
    // they must be appended after the prioritized topics, in their
    // original relative order (A before B).
    final names = result.map((t) => t.name).toList();
    expect(names.sublist(2), ['Extra Topic A', 'Extra Topic B']);
  });

  test('all topics remain present regardless of terrain', () {
    for (final terrainId in [
      null,
      'tropical_rainforest',
      'desert',
      'coastal',
      'urban',
    ]) {
      final result = TerrainRegistry.reorderTopicsForTerrain(topics, terrainId);
      expect(result.length, topics.length);
      expect(
        result.map((t) => t.name).toSet(),
        topics.map((t) => t.name).toSet(),
      );
    }
  });

  test('no terrain selected returns the original order unchanged', () {
    final result = TerrainRegistry.reorderTopicsForTerrain(topics, null);
    expect(result, same(topics));
  });

  test('a terrain with an empty priority list returns the original order', () {
    const emptyPriorityTopics = [
      EmergencyTopic(name: 'Solo Topic', icon: Icons.help, steps: [], reminders: []),
    ];

    // No terrain in the registry has an empty priority list today, so
    // this proves the fallback branch directly using an unknown ID,
    // which hits the same "no reordering happens" code path.
    final result = TerrainRegistry.reorderTopicsForTerrain(
      emptyPriorityTopics,
      'unknown_terrain',
    );
    expect(result, same(emptyPriorityTopics));
  });
}
