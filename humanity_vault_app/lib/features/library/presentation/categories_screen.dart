import 'package:flutter/material.dart';

import '../../../core/theme/app_spacing.dart';
import '../data/articles_repository.dart';
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
      body: SafeArea(
        top: false,
        child: GridView.builder(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.screenPadding,
            AppSpacing.screenPadding,
            AppSpacing.screenPadding,
            AppSpacing.screenPadding + AppSpacing.sm,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: AppSpacing.md,
            crossAxisSpacing: AppSpacing.md,
            childAspectRatio: 1.3,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return CategoryCard(
              icon: category.icon,
              name: category.name,
              color: category.color,
              index: index + 1,
              articleCount:
                  ArticlesRepository().getArticles(category.folderName).length,
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
      ),
    );
  }
}
