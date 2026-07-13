import 'dart:io';

import 'package:humanity_vault_website/src/layout_renderer.dart';
import 'package:humanity_vault_website/src/markdown_pages.dart';

/// Builds the static site from templates/ + content/ + assets/ into
/// dist/. Read-only with respect to the rest of the repo: never reads
/// or writes anything under humanity_vault_app/, registry_generator/,
/// or registry/registry.json.
void main() {
  final websiteRoot = _resolveWebsiteRoot();
  final template = File('$websiteRoot/templates/layout.html').readAsStringSync();
  final distDir = Directory('$websiteRoot/dist');

  if (distDir.existsSync()) {
    distDir.deleteSync(recursive: true);
  }
  distDir.createSync(recursive: true);

  _renderPage(
    websiteRoot: websiteRoot,
    template: template,
    fragmentFileName: 'home.html',
    outputRelPath: 'index.html',
    title: 'Home',
    description: 'Humanity Vault: a free, offline-first knowledge '
        'library for survival, recovery, and rebuilding.',
    activeNavId: 'home',
    extraScripts: ['registry-client.js', 'format.js', 'home-stats.js'],
  );

  _renderPage(
    websiteRoot: websiteRoot,
    template: template,
    fragmentFileName: 'packs.html',
    outputRelPath: 'packs/index.html',
    title: 'Official Knowledge Packs',
    description: 'Browse Official Knowledge Packs for Humanity Vault.',
    activeNavId: 'packs',
    extraScripts: ['registry-client.js', 'format.js', 'packs-page.js'],
  );

  _renderPage(
    websiteRoot: websiteRoot,
    template: template,
    fragmentFileName: 'pack-detail.html',
    outputRelPath: 'packs/detail.html',
    title: 'Pack Detail',
    description: 'Official Knowledge Pack details.',
    activeNavId: 'packs',
    extraScripts: ['registry-client.js', 'format.js', 'pack-detail-page.js'],
  );

  _renderPage(
    websiteRoot: websiteRoot,
    template: template,
    fragmentFileName: 'download.html',
    outputRelPath: 'download/index.html',
    title: 'Download for Android',
    description: 'Download Humanity Vault AI for Android.',
    activeNavId: 'download',
  );

  final docEntries = _renderDocs(websiteRoot: websiteRoot, template: template);
  _renderDocsIndex(
    websiteRoot: websiteRoot,
    template: template,
    docEntries: docEntries,
  );

  _renderChangelog(websiteRoot: websiteRoot, template: template);

  _copyDirectory(
    Directory('$websiteRoot/assets'),
    Directory('$websiteRoot/dist/assets'),
  );

  stdout.writeln('Built ${5 + docEntries.length + 1} pages into '
      '${distDir.path}');
}

String _resolveWebsiteRoot() {
  final scriptPath = Platform.script.toFilePath();
  // website/bin/build.dart -> two levels up is website/.
  return File(scriptPath).parent.parent.path;
}

void _renderPage({
  required String websiteRoot,
  required String template,
  required String fragmentFileName,
  required String outputRelPath,
  required String title,
  required String description,
  required String activeNavId,
  List<String> extraScripts = const [],
}) {
  final fragment =
      File('$websiteRoot/content/pages/$fragmentFileName').readAsStringSync();
  final html = renderLayout(
    template,
    title: title,
    description: description,
    activeNavId: activeNavId,
    contentHtml: fragment,
    extraScripts: _scriptTags(extraScripts),
  );
  _writeFile('$websiteRoot/dist/$outputRelPath', html);
}

/// Renders every content/docs/*.md file to dist/docs/<slug>.html and
/// returns the (slug, title) pairs in file order, for the auto-
/// generated docs index - so a new doc file just needs to be added to
/// content/docs/ to appear in the index, with nothing to hand-edit.
List<MapEntry<String, String>> _renderDocs({
  required String websiteRoot,
  required String template,
}) {
  final docsDir = Directory('$websiteRoot/content/docs');
  final docFiles = docsDir
      .listSync()
      .whereType<File>()
      .where((f) => f.path.endsWith('.md'))
      .toList()
    ..sort((a, b) => a.path.compareTo(b.path));

  final entries = <MapEntry<String, String>>[];
  for (final file in docFiles) {
    final slug = _slugFromPath(file.path);
    final page = renderMarkdownPage(
      file.readAsStringSync(),
      fallbackTitle: slug,
    );
    final html = renderLayout(
      template,
      title: page.title,
      description: 'Humanity Vault documentation: ${page.title}',
      activeNavId: 'docs',
      contentHtml: '<div class="content-measure">${page.bodyHtml}</div>',
    );
    _writeFile('$websiteRoot/dist/docs/$slug.html', html);
    entries.add(MapEntry(slug, page.title));
  }
  return entries;
}

void _renderDocsIndex({
  required String websiteRoot,
  required String template,
  required List<MapEntry<String, String>> docEntries,
}) {
  final listItems = docEntries
      .map((e) => '<li><a href="/docs/${e.key}.html">${e.value}</a></li>')
      .join('\n');
  final content = '<h1>Documentation</h1>\n<ul>\n$listItems\n</ul>';
  final html = renderLayout(
    template,
    title: 'Documentation',
    description: 'Humanity Vault documentation index.',
    activeNavId: 'docs',
    contentHtml: content,
  );
  _writeFile('$websiteRoot/dist/docs/index.html', html);
}

void _renderChangelog({
  required String websiteRoot,
  required String template,
}) {
  final source =
      File('$websiteRoot/content/changelog.md').readAsStringSync();
  final page = renderMarkdownPage(source, fallbackTitle: 'Changelog');
  final html = renderLayout(
    template,
    title: page.title,
    description: 'What has changed in Humanity Vault, release by release.',
    activeNavId: 'changelog',
    contentHtml: '<div class="content-measure">${page.bodyHtml}</div>',
  );
  _writeFile('$websiteRoot/dist/changelog/index.html', html);
}

String _scriptTags(List<String> fileNames) {
  return fileNames
      .map((name) => '<script src="/assets/js/$name"></script>')
      .join('\n');
}

String _baseName(String path) => path.split(RegExp(r'[\\/]')).last;

String _slugFromPath(String path) {
  final fileName = _baseName(path);
  return fileName.endsWith('.md')
      ? fileName.substring(0, fileName.length - 3)
      : fileName;
}

void _writeFile(String path, String content) {
  final file = File(path);
  file.parent.createSync(recursive: true);
  file.writeAsStringSync(content);
}

void _copyDirectory(Directory source, Directory destination) {
  if (!destination.existsSync()) {
    destination.createSync(recursive: true);
  }
  for (final entity in source.listSync()) {
    final destPath = '${destination.path}/${_baseName(entity.path)}';
    if (entity is Directory) {
      _copyDirectory(entity, Directory(destPath));
    } else if (entity is File) {
      entity.copySync(destPath);
    }
  }
}
