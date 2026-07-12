import 'package:flutter/material.dart';

import 'core/theme/app_colors.dart';
import 'core/theme/app_spacing.dart';
import 'core/theme/app_theme.dart';
import 'features/about/presentation/about_screen.dart';
import 'features/library/data/articles_repository.dart';
import 'features/library/data/categories_repository.dart';
import 'features/ask_vault/presentation/ask_vault_screen.dart';
import 'features/emergency/presentation/emergency_screen.dart';
import 'features/library/presentation/categories_screen.dart';
import 'features/library/presentation/search_screen.dart';
import 'features/packs/data/packs_loader.dart';
import 'features/vault_hub/presentation/vault_hub_screen.dart';
import 'shared/widgets/action_card.dart';
import 'shared/widgets/bottom_safe_area.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ArticlesRepository.ensureLoaded();
  // Defensive time bound on top of PacksLoader's own internal
  // error-swallowing: pack loading must never delay app startup,
  // regardless of platform or storage state.
  await PacksLoader.ensureLoaded().timeout(
    const Duration(seconds: 3),
    onTimeout: () {},
  );
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
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'About',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AboutScreen()),
              );
            },
          ),
        ],
      ),
      body: BottomSafeArea(
        child: ListView(
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
                  const Icon(Icons.eco, size: 40, color: Colors.white),
                  const SizedBox(height: AppSpacing.sm + AppSpacing.xs),
                  Text(
                    'Humanity Vault',
                    style: Theme.of(
                      context,
                    ).textTheme.headlineMedium?.copyWith(color: Colors.white),
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
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                );
              },
            ),
            const SizedBox(height: AppSpacing.md),
            ActionCard(
              icon: Icons.warning_amber,
              title: 'Emergency Mode',
              subtitle: 'Quick access to critical survival information',
              iconBackgroundColor: Colors.white,
              iconColor: AppColors.emergencyPrimary,
              backgroundColor: AppColors.emergencySecondary,
              borderColor: AppColors.emergencyPrimary,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const EmergencyScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: AppSpacing.md),
            ActionCard(
              icon: Icons.help_outline,
              title: 'Ask the Vault',
              subtitle: 'Find exact passages that answer your question',
              iconBackgroundColor: AppColors.primary.withValues(alpha: 0.12),
              iconColor: AppColors.primary,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AskVaultScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: AppSpacing.md),
            ActionCard(
              icon: Icons.storefront_outlined,
              title: 'Vault Hub',
              subtitle: 'Browse and install official Knowledge Packs',
              iconBackgroundColor: AppColors.primary.withValues(alpha: 0.12),
              iconColor: AppColors.primary,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const VaultHubScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
