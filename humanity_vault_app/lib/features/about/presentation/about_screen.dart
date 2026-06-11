import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/widgets/bullet_list.dart';
import '../../../shared/widgets/section_card.dart';
import '../../library/data/articles_repository.dart';
import '../../library/data/categories_repository.dart';

/// Static screen describing Humanity Vault AI's mission, core
/// principles, and current library status.
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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
        title: const Text('About'),
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
                  'Humanity Vault AI',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'Alpha 1.0 · ${categories.length} categories · $articleCount articles',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.background,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          SectionCard(
            icon: Icons.flag_outlined,
            title: 'Mission',
            child: const Text(
              "Preserve humanity's practical, scientific, cultural, "
              'historical, ethical, and spiritual knowledge for future '
              'generations - accessible even when internet infrastructure '
              'is unavailable.',
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          SectionCard(
            icon: Icons.checklist_outlined,
            title: 'Core Principles',
            child: const BulletList(items: [
              'Offline First',
              'Knowledge First',
              'AI Optional',
              'Open Source',
              'Privacy First',
              'Community Driven',
              'Free Forever',
            ]),
          ),
          const SizedBox(height: AppSpacing.md),
          SectionCard(
            icon: Icons.lock_outline,
            title: 'Offline & Private',
            child: const Text(
              'Humanity Vault works entirely offline. There is no '
              'database, no AI, and no network access required - nothing '
              'you read ever leaves this device.',
            ),
          ),
        ],
      ),
    );
  }
}
