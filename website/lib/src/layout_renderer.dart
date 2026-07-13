import 'nav_config.dart';

String _escapeAttribute(String value) => value.replaceAll('"', '&quot;');

/// Renders the header nav's `<li>` items, marking exactly [activeId]'s
/// link with `aria-current="page"` - the only client-visible signal of
/// which page is active, driving the underline in components.css. No
/// JS is needed for this, so it still works with JS disabled.
String renderNavItems(String activeId) {
  final buffer = StringBuffer();
  for (final item in navItems) {
    final isActive = item.id == activeId;
    buffer.writeln(
      '<li><a class="site-nav__link" href="${item.href}"'
      '${isActive ? ' aria-current="page"' : ''}>${item.label}</a></li>',
    );
  }
  return buffer.toString();
}

/// Renders the footer's link list from the same [navItems] source, so
/// header and footer navigation can never drift out of sync with each
/// other.
String renderFooterNavItems() {
  final buffer = StringBuffer();
  for (final item in navItems) {
    buffer.writeln('<li><a href="${item.href}">${item.label}</a></li>');
  }
  return buffer.toString();
}

/// Substitutes [template]'s `{{...}}` placeholders with one page's
/// content. Pure string function - the real entry point
/// (bin/build.dart) reads the actual templates/layout.html file and
/// passes its text here, so this can be exercised in tests against
/// any template string with no file I/O involved.
String renderLayout(
  String template, {
  required String title,
  required String description,
  required String activeNavId,
  required String contentHtml,
  String extraScripts = '',
}) {
  return template
      .replaceAll('{{title}}', title)
      .replaceAll('{{description}}', _escapeAttribute(description))
      .replaceAll('{{nav_items}}', renderNavItems(activeNavId))
      .replaceAll('{{footer_nav_items}}', renderFooterNavItems())
      .replaceAll('{{content}}', contentHtml)
      .replaceAll('{{extra_scripts}}', extraScripts);
}
