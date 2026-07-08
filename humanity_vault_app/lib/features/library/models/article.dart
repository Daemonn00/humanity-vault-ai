/// Represents a knowledge article entry.
class Article {
  const Article({
    required this.title,
    required this.category,
    required this.summary,
    required this.content,
    required this.benefits,
    required this.sources,
    required this.slug,
    this.relatedSlugs = const [],
    this.terrainIds = const [],
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

  /// Stable identifier derived from the article's filename (no extension).
  final String slug;

  /// Slugs of articles manually marked as related via frontmatter.
  final List<String> relatedSlugs;

  /// Terrain IDs this article is tagged with (see TerrainRegistry).
  /// Empty when the article has no terrain affinity.
  final List<String> terrainIds;

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
