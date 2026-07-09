import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/widgets/article_index_tile.dart';
import '../../../shared/widgets/bottom_safe_area.dart';
import '../data/article_search.dart';
import '../data/articles_repository.dart';
import '../data/categories_repository.dart';
import '../models/article.dart';
import 'article_detail_screen.dart';

/// Allows searching across all articles by title or category.
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  late final List<Article> _allArticles;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _allArticles = ArticlesRepository().getAllArticles();
    _controller.addListener(() {
      setState(() {
        _query = _controller.text.trim();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _colorForCategory(String categoryName) {
    final categories = CategoriesRepository().getCategories();
    for (final category in categories) {
      if (category.name == categoryName) {
        return category.color;
      }
    }
    return AppColors.primary;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final results = ArticleSearch.search(_allArticles, _query);

    return Scaffold(
      appBar: AppBar(title: const Text('Search Knowledge')),
      body: BottomSafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _controller,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search by title or category',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: AppColors.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Expanded(
                child: _query.isEmpty
                    ? _MessageState(
                        icon: Icons.search,
                        message: 'Type to search the knowledge vault.',
                        colorScheme: colorScheme,
                      )
                    : results.isEmpty
                    ? _MessageState(
                        icon: Icons.search_off,
                        message: 'No matching articles found.',
                        colorScheme: colorScheme,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            results.length == 1
                                ? '1 result'
                                : '${results.length} results',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: colorScheme.onSurfaceVariant),
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Expanded(
                            child: ListView.separated(
                              itemCount: results.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: AppSpacing.sm + AppSpacing.xs,
                                  ),
                              itemBuilder: (context, index) {
                                final article = results[index];
                                return ArticleIndexTile(
                                  title: article.title,
                                  category: article.category,
                                  color: _colorForCategory(article.category),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ArticleDetailScreen(
                                              article: article,
                                            ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A centered icon + message used for the empty/prompt search states.
class _MessageState extends StatelessWidget {
  const _MessageState({
    required this.icon,
    required this.message,
    required this.colorScheme,
  });

  final IconData icon;
  final String message;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48, color: colorScheme.outline),
            const SizedBox(height: AppSpacing.sm + AppSpacing.xs),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
