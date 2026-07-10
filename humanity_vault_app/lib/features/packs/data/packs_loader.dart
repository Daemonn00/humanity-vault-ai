import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;

import '../../library/data/articles_repository.dart';
import '../../library/data/categories_repository.dart';
import '../../library/data/markdown_article_parser.dart';
import '../../library/models/article.dart';
import '../../terrain/data/terrain_registry.dart';
import '../models/installed_pack_summary.dart';
import '../models/pack_manifest.dart';
import 'pack_storage.dart';

/// The outcome of parsing one pack's article files.
class PackParseResult {
  const PackParseResult({
    required this.articlesByCategoryFolder,
    required this.acceptedCount,
    required this.skippedCount,
  });

  /// Accepted articles, grouped by the existing category folder they
  /// should merge into.
  final Map<String, List<Article>> articlesByCategoryFolder;

  /// Number of articles that parsed and validated successfully.
  final int acceptedCount;

  /// Number of article files that were skipped (malformed, unknown
  /// category, or a duplicate slug).
  final int skippedCount;
}

/// Loads already-installed Knowledge Packs and merges their articles
/// into ArticlesRepository, after the core bundled articles have
/// loaded.
///
/// This is a foundation-only loader: it discovers and reads packs that
/// already exist on disk. Importing a new pack (ZIP selection,
/// extraction, validation, and committing to permanent storage) is a
/// separate concern - see PackImporter.
class PacksLoader {
  PacksLoader._();

  static const String _manifestFileName = 'manifest.md';

  /// Scans installed packs and merges their valid articles into
  /// ArticlesRepository. Never throws: any failure at any stage - a
  /// missing packs directory, a broken pack, a malformed article - is
  /// caught and skipped so the core bundled articles are always usable
  /// regardless of pack state.
  static Future<void> ensureLoaded() async {
    // Knowledge Packs are local-filesystem storage, an Android-focused
    // concept - dart:io/path_provider do not behave the same way in a
    // browser, so there is nothing to scan on web.
    if (kIsWeb) return;

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
  /// within a pack in sorted file-path order, so that duplicate-slug
  /// skipping is deterministic: the first occurrence encountered wins.
  static Future<void> loadPacksFrom(Directory packsDir) async {
    try {
      final packDirs = await PackStorage.listPackDirectoriesIn(packsDir);
      final validTerrainIds = TerrainRegistry.terrains
          .map((terrain) => terrain.id)
          .toSet();
      final knownSlugs = ArticlesRepository()
          .getAllArticles()
          .map((a) => a.slug)
          .toSet();

      for (final packDir in packDirs) {
        try {
          final manifestFile = File('${packDir.path}/$_manifestFileName');
          if (!await manifestFile.exists()) continue;

          final manifest = PackManifest.tryParse(
            await manifestFile.readAsString(),
          );
          if (manifest == null) continue;

          final result = await parsePackContents(
            packDir,
            validTerrainIds,
            knownSlugs,
          );
          if (result.acceptedCount > 0) {
            ArticlesRepository.mergeAdditionalArticles(
              result.articlesByCategoryFolder,
            );
          }
        } catch (_) {
          // One broken pack must never block another valid pack.
          continue;
        }
      }
    } catch (_) {
      // Defensive: scanning itself must never throw out of this method.
    }
  }

  /// Parses every `.md` article file found anywhere under [packDir]
  /// (the root `manifest.md` is ignored here - callers handle the
  /// manifest separately), so articles may sit at the pack root or in
  /// any subfolder.
  ///
  /// An article's target category folder is resolved from its own
  /// `category:` frontmatter field (matched against the existing,
  /// already-loaded category names) - not from its file location.
  /// Malformed articles, articles whose category doesn't match an
  /// existing category, and slugs already present in [knownSlugs] are
  /// skipped; invalid terrain IDs are stripped while the article is
  /// kept. [knownSlugs] is mutated in place with every newly-accepted
  /// slug, so sequential calls across multiple packs stay deduplicated
  /// against each other.
  static Future<PackParseResult> parsePackContents(
    Directory packDir,
    Set<String> validTerrainIds,
    Set<String> knownSlugs,
  ) async {
    final categoryFolderByDisplayName = {
      for (final category in CategoriesRepository().getCategories())
        category.name: category.folderName,
    };

    final articleFiles =
        (await packDir.list(recursive: true).toList())
            .whereType<File>()
            .where(
              (file) =>
                  file.path.endsWith('.md') &&
                  _relativePath(packDir, file) != _manifestFileName,
            )
            .toList()
          ..sort((a, b) => a.path.compareTo(b.path));

    final articlesByCategoryFolder = <String, List<Article>>{};
    var accepted = 0;
    var skipped = 0;

    for (final articleFile in articleFiles) {
      final article = await _tryParseArticle(articleFile, validTerrainIds);
      if (article == null) {
        skipped++;
        continue;
      }

      final folderName = categoryFolderByDisplayName[article.category];
      if (folderName == null ||
          !ArticlesRepository.isKnownCategoryFolder(folderName)) {
        skipped++;
        continue;
      }
      if (knownSlugs.contains(article.slug)) {
        skipped++;
        continue;
      }

      knownSlugs.add(article.slug);
      articlesByCategoryFolder.putIfAbsent(folderName, () => []).add(article);
      accepted++;
    }

    return PackParseResult(
      articlesByCategoryFolder: articlesByCategoryFolder,
      acceptedCount: accepted,
      skippedCount: skipped,
    );
  }

  /// Returns a display-ready summary for every installed pack. Unlike
  /// [loadPacksFrom], packs with a missing or unparsable manifest are
  /// never skipped - they are summarized as unreadable so they remain
  /// visible (and removable) in the Pack Library UI instead of
  /// silently disappearing.
  static Future<List<InstalledPackSummary>> installedPackSummaries() async {
    final packsDir = await PackStorage.packsDirectory();
    return installedPackSummariesIn(packsDir);
  }

  /// As [installedPackSummaries], scanning [packsDir] directly. Kept
  /// separate so it can be exercised in tests against a plain temp
  /// directory, with no path_provider involved.
  ///
  /// Each pack's [InstalledPackSummary.articleCount] reflects only its
  /// own valid articles, computed independently of any other pack or
  /// the core corpus - this keeps the number stable regardless of
  /// install/load order, at the cost of not reflecting cross-pack
  /// duplicate-slug skipping that would happen at real load time.
  static Future<List<InstalledPackSummary>> installedPackSummariesIn(
    Directory packsDir,
  ) async {
    final validTerrainIds = TerrainRegistry.terrains
        .map((terrain) => terrain.id)
        .toSet();
    final summaries = <InstalledPackSummary>[];

    for (final packDir in await PackStorage.listPackDirectoriesIn(packsDir)) {
      final folderName = packDir.uri.pathSegments
          .where((segment) => segment.isNotEmpty)
          .last;
      try {
        final manifestFile = File('${packDir.path}/$_manifestFileName');
        if (!await manifestFile.exists()) {
          summaries.add(
            InstalledPackSummary(directory: packDir, folderName: folderName),
          );
          continue;
        }

        final manifest = PackManifest.tryParse(
          await manifestFile.readAsString(),
        );
        if (manifest == null) {
          summaries.add(
            InstalledPackSummary(directory: packDir, folderName: folderName),
          );
          continue;
        }

        final result = await parsePackContents(
          packDir,
          validTerrainIds,
          <String>{},
        );
        summaries.add(
          InstalledPackSummary(
            directory: packDir,
            folderName: folderName,
            manifest: manifest,
            articleCount: result.acceptedCount,
          ),
        );
      } catch (_) {
        summaries.add(
          InstalledPackSummary(directory: packDir, folderName: folderName),
        );
      }
    }

    return summaries;
  }

  /// [file]'s path relative to [root], with separators normalized to
  /// `/` regardless of platform - so a plain string comparison against
  /// e.g. `'manifest.md'` works the same on Windows (which returns
  /// backslash-separated paths from directory listings) as it does
  /// elsewhere.
  static String _relativePath(Directory root, File file) {
    var relative = file.path;
    if (relative.startsWith(root.path)) {
      relative = relative.substring(root.path.length);
    }
    return relative.replaceAll('\\', '/').replaceFirst(RegExp(r'^/+'), '');
  }

  static Future<Article?> _tryParseArticle(
    File file,
    Set<String> validTerrainIds,
  ) async {
    try {
      final raw = await file.readAsString();
      final fileName = file.uri.pathSegments
          .where((segment) => segment.isNotEmpty)
          .last;
      final slug = fileName.substring(0, fileName.length - '.md'.length);

      final doc = MarkdownArticleParser.parse(raw);
      final title = doc.field('title');
      final category = doc.field('category');
      if (title == null || category == null) return null;

      final terrainIds = MarkdownArticleParser.splitList(
        doc.field('terrain'),
      ).where(validTerrainIds.contains).toList();

      return Article(
        title: title,
        category: category,
        summary: doc.section('summary'),
        content: doc.section('main content'),
        benefits: MarkdownArticleParser.extractBulletItems(
          doc.section('benefits'),
        ),
        sources: MarkdownArticleParser.extractBulletItems(
          doc.section('sources'),
        ),
        slug: slug,
        relatedSlugs: MarkdownArticleParser.splitList(
          doc.field('related_articles'),
        ),
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
