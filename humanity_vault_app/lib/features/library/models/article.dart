/// Represents a knowledge article entry.
class Article {
  const Article({
    required this.title,
    required this.category,
    required this.summary,
    required this.content,
    required this.benefits,
    required this.sources,
    this.subcategory,
    this.author,
    this.lastUpdated,
    this.knowledgeLevel,
    this.verificationLevel,
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

  /// Optional subcategory/topic within the category (e.g. "Water").
  final String? subcategory;

  /// Optional author or contributor credit.
  final String? author;

  /// Optional last-updated date, as written in the source file.
  final String? lastUpdated;

  /// Optional knowledge level (e.g. "Level 1").
  final String? knowledgeLevel;

  /// Optional verification level (e.g. "Verified Source").
  final String? verificationLevel;
}
