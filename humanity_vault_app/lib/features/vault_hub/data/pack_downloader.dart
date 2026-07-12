import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:path_provider/path_provider.dart';

/// Pure helpers for the Downloading -> Verifying steps of the approved
/// pack lifecycle. Deliberately has no orchestration logic of its own
/// (that lives in PackDetailScreen, where each step's state transition
/// needs to be visible to the user) - just the two operations that
/// must happen between "bytes arrived over the network" and "handed to
/// PackImporter".
class PackDownloader {
  PackDownloader._();

  static const String _downloadFileName = 'vault_hub_download.zip';

  /// Real entry point: resolves a private staging file via
  /// path_provider for the downloaded ZIP to be written to before
  /// PackImporter reads it.
  static Future<File> stagingFile() async {
    final documents = await getApplicationDocumentsDirectory();
    return File('${documents.path}/$_downloadFileName');
  }

  /// Returns true if [bytes]'s SHA-256 matches [expectedSha256]
  /// (case-insensitive hex comparison). A pack is never written to a
  /// location PackImporter will read unless this returns true.
  static bool verifyChecksum(List<int> bytes, String expectedSha256) {
    final actual = sha256.convert(bytes).toString();
    return actual.toLowerCase() == expectedSha256.trim().toLowerCase();
  }

  /// Writes [bytes] to [target], creating its parent directory if
  /// needed. Kept separate from path_provider resolution so it can be
  /// exercised in tests against a plain temp file.
  static Future<File> writeToFile(List<int> bytes, File target) async {
    await target.parent.create(recursive: true);
    return target.writeAsBytes(bytes, flush: true);
  }
}
