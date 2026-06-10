import 'package:flutter/material.dart';

import 'core/theme/app_colors.dart';
import 'core/theme/app_spacing.dart';
import 'core/theme/app_theme.dart';
import 'features/library/data/articles_repository.dart';
import 'features/library/data/categories_repository.dart';
import 'features/library/presentation/categories_screen.dart';
import 'features/library/presentation/search_screen.dart';
import 'shared/widgets/action_card.dart';

void main() {
  runApp(const HumanityVaultApp());
}

class HumanityVaultApp extends StatelessWidget {
  const HumanityVaultApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Humanity Vault AI',
      theme: AppTheme.light,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoriesRepository().getCategories();
    final articleCount = categories.fold<int>(
      0,
      (total, category) =>
          total + ArticlesRepository().getArticles(category.folderName).length,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Humanity Vault AI'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.screenPadding),
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(AppSpacing.heroRadius),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.eco,
                  size: 40,
                  color: Colors.white,
                ),
                const SizedBox(height: AppSpacing.sm + AppSpacing.xs),
                Text(
                  'Humanity Vault',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'Knowledge for survival, recovery, and rebuilding.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.background,
                      ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  '${categories.length} categories · $articleCount articles',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.background,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          ActionCard(
            icon: Icons.menu_book,
            title: 'Browse Categories',
            subtitle: 'Explore the knowledge library by topic',
            iconBackgroundColor: AppColors.primary.withValues(alpha: 0.12),
            iconColor: AppColors.primary,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CategoriesScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: AppSpacing.md),
          ActionCard(
            icon: Icons.search,
            title: 'Search Knowledge',
            subtitle: 'Find articles across the archive',
            iconBackgroundColor: AppColors.primary.withValues(alpha: 0.12),
            iconColor: AppColors.primary,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: AppSpacing.md),
          ActionCard(
            icon: Icons.warning_amber,
            title: 'Emergency Mode',
            subtitle: 'Quick access to critical survival information',
            iconBackgroundColor: AppColors.emergency.withValues(alpha: 0.12),
            iconColor: AppColors.emergency,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
