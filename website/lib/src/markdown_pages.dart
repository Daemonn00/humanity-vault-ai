import 'package:markdown/markdown.dart' as md;

/// One rendered documentation or changelog page: a title and its
/// converted HTML body.
class MarkdownPage {
  const MarkdownPage({required this.title, required this.bodyHtml});

  final String title;
  final String bodyHtml;
}

/// Converts raw Markdown [source] into a [MarkdownPage]. The title is
/// taken from the first `# Heading` line if present, falling back to
/// [fallbackTitle] otherwise, so every page always has a usable title
/// even if an author forgets the leading heading.
MarkdownPage renderMarkdownPage(String source, {required String fallbackTitle}) {
  final title = _extractTitle(source) ?? fallbackTitle;
  final bodyHtml = md.markdownToHtml(
    source,
    extensionSet: md.ExtensionSet.gitHubWeb,
  );
  return MarkdownPage(title: title, bodyHtml: bodyHtml);
}

String? _extractTitle(String source) {
  for (final line in source.split('\n')) {
    final trimmed = line.trimLeft();
    if (trimmed.startsWith('# ')) {
      return trimmed.substring(2).trim();
    }
  }
  return null;
}
