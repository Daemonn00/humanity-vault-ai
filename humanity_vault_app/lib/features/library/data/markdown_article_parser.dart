/// The result of parsing a Humanity Vault knowledge Markdown file:
/// YAML-style frontmatter fields and named `##` (H2) body sections.
class MarkdownDocument {
  const MarkdownDocument({required this.frontmatter, required this.sections});

  /// Frontmatter key/value pairs (e.g. `title`, `category`, `author`).
  final Map<String, String> frontmatter;

  /// Body sections keyed by lowercase heading text (e.g. `summary`,
  /// `main content`, `benefits`, `sources`).
  final Map<String, String> sections;

  /// Returns the frontmatter value for [key], or null if not present.
  String? field(String key) => frontmatter[key];

  /// Returns the raw text of the section named [name] (case-insensitive),
  /// or an empty string if the section is missing.
  String section(String name) => sections[name.toLowerCase()] ?? '';
}

/// Parses Humanity Vault knowledge Markdown files: a leading
/// `---`-delimited frontmatter block followed by `##`-headed sections.
class MarkdownArticleParser {
  MarkdownArticleParser._();

  static final RegExp _headingPattern = RegExp(r'^##\s+(.+)$');

  /// Parses [raw] markdown content into frontmatter fields and sections.
  static MarkdownDocument parse(String raw) {
    final normalized = raw.replaceAll('\r\n', '\n');
    final frontmatter = <String, String>{};
    var body = normalized;

    if (normalized.trimLeft().startsWith('---')) {
      final lines = normalized.trimLeft().split('\n');
      var endIndex = -1;
      for (var i = 1; i < lines.length; i++) {
        if (lines[i].trim() == '---') {
          endIndex = i;
          break;
        }
        final separator = lines[i].indexOf(':');
        if (separator == -1) continue;
        final key = lines[i].substring(0, separator).trim();
        final value = lines[i].substring(separator + 1).trim();
        if (key.isNotEmpty) {
          frontmatter[key] = value;
        }
      }
      if (endIndex != -1) {
        body = lines.sublist(endIndex + 1).join('\n');
      }
    }

    return MarkdownDocument(
      frontmatter: frontmatter,
      sections: _extractSections(body),
    );
  }

  static Map<String, String> _extractSections(String body) {
    final sections = <String, String>{};
    String? currentHeading;
    final buffer = StringBuffer();

    for (final line in body.split('\n')) {
      final headingMatch = _headingPattern.firstMatch(line.trim());
      if (headingMatch != null) {
        if (currentHeading != null) {
          sections[currentHeading] = buffer.toString().trim();
        }
        currentHeading = headingMatch.group(1)!.trim().toLowerCase();
        buffer.clear();
      } else if (currentHeading != null) {
        buffer.writeln(line);
      }
    }

    if (currentHeading != null) {
      sections[currentHeading] = buffer.toString().trim();
    }

    return sections;
  }

  /// Extracts `- ` / `* ` bullet list items from a section's raw text.
  static List<String> extractBulletItems(String sectionText) {
    return sectionText
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.startsWith('- ') || line.startsWith('* '))
        .map((line) => line.substring(2).trim())
        .where((line) => line.isNotEmpty)
        .toList();
  }
}
