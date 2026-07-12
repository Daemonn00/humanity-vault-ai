import 'dart:io';

import 'markdown_parser.dart';
import 'models.dart';

/// Reads a pack directory's manifest.md and article files. Never reads
/// REVIEW_NOTES.md, CHANGELOG.md, or LICENSE - those are outside this
/// tool's approved v0.1 input sources.
class PackReader {
  PackReader._();

  /// Reads just [manifest.md]'s `pack_id` field - the minimal read
  /// needed to look up a matching release before doing anything else.
  /// Returns null if manifest.md is missing or has no pack_id.
  static Future<String?> readPackId(Directory packDir) async {
    final manifestFile = File('${packDir.path}/manifest.md');
    if (!await manifestFile.exists()) return null;
    final doc = MarkdownParser.parse(await manifestFile.readAsString());
    final packId = doc.field('pack_id');
    return (packId == null || packId.isEmpty) ? null : packId;
  }

  /// Reads the full manifest, once a matching release has already been
  /// confirmed to exist. Returns null if any required field is missing.
  static Future<PackManifest?> readManifest(Directory packDir) async {
    final manifestFile = File('${packDir.path}/manifest.md');
    if (!await manifestFile.exists()) return null;
    final doc = MarkdownParser.parse(await manifestFile.readAsString());
    final packId = doc.field('pack_id');
    final packName = doc.field('pack_name');
    final packVersion = doc.field('pack_version');
    if (packId == null || packId.isEmpty) return null;
    if (packName == null || packName.isEmpty) return null;
    if (packVersion == null || packVersion.isEmpty) return null;
    return PackManifest(
      packId: packId,
      packName: packName,
      packVersion: packVersion,
      description: doc.field('description'),
    );
  }

  /// Reads every `.md` article file directly under [packDir] (manifest.md
  /// excluded). Malformed articles (missing title/category) are silently
  /// omitted from the result - callers treat that as "excluded from the
  /// count", not a hard failure, mirroring the app's own loader behavior.
  static Future<List<PackArticle>> readArticles(Directory packDir) async {
    final entries = await packDir.list().toList();
    final articleFiles =
        entries
            .whereType<File>()
            .where(
              (f) => f.path.endsWith('.md') && !f.path.endsWith('manifest.md'),
            )
            .toList()
          ..sort((a, b) => a.path.compareTo(b.path));

    final articles = <PackArticle>[];
    for (final file in articleFiles) {
      final article = await _tryReadArticle(file);
      if (article != null) articles.add(article);
    }
    return articles;
  }

  static Future<PackArticle?> _tryReadArticle(File file) async {
    try {
      final raw = await file.readAsString();
      final fileName = file.uri.pathSegments.where((s) => s.isNotEmpty).last;
      final slug = fileName.substring(0, fileName.length - '.md'.length);

      final doc = MarkdownParser.parse(raw);
      final title = doc.field('title');
      final category = doc.field('category');
      if (title == null || title.isEmpty) return null;
      if (category == null || category.isEmpty) return null;

      return PackArticle(
        slug: slug,
        title: title,
        category: category,
        subcategory: doc.field('subcategory'),
        verificationLevel: doc.field('verification_level'),
        terrain: MarkdownParser.splitList(doc.field('terrain')),
      );
    } catch (_) {
      return null;
    }
  }
}
