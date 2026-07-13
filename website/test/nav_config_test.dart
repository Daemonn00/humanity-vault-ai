import 'package:humanity_vault_website/src/nav_config.dart';
import 'package:test/test.dart';

void main() {
  group('navItems', () {
    test('has exactly the five approved top-level nav entries', () {
      // Guards against silent scope creep: the approved site structure
      // is Home, Packs, Download, Docs, Changelog as top-level nav -
      // Pack Detail is reached by clicking a pack, not its own nav
      // entry, and GitHub is rendered separately (external, not a
      // NavItem).
      expect(navItems, hasLength(5));
    });

    test('every id is unique', () {
      final ids = navItems.map((i) => i.id).toSet();
      expect(ids, hasLength(navItems.length));
    });

    test('every href is root-relative', () {
      for (final item in navItems) {
        expect(item.href, startsWith('/'));
      }
    });

    test('includes Home, Knowledge Packs, Download, Docs, and Changelog',
        () {
      final ids = navItems.map((i) => i.id).toSet();
      expect(
        ids,
        {'home', 'packs', 'download', 'docs', 'changelog'},
      );
    });
  });

  group('githubUrl', () {
    test('points at the real repository', () {
      expect(githubUrl, 'https://github.com/Daemonn00/humanity-vault-ai');
    });
  });
}
