import 'package:humanity_vault_website/src/markdown_pages.dart';
import 'package:test/test.dart';

void main() {
  group('renderMarkdownPage', () {
    test('extracts the title from the first H1 heading', () {
      final page = renderMarkdownPage(
        '# My Title\n\nSome text.',
        fallbackTitle: 'Fallback',
      );

      expect(page.title, 'My Title');
    });

    test('falls back to fallbackTitle when there is no H1 heading', () {
      final page = renderMarkdownPage(
        'Just a paragraph, no heading.',
        fallbackTitle: 'Fallback Title',
      );

      expect(page.title, 'Fallback Title');
    });

    test('does not mistake an H2 for the title', () {
      final page = renderMarkdownPage(
        '## Not the title\n\nBody text.',
        fallbackTitle: 'Fallback',
      );

      expect(page.title, 'Fallback');
    });

    test('converts headings, paragraphs, and lists to HTML', () {
      final page = renderMarkdownPage(
        '# Title\n\nA paragraph.\n\n- One\n- Two',
        fallbackTitle: 'Fallback',
      );

      expect(page.bodyHtml, contains('Title</h1>'));
      expect(page.bodyHtml, contains('<p>A paragraph.</p>'));
      expect(page.bodyHtml, contains('<li>One</li>'));
      expect(page.bodyHtml, contains('<li>Two</li>'));
    });

    test('converts links', () {
      final page = renderMarkdownPage(
        '[Docs](/docs/)',
        fallbackTitle: 'Fallback',
      );

      expect(page.bodyHtml, contains('<a href="/docs/">Docs</a>'));
    });
  });
}
