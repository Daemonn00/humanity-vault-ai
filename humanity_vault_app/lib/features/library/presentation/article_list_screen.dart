import 'package:flutter/material.dart';

import '../data/articles_repository.dart';
import '../models/category.dart';

/// Displays the list of articles available within a category.
class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    final articles = ArticlesRepository().getArticles(category.folderName);

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: articles.isEmpty
          ? const Center(
              child: Text('No articles available yet.'),
            )
          : ListView.separated(
              itemCount: articles.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final article = articles[index];
                return ListTile(
                  leading: const Icon(Icons.article_outlined),
                  title: Text(article.title),
                  subtitle: Text(article.category),
                  onTap: () {},
                );
              },
            ),
    );
  }
}
