import 'package:flutter/material.dart';

/// Represents a top-level emergency preparedness category.
class EmergencyTopic {
  const EmergencyTopic({
    required this.name,
    required this.icon,
    required this.steps,
    required this.reminders,
    this.articleSlugs = const [],
  });

  /// Display name shown to the user.
  final String name;

  /// Icon representing the category.
  final IconData icon;

  /// Step-by-step guidance for this emergency topic.
  final List<String> steps;

  /// Key reminders to keep in mind for this topic.
  final List<String> reminders;

  /// Slugs of knowledge library articles related to this topic.
  final List<String> articleSlugs;
}
