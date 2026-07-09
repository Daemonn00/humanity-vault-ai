import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/widgets/bottom_safe_area.dart';
import '../../../shared/widgets/bullet_list.dart';
import '../../../shared/widgets/section_card.dart';
import '../../library/data/articles_repository.dart';
import '../../library/models/article.dart';
import '../../library/presentation/article_detail_screen.dart';
import '../models/emergency_topic.dart';

/// Displays guidance for a single emergency preparedness topic.
class EmergencyCategoryScreen extends StatelessWidget {
  const EmergencyCategoryScreen({super.key, required this.topic});

  final EmergencyTopic topic;

  @override
  Widget build(BuildContext context) {
    final articlesBySlug = {
      for (final article in ArticlesRepository().getAllArticles())
        article.slug: article,
    };
    final relatedArticles = topic.articleSlugs
        .map((slug) => articlesBySlug[slug])
        .whereType<Article>()
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text(topic.name)),
      body: BottomSafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.screenPadding),
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.emergencyPrimary,
                borderRadius: BorderRadius.circular(AppSpacing.heroRadius),
              ),
              child: Row(
                children: [
                  Icon(topic.icon, size: 40, color: Colors.white),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Text(
                      topic.name,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            SectionCard(
              icon: Icons.checklist,
              title: 'What To Do',
              child: BulletList(items: topic.steps),
            ),
            const SizedBox(height: AppSpacing.md),
            SectionCard(
              icon: Icons.lightbulb_outline,
              title: 'Key Reminders',
              child: BulletList(items: topic.reminders),
            ),
            if (relatedArticles.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.md),
              SectionCard(
                icon: Icons.menu_book_outlined,
                title: 'Learn More',
                child: Column(
                  children: [
                    for (final article in relatedArticles)
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: AppSpacing.xs,
                        ),
                        title: Text(article.title),
                        subtitle: Text(article.category),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ArticleDetailScreen(article: article),
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
