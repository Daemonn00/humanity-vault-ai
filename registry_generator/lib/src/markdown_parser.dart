/// A minimal, standalone reimplementation of the Humanity Vault app's
/// own Markdown frontmatter/section format - deliberately NOT imported
/// from humanity_vault_app/, since the Registry Generator is designed
/// to be a fully independent tool (see README.md). This must stay
/// behaviorally identical to the app's own parser (same `---`
/// frontmatter delimiter, same `## Heading` section rule, same
/// comma-separated list splitting) or the registry could describe a
/// pack differently than the app will actually parse it - the #1 risk
/// flagged for this tool in its approved architecture.
library;

/// The result of parsing one Markdown file: frontmatter key/value
/// pairs plus named `##` (H2) body sections.
class MarkdownDocument {
  const MarkdownDocument({required this.frontmatter, required this.sections});

  final Map<String, String> frontmatter;
  final Map<String, String> sections;

  /// Returns the frontmatter value for [key], or null if not present.
  String? field(String key) => frontmatter[key];

  /// Returns the raw text of the section named [name] (case-insensitive),
  /// or an empty string if the section is missing.
  String section(String name) => sections[name.toLowerCase()] ?? '';
}

/// Parses a `---`-delimited frontmatter block followed by `##`-headed
/// Markdown sections, matching humanity_vault_app's own
/// MarkdownArticleParser field-for-field.
class MarkdownParser {
  MarkdownParser._();

  static final RegExp _headingPattern = RegExp(r'^##\s+(.+)$');

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

  /// Splits a comma-separated frontmatter value into trimmed,
  /// non-empty items.
  static List<String> splitList(String? value) {
    if (value == null || value.isEmpty) return const [];
    return value
        .split(',')
        .map((item) => item.trim())
        .where((item) => item.isNotEmpty)
        .toList();
  }
}
