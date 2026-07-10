// Tests for PackStorage.removePack: verifies pack deletion actually
// removes the directory from disk, is idempotent when the directory
// is already gone, and never throws out of the caller's control.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/packs/data/pack_storage.dart';

void main() {
  test('removePack deletes an existing pack directory and its contents',
      () async {
    final root = Directory.systemTemp.createTempSync('hv_remove_existing_');
    addTearDown(() {
      if (root.existsSync()) root.deleteSync(recursive: true);
    });

    final packDir = Directory('${root.path}/pack_to_remove')
      ..createSync(recursive: true);
    File('${packDir.path}/manifest.md').writeAsStringSync('---\n---\n');

    final success = await PackStorage.removePack(packDir);

    expect(success, isTrue);
    expect(packDir.existsSync(), isFalse);
  });

  test('removePack succeeds and reports true when the directory is already '
      'gone', () async {
    final root = Directory.systemTemp.createTempSync('hv_remove_missing_');
    addTearDown(() => root.deleteSync(recursive: true));

    final neverExisted = Directory('${root.path}/never_existed');

    expect(await PackStorage.removePack(neverExisted), isTrue);
  });
}
