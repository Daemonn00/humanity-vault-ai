// Tests for PackDownloader: the pure Downloading -> Verifying helpers
// used by PackDetailScreen. verifyChecksum is exercised against
// package:crypto's own computation directly, matching how the
// standalone Registry Generator's own tests verify its checksums.

import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:humanity_vault_app/features/vault_hub/data/pack_downloader.dart';

void main() {
  group('PackDownloader.verifyChecksum', () {
    test('returns true when the SHA-256 matches', () {
      final bytes = utf8.encode('hello vault hub');
      final expected = sha256.convert(bytes).toString();

      expect(PackDownloader.verifyChecksum(bytes, expected), isTrue);
    });

    test('returns false when the SHA-256 does not match', () {
      final bytes = utf8.encode('hello vault hub');

      expect(
        PackDownloader.verifyChecksum(bytes, 'not-the-real-checksum'),
        isFalse,
      );
    });

    test('comparison is case-insensitive', () {
      final bytes = utf8.encode('hello vault hub');
      final expected = sha256.convert(bytes).toString().toUpperCase();

      expect(PackDownloader.verifyChecksum(bytes, expected), isTrue);
    });

    test('tolerates surrounding whitespace in the expected checksum', () {
      final bytes = utf8.encode('hello vault hub');
      final expected = '  ${sha256.convert(bytes)}  ';

      expect(PackDownloader.verifyChecksum(bytes, expected), isTrue);
    });
  });

  group('PackDownloader.writeToFile', () {
    test('writes the given bytes to the target file', () async {
      final root = Directory.systemTemp.createTempSync('hv_downloader_');
      addTearDown(() => root.deleteSync(recursive: true));
      final target = File('${root.path}/downloaded.zip');
      final bytes = utf8.encode('zip contents');

      final written = await PackDownloader.writeToFile(bytes, target);

      expect(written.path, target.path);
      expect(await target.readAsBytes(), bytes);
    });

    test('creates the parent directory if it does not exist', () async {
      final root = Directory.systemTemp.createTempSync('hv_downloader_');
      addTearDown(() => root.deleteSync(recursive: true));
      final target = File('${root.path}/nested/dir/downloaded.zip');

      await PackDownloader.writeToFile(utf8.encode('data'), target);

      expect(await target.exists(), isTrue);
    });
  });
}
