import 'package:flutter/material.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../shared/widgets/article_index_tile.dart';
import '../../../shared/widgets/bottom_safe_area.dart';
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
      appBar: AppBar(title: Text(category.name)),
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
          : BottomSafeArea(
              child: ListView.separated(
                padding: const EdgeInsets.all(AppSpacing.screenPadding),
                itemCount: articles.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: AppSpacing.sm + AppSpacing.xs),
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return ArticleIndexTile(
                    title: article.title,
                    category: article.category,
                    color: category.color,
                    index: index + 1,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              ArticleDetailScreen(article: article),
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
