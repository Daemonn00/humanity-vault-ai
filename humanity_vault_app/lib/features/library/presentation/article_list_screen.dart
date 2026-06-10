import 'package:flutter/material.dart';

import '../../../core/theme/app_spacing.dart';
import '../data/articles_repository.dart';
import '../models/category.dart';
import 'article_detail_screen.dart';

/// Displays the list of articles available within a category.
class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    final articles = ArticlesRepository().getArticles(category.folderName);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: articles.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.menu_book_outlined,
                      size: 48,
                      color: colorScheme.outline,
                    ),
                    const SizedBox(height: AppSpacing.sm + AppSpacing.xs),
                    Text(
                      'No articles available yet.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.screenPadding),
              itemCount: articles.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: AppSpacing.sm + AppSpacing.xs),
              itemBuilder: (context, index) {
                final article = articles[index];
                return Card(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              ArticleDetailScreen(article: article),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor:
                                category.color.withValues(alpha: 0.12),
                            child: Icon(
                              Icons.article_outlined,
                              color: category.color,
                            ),
                          ),
                          const SizedBox(width: AppSpacing.md),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  article.title,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  article.category,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
