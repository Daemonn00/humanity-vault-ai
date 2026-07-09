import 'package:flutter/services.dart' show AssetManifest, rootBundle;

import '../models/article.dart';
import 'markdown_article_parser.dart';

/// Provides the list of articles for each knowledge category.
///
/// Articles are loaded from Markdown files bundled under the `knowledge/`
/// asset directory. No database or network access is used - all data is
/// local and discovered via the Flutter asset bundle.
class ArticlesRepository {
  static Map<String, List<Article>> _articlesByCategoryFolder = {};
  static bool _loaded = false;

  /// Loads and parses all knowledge Markdown files from assets.
  ///
  /// Must be awaited before the app's first build so that
  /// [getArticles] and [getAllArticles] return populated data.
  static Future<void> ensureLoaded() async {
    if (_loaded) return;

    final assetManifest = await AssetManifest.loadFromAssetBundle(rootBundle);
    final assetPaths = assetManifest.listAssets();

    final articlesByCategoryFolder = <String, List<Article>>{};

    for (final assetPath in assetPaths) {
      if (!assetPath.startsWith('knowledge/') || !assetPath.endsWith('.md')) {
        continue;
      }
      if (assetPath.endsWith('README.md')) {
        continue;
      }

      final segments = assetPath.split('/');
      if (segments.length < 3) continue;
      final categoryFolder = segments[1];

      final fileName = segments.last;
      final slug = fileName.substring(0, fileName.length - '.md'.length);

      final raw = await rootBundle.loadString(assetPath);
      final article = _parseArticle(raw, slug);
      if (article == null) continue;

      articlesByCategoryFolder.putIfAbsent(categoryFolder, () => []).add(article);
    }

    _articlesByCategoryFolder = articlesByCategoryFolder;
    _loaded = true;
  }

  static Article? _parseArticle(String raw, String slug) {
    final doc = MarkdownArticleParser.parse(raw);
    final title = doc.field('title');
    final category = doc.field('category');
    if (title == null || category == null) return null;

    return Article(
      title: title,
      category: category,
      summary: doc.section('summary'),
      content: doc.section('main content'),
      benefits: MarkdownArticleParser.extractBulletItems(doc.section('benefits')),
      sources: MarkdownArticleParser.extractBulletItems(doc.section('sources')),
      slug: slug,
      relatedSlugs: MarkdownArticleParser.splitList(doc.field('related_articles')),
      terrainIds: MarkdownArticleParser.splitList(doc.field('terrain')),
      subcategory: doc.field('subcategory'),
      author: doc.field('author'),
      lastUpdated: doc.field('last_updated'),
      knowledgeLevel: doc.field('knowledge_level'),
      verificationLevel: doc.field('verification_level'),
    );
  }

  /// Returns all articles for the given category folder name.
  List<Article> getArticles(String categoryFolder) {
    return _articlesByCategoryFolder[categoryFolder] ?? const [];
  }

  /// Whether [categoryFolder] already has core articles loaded under
  /// it. Used to gate Knowledge Pack articles to existing categories
  /// only - a pack can never introduce a brand-new category.
  static bool isKnownCategoryFolder(String categoryFolder) {
    return _articlesByCategoryFolder.containsKey(categoryFolder);
  }

  /// Merges additional articles (e.g. from an installed Knowledge
  /// Pack) into already-known category folders. Callers are
  /// responsible for validation (known category, no duplicate slugs)
  /// before calling this - it trusts its input and only appends.
  static void mergeAdditionalArticles(
    Map<String, List<Article>> articlesByCategoryFolder,
  ) {
    articlesByCategoryFolder.forEach((categoryFolder, articles) {
      _articlesByCategoryFolder
          .putIfAbsent(categoryFolder, () => [])
          .addAll(articles);
    });
  }

  /// Returns all articles across every category, for searching.
  List<Article> getAllArticles() {
    return _articlesByCategoryFolder.values
        .expand((articles) => articles)
        .toList();
  }

  /// Returns up to [limit] articles related to [article].
  ///
  /// Manually-listed `related_articles` slugs are returned first (in the
  /// order given), followed by automatic suggestions: other articles
  /// sharing the same subcategory, then the same category. The current
  /// article is always excluded.
  List<Article> getRelatedArticles(Article article, {int limit = 3}) {
    final all = getAllArticles();
    final related = <Article>[];
    final seenSlugs = <String>{article.slug};

    for (final slug in article.relatedSlugs) {
      if (related.length >= limit) break;
      for (final candidate in all) {
        if (candidate.slug == slug && seenSlugs.add(candidate.slug)) {
          related.add(candidate);
          break;
        }
      }
    }

    if (article.subcategory != null) {
      for (final candidate in all) {
        if (related.length >= limit) break;
        if (seenSlugs.contains(candidate.slug)) continue;
        if (candidate.subcategory == article.subcategory) {
          related.add(candidate);
          seenSlugs.add(candidate.slug);
        }
      }
    }

    for (final candidate in all) {
      if (related.length >= limit) break;
      if (seenSlugs.contains(candidate.slug)) continue;
      if (candidate.category == article.category) {
        related.add(candidate);
        seenSlugs.add(candidate.slug);
      }
    }

    return related;
  }
}
