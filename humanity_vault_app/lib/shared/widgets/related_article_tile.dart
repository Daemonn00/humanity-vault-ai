import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../features/library/models/article.dart';
import '../../features/library/presentation/article_detail_screen.dart';

/// A compact, tappable row representing a related article, shown in the
/// "Related Knowledge" section of the Article Detail screen.
class RelatedArticleTile extends StatelessWidget {
  const RelatedArticleTile({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.arrow_forward, color: AppColors.primary),
      title: Text(article.title),
      subtitle: Text(article.subcategory ?? article.category),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ArticleDetailScreen(article: article),
          ),
        );
      },
    );
  }
}
