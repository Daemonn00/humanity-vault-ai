import 'dart:io';

import '../../library/data/articles_repository.dart';
import '../../library/data/markdown_article_parser.dart';
import '../../library/models/article.dart';
import '../../terrain/data/terrain_registry.dart';
import '../models/pack_manifest.dart';
import 'pack_storage.dart';

/// Loads already-installed Knowledge Packs and merges their articles
/// into ArticlesRepository, after the core bundled articles have
/// loaded.
///
/// This is a foundation-only loader: it discovers and reads packs that
/// already exist on disk. It does not import, download, or unzip
/// anything - that is a separate, not-yet-built feature.
class PacksLoader {
  PacksLoader._();

  static const String _manifestFileName = 'manifest.md';

  /// Scans installed packs and merges their valid articles into
  /// ArticlesRepository. Never throws: any failure at any stage - a
  /// missing packs directory, a broken pack, a malformed article - is
  /// caught and skipped so the core bundled articles are always usable
  /// regardless of pack state.
  static Future<void> ensureLoaded() async {
    try {
      await PackStorage.clearStaleStagingDirectory();
      await PackStorage.ensurePacksDirectoryExists();
      final packsDir = await PackStorage.packsDirectory();
      await loadPacksFrom(packsDir);
    } catch (_) {
      // Pack loading must never prevent the app from starting.
    }
  }

  /// Loads every pack found directly under [packsDir] and merges their
  /// valid articles into ArticlesRepository. Kept separate from
  /// [ensureLoaded] so it can be exercised in tests against a plain
  /// temp directory, with no path_provider involved.
  ///
  /// Packs are processed in sorted folder-name order, and articles
  /// within a pack in sorted file-name order, so that duplicate-slug
  /// skipping is deterministic: the first occurrence encountered wins.
  static Future<void> loadPacksFrom(Directory packsDir) async {
    try {
      final packDirs = await PackStorage.listPackDirectoriesIn(packsDir);
      final validTerrainIds =
          TerrainRegistry.terrains.map((terrain) => terrain.id).toSet();
      final knownSlugs =
          ArticlesRepository().getAllArticles().map((a) => a.slug).toSet();

      for (final packDir in packDirs) {
        try {
          await _loadPack(packDir, validTerrainIds, knownSlugs);
        } catch (_) {
          // One broken pack must never block another valid pack.
          continue;
        }
      }
    } catch (_) {
      // Defensive: scanning itself must never throw out of this method.
    }
  }

  static Future<void> _loadPack(
    Directory packDir,
    Set<String> validTerrainIds,
    Set<String> knownSlugs,
  ) async {
    final manifestFile = File('${packDir.path}/$_manifestFileName');
    if (!await manifestFile.exists()) return;

    final manifest = PackManifest.tryParse(await manifestFile.readAsString());
    if (manifest == null) return;

    final articlesByCategoryFolder = <String, List<Article>>{};

    final categoryDirs = (await packDir.list().toList())
        .whereType<Directory>()
        .toList()
      ..sort((a, b) => a.path.compareTo(b.path));

    for (final categoryDir in categoryDirs) {
      final folderName = categoryDir.uri.pathSegments
          .where((segment) => segment.isNotEmpty)
          .last;
      if (!ArticlesRepository.isKnownCategoryFolder(folderName)) continue;

      final articleFiles = (await categoryDir.list().toList())
          .whereType<File>()
          .where((file) => file.path.endsWith('.md'))
          .toList()
        ..sort((a, b) => a.path.compareTo(b.path));

      for (final articleFile in articleFiles) {
        final article = await _tryParseArticle(articleFile, validTerrainIds);
        if (article == null) continue;
        if (knownSlugs.contains(article.slug)) continue;

        knownSlugs.add(article.slug);
        articlesByCategoryFolder
            .putIfAbsent(folderName, () => [])
            .add(article);
      }
    }

    if (articlesByCategoryFolder.isNotEmpty) {
      ArticlesRepository.mergeAdditionalArticles(articlesByCategoryFolder);
    }
  }

  static Future<Article?> _tryParseArticle(
    File file,
    Set<String> validTerrainIds,
  ) async {
    try {
      final raw = await file.readAsString();
      final fileName =
          file.uri.pathSegments.where((segment) => segment.isNotEmpty).last;
      final slug = fileName.substring(0, fileName.length - '.md'.length);

      final doc = MarkdownArticleParser.parse(raw);
      final title = doc.field('title');
      final category = doc.field('category');
      if (title == null || category == null) return null;

      final terrainIds = MarkdownArticleParser.splitList(doc.field('terrain'))
          .where(validTerrainIds.contains)
          .toList();

      return Article(
        title: title,
        category: category,
        summary: doc.section('summary'),
        content: doc.section('main content'),
        benefits:
            MarkdownArticleParser.extractBulletItems(doc.section('benefits')),
        sources:
            MarkdownArticleParser.extractBulletItems(doc.section('sources')),
        slug: slug,
        relatedSlugs:
            MarkdownArticleParser.splitList(doc.field('related_articles')),
        terrainIds: terrainIds,
        subcategory: doc.field('subcategory'),
        author: doc.field('author'),
        lastUpdated: doc.field('last_updated'),
        knowledgeLevel: doc.field('knowledge_level'),
        verificationLevel: doc.field('verification_level'),
      );
    } catch (_) {
      return null;
    }
  }
}
