// Smoke test for Sprint 9: verifies that every knowledge article
// markdown file is loaded by ArticlesRepository.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/library/data/articles_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('loads every knowledge article from assets', () async {
    await ArticlesRepository.ensureLoaded();
    final loadedCount = ArticlesRepository().getAllArticles().length;

    final fileCount = Directory('knowledge')
        .listSync(recursive: true)
        .whereType<File>()
        .where((file) =>
            file.path.endsWith('.md') &&
            !file.path.endsWith('README.md'))
        .length;

    expect(loadedCount, fileCount);
  });
}
