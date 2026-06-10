import 'package:flutter/material.dart';

import '../models/category.dart';

/// Provides the list of knowledge categories.
///
/// This mirrors the folder structure under the repository's `knowledge/`
/// directory. No database or network access is used - the data is local
/// and static for the MVP.
class CategoriesRepository {
  static const List<Category> categories = [
    Category(name: 'Survival', folderName: 'survival', icon: Icons.terrain),
    Category(
      name: 'Medicine',
      folderName: 'medicine',
      icon: Icons.medical_services,
    ),
    Category(
      name: 'Agriculture',
      folderName: 'agriculture',
      icon: Icons.agriculture,
    ),
    Category(
      name: 'Engineering',
      folderName: 'engineering',
      icon: Icons.engineering,
    ),
    Category(
      name: 'Electronics',
      folderName: 'electronics',
      icon: Icons.memory,
    ),
    Category(
      name: 'Construction',
      folderName: 'construction',
      icon: Icons.construction,
    ),
    Category(name: 'History', folderName: 'history', icon: Icons.history_edu),
    Category(
      name: 'Philosophy',
      folderName: 'philosophy',
      icon: Icons.psychology,
    ),
    Category(name: 'Islam', folderName: 'islam', icon: Icons.mosque),
    Category(
      name: 'Local Wisdom',
      folderName: 'local_wisdom',
      icon: Icons.groups,
    ),
  ];

  List<Category> getCategories() => categories;
}
