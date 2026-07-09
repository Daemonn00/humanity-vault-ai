import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/widgets/article_metadata_bar.dart';
import '../../../shared/widgets/bottom_safe_area.dart';
import '../../../shared/widgets/bullet_list.dart';
import '../../../shared/widgets/related_article_tile.dart';
import '../../../shared/widgets/section_card.dart';
import '../data/articles_repository.dart';
import '../models/article.dart';

/// Displays the full content of a single article.
class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    final relatedArticles = ArticlesRepository().getRelatedArticles(article);

    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: BottomSafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
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
                      Text(
                        article.title,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: AppSpacing.sm + AppSpacing.xs),
                      Chip(
                        label: Text(article.category),
                        backgroundColor: AppColors.accent,
                        labelStyle: const TextStyle(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                ArticleMetadataBar(article: article),
                const SizedBox(height: AppSpacing.md),
                SectionCard(
                  icon: Icons.summarize_outlined,
                  title: 'Summary',
                  child: Text(article.summary),
                ),
                const SizedBox(height: AppSpacing.md),
                SectionCard(
                  icon: Icons.menu_book_outlined,
                  title: 'Main Content',
                  child: Text(article.content),
                ),
                const SizedBox(height: AppSpacing.md),
                SectionCard(
                  icon: Icons.check_circle_outline,
                  title: 'Benefits',
                  child: BulletList(items: article.benefits),
                ),
                const SizedBox(height: AppSpacing.md),
                SectionCard(
                  icon: Icons.fact_check_outlined,
                  title: 'Sources',
                  child: BulletList(items: article.sources),
                ),
                if (relatedArticles.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.md),
                  SectionCard(
                    icon: Icons.link,
                    title: 'Related Knowledge',
                    child: Column(
                      children: [
                        for (final related in relatedArticles)
                          RelatedArticleTile(article: related),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
