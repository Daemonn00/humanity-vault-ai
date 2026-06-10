import 'package:flutter/material.dart';

/// Represents a top-level knowledge category, corresponding to a folder
/// under the repository's `knowledge/` directory.
class Category {
  const Category({
    required this.name,
    required this.folderName,
    required this.icon,
    required this.color,
  });

  /// Display name shown to the user.
  final String name;

  /// Folder name under `knowledge/` (e.g. `local_wisdom`).
  final String folderName;

  /// Icon representing the category.
  final IconData icon;

  /// Muted accent color representing this category.
  final Color color;
}
