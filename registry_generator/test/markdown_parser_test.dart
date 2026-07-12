import 'package:registry_generator/src/markdown_parser.dart';
import 'package:test/test.dart';

void main() {
  group('MarkdownParser.parse', () {
    test('parses frontmatter key/value pairs', () {
      final doc = MarkdownParser.parse('''
---
pack_id: hv_official_test
pack_name: Test Pack
pack_version: 1.0.0
---
''');

      expect(doc.field('pack_id'), 'hv_official_test');
      expect(doc.field('pack_name'), 'Test Pack');
      expect(doc.field('pack_version'), '1.0.0');
    });

    test('returns null for a missing frontmatter field', () {
      final doc = MarkdownParser.parse('---\ntitle: X\n---\n');
      expect(doc.field('category'), isNull);
    });

    test('parses ## sections case-insensitively', () {
      final doc = MarkdownParser.parse('''
---
title: X
category: Survival
---

## Summary

A short summary.

## Main Content

Paragraph one.

Paragraph two.
''');

      expect(doc.section('Summary'), 'A short summary.');
      expect(doc.section('summary'), 'A short summary.');
      expect(doc.section('main content'), 'Paragraph one.\n\nParagraph two.');
    });

    test('returns an empty string for a missing section', () {
      final doc = MarkdownParser.parse('---\ntitle: X\n---\n');
      expect(doc.section('Benefits'), '');
    });

    test('handles a file with no frontmatter block at all', () {
      final doc = MarkdownParser.parse('## Summary\n\nJust content.\n');
      expect(doc.frontmatter, isEmpty);
      expect(doc.section('summary'), 'Just content.');
    });

    test('normalizes CRLF line endings', () {
      final doc = MarkdownParser.parse(
        '---\r\ntitle: X\r\n---\r\n\r\n## Summary\r\n\r\nText.\r\n',
      );
      expect(doc.field('title'), 'X');
      expect(doc.section('summary'), 'Text.');
    });
  });

  group('MarkdownParser.splitList', () {
    test('splits and trims a comma-separated value', () {
      expect(
        MarkdownParser.splitList('desert, coastal ,urban'),
        ['desert', 'coastal', 'urban'],
      );
    });

    test('returns an empty list for null or empty input', () {
      expect(MarkdownParser.splitList(null), isEmpty);
      expect(MarkdownParser.splitList(''), isEmpty);
    });

    test('drops empty items from consecutive commas', () {
      expect(MarkdownParser.splitList('a,,b'), ['a', 'b']);
    });
  });
}
