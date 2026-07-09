import '../../library/data/markdown_article_parser.dart';

/// Metadata describing an installed Knowledge Pack.
///
/// Parsed from a pack's `manifest.md` frontmatter using the same
/// MarkdownArticleParser already used for knowledge articles - no new
/// file format is introduced.
class PackManifest {
  const PackManifest({
    required this.packId,
    required this.packName,
    required this.packVersion,
    this.description,
  });

  /// Stable identifier for this pack.
  final String packId;

  /// Display name for this pack.
  final String packName;

  /// Free-form version string, as written by the pack author.
  final String packVersion;

  /// Optional short description of the pack's contents.
  final String? description;

  /// Parses [raw] manifest text, returning null if any required field
  /// (`pack_id`, `pack_name`, `pack_version`) is missing.
  static PackManifest? tryParse(String raw) {
    final doc = MarkdownArticleParser.parse(raw);
    final packId = doc.field('pack_id');
    final packName = doc.field('pack_name');
    final packVersion = doc.field('pack_version');
    if (packId == null || packName == null || packVersion == null) {
      return null;
    }
    return PackManifest(
      packId: packId,
      packName: packName,
      packVersion: packVersion,
      description: doc.field('description'),
    );
  }
}
