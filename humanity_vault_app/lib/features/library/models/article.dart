/// Represents a knowledge article entry.
class Article {
  const Article({
    required this.title,
    required this.category,
  });

  /// Title of the article.
  final String title;

  /// Display name of the category this article belongs to.
  final String category;
}
