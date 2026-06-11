import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../models/category.dart';

/// Provides the list of knowledge categories.
///
/// This mirrors the folder structure under the repository's `knowledge/`
/// directory. No database or network access is used - the data is local
/// and static for the MVP.
class CategoriesRepository {
  static const List<Category> categories = [
    Category(
      name: 'Survival',
      folderName: 'survival',
      icon: Icons.terrain,
      color: AppColors.survival,
    ),
    Category(
      name: 'Medicine',
      folderName: 'medicine',
      icon: Icons.medical_services,
      color: AppColors.medicine,
    ),
    Category(
      name: 'Agriculture',
      folderName: 'agriculture',
      icon: Icons.agriculture,
      color: AppColors.agriculture,
    ),
    Category(
      name: 'Engineering',
      folderName: 'engineering',
      icon: Icons.engineering,
      color: AppColors.engineering,
    ),
    Category(
      name: 'Electronics',
      folderName: 'electronics',
      icon: Icons.memory,
      color: AppColors.electronics,
    ),
    Category(
      name: 'Construction',
      folderName: 'construction',
      icon: Icons.construction,
      color: AppColors.construction,
    ),
    Category(
      name: 'History',
      folderName: 'history',
      icon: Icons.history_edu,
      color: AppColors.history,
    ),
    Category(
      name: 'Philosophy',
      folderName: 'philosophy',
      icon: Icons.psychology,
      color: AppColors.philosophy,
    ),
    Category(
      name: 'Islam',
      folderName: 'islam',
      icon: Icons.mosque,
      color: AppColors.islam,
    ),
    Category(
      name: 'Local Wisdom',
      folderName: 'local_wisdom',
      icon: Icons.groups,
      color: AppColors.localWisdom,
    ),
    Category(
      name: 'Communication',
      folderName: 'communication',
      icon: Icons.cell_tower,
      color: AppColors.communication,
    ),
  ];

  List<Category> getCategories() => categories;
}
