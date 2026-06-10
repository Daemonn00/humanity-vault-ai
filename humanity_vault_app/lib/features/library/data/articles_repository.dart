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

      final raw = await rootBundle.loadString(assetPath);
      final article = _parseArticle(raw);
      if (article == null) continue;

      articlesByCategoryFolder.putIfAbsent(categoryFolder, () => []).add(article);
    }

    _articlesByCategoryFolder = articlesByCategoryFolder;
    _loaded = true;
  }

  static Article? _parseArticle(String raw) {
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

  /// Returns all articles across every category, for searching.
  List<Article> getAllArticles() {
    return _articlesByCategoryFolder.values
        .expand((articles) => articles)
        .toList();
  }
}
