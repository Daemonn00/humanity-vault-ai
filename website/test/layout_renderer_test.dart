import 'package:humanity_vault_website/src/layout_renderer.dart';
import 'package:humanity_vault_website/src/nav_config.dart';
import 'package:test/test.dart';

const _fakeTemplate = '''
<title>{{title}}</title>
<meta name="description" content="{{description}}">
<nav>{{nav_items}}</nav>
<footer>{{footer_nav_items}}</footer>
<main>{{content}}</main>
{{extra_scripts}}
''';

void main() {
  group('renderNavItems', () {
    test('marks exactly the active item with aria-current="page"', () {
      final html = renderNavItems('packs');

      expect(html, contains('aria-current="page"'));
      // Exactly one aria-current attribute, on the Knowledge Packs link.
      expect('aria-current="page"'.allMatches(html).length, 1);
      expect(
        RegExp(r'href="/packs/"[^>]*aria-current="page"').hasMatch(html),
        isTrue,
      );
    });

    test('marks no item as active when activeId matches nothing', () {
      final html = renderNavItems('does-not-exist');
      expect(html, isNot(contains('aria-current')));
    });

    test('renders every configured nav item', () {
      final html = renderNavItems('home');
      for (final item in navItems) {
        expect(html, contains('href="${item.href}"'));
        expect(html, contains(item.label));
      }
    });
  });

  group('renderFooterNavItems', () {
    test('renders every configured nav item, with no active marking', () {
      final html = renderFooterNavItems();
      for (final item in navItems) {
        expect(html, contains('href="${item.href}"'));
      }
      expect(html, isNot(contains('aria-current')));
    });
  });

  group('renderLayout', () {
    test('substitutes every placeholder', () {
      final html = renderLayout(
        _fakeTemplate,
        title: 'Test Page',
        description: 'A test description.',
        activeNavId: 'home',
        contentHtml: '<h1>Hello</h1>',
        extraScripts: '<script src="/assets/js/test.js"></script>',
      );

      expect(html, contains('<title>Test Page</title>'));
      expect(html, contains('content="A test description."'));
      expect(html, contains('<h1>Hello</h1>'));
      expect(html, contains('<script src="/assets/js/test.js"></script>'));
      expect(html, contains('aria-current="page"')); // home is active
      expect(html, isNot(contains('{{')));
    });

    test('escapes double quotes in the description', () {
      final html = renderLayout(
        _fakeTemplate,
        title: 'T',
        description: 'A "quoted" description.',
        activeNavId: 'home',
        contentHtml: '',
      );

      expect(html, contains('A &quot;quoted&quot; description.'));
    });

    test('defaults extraScripts to an empty string when omitted', () {
      final html = renderLayout(
        _fakeTemplate,
        title: 'T',
        description: 'D',
        activeNavId: 'home',
        contentHtml: '',
      );

      expect(html, isNot(contains('{{extra_scripts}}')));
    });
  });
}
