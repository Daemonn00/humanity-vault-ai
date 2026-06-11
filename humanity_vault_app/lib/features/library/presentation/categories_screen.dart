import 'package:flutter/material.dart';

import '../../../core/theme/app_spacing.dart';
import '../data/categories_repository.dart';
import 'article_list_screen.dart';
import '../../../shared/widgets/category_card.dart';

/// Displays the list of knowledge categories available in the vault.
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoriesRepository().getCategories();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Browse Categories'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(AppSpacing.screenPadding),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: AppSpacing.md,
          crossAxisSpacing: AppSpacing.md,
          childAspectRatio: 1.2,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryCard(
            icon: category.icon,
            name: category.name,
            color: category.color,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      ArticleListScreen(category: category),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
