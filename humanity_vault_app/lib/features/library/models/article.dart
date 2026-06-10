/// Represents a knowledge article entry.
class Article {
  const Article({
    required this.title,
    required this.category,
    required this.summary,
    required this.content,
    required this.benefits,
    required this.sources,
  });

  /// Title of the article.
  final String title;

  /// Display name of the category this article belongs to.
  final String category;

  /// Short summary of the article.
  final String summary;

  /// Main body content of the article.
  final String content;

  /// Key benefits or takeaways of the knowledge in this article.
  final List<String> benefits;

  /// Sources the article's information is drawn from.
  final List<String> sources;
}
