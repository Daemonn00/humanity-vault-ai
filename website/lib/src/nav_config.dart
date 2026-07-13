/// One navigation item, shared by the header nav and the footer nav,
/// so both are always in sync and neither hand-duplicates the other.
class NavItem {
  const NavItem({required this.id, required this.label, required this.href});

  final String id;
  final String label;
  final String href;
}

/// The site's entire primary navigation - the single source of truth
/// for both `<header>` and `<footer>` link lists. Root-relative hrefs,
/// since the site is always served from its domain root.
const List<NavItem> navItems = [
  NavItem(id: 'home', label: 'Home', href: '/'),
  NavItem(id: 'packs', label: 'Knowledge Packs', href: '/packs/'),
  NavItem(id: 'download', label: 'Download', href: '/download/'),
  NavItem(id: 'docs', label: 'Docs', href: '/docs/'),
  NavItem(id: 'changelog', label: 'Changelog', href: '/changelog/'),
];

const String githubUrl = 'https://github.com/Daemonn00/humanity-vault-ai';
