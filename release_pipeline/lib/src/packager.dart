import 'dart:io';

import 'package:archive/archive.dart';
import 'package:crypto/crypto.dart';

/// One packaged release ZIP, ready to be uploaded to a GitHub Release
/// asset - or, in a dry run, fed straight into the Registry
/// Generator's own validation via [InMemoryReleaseSource].
class PackagedRelease {
  const PackagedRelease({
    required this.zipBytes,
    required this.sha256,
    required this.sizeBytes,
    required this.fileName,
  });

  final List<int> zipBytes;
  final String sha256;
  final int sizeBytes;
  final String fileName;
}

/// Builds a release ZIP from a reviewed pack source directory.
///
/// Deliberately read-only: never writes into the source directory,
/// never touches REVIEW_NOTES.md/CHANGELOG.md/LICENSE (only
/// `manifest.md` and other `.md` files are packaged - the exact same
/// allowlist PackImporter enforces on import, so a packaged release is
/// guaranteed importable under the same rules the app itself applies).
class Packager {
  Packager._();

  /// A fixed timestamp (1980-01-01, the MS-DOS epoch) is written to
  /// every archived file instead of the real file's mtime, so
  /// packaging the same source directory twice - on any machine, at
  /// any time - produces byte-identical ZIPs. This is what makes the
  /// release process reproducible.
  static const int _fixedDosTimestamp = 0x210000;

  /// Editorial/meta files that may live alongside a pack's source
  /// (matching registry_generator's own documented input-source
  /// boundary) - excluded by name even though they end in `.md`, since
  /// they physically coexist with manifest.md and the articles in
  /// official_packs/, unlike the app's ZIP-import path where such
  /// files are simply never present in an already-built ZIP.
  static const Set<String> _excludedFileNames = {
    'review_notes.md',
    'changelog.md',
    'license.md',
    'license',
  };

  /// Packages [packDir] for [packId] at [version]. Throws
  /// [StateError] if the directory contains no packageable files at
  /// all (an empty ZIP is never a valid release artifact).
  static PackagedRelease package(
    Directory packDir, {
    required String packId,
    required String version,
  }) {
    final entries = packDir
        .listSync(recursive: true)
        .whereType<File>()
        .where((f) => f.path.replaceAll('\\', '/').endsWith('.md'))
        .where((f) => !_excludedFileNames.contains(_baseName(f).toLowerCase()))
        .toList()
      ..sort((a, b) => a.path.compareTo(b.path));

    if (entries.isEmpty) {
      throw StateError(
        'no .md files found under ${packDir.path} - nothing to package',
      );
    }

    final archive = Archive();
    for (final file in entries) {
      final relativePath = _relativePath(packDir, file);
      final bytes = file.readAsBytesSync();
      final archiveFile = ArchiveFile(relativePath, bytes.length, bytes);
      archiveFile.lastModTime = _fixedDosTimestamp;
      archive.addFile(archiveFile);
    }

    final zipBytes = ZipEncoder().encode(archive);
    if (zipBytes == null) {
      throw StateError('failed to encode release ZIP for $packId');
    }

    return PackagedRelease(
      zipBytes: zipBytes,
      sha256: sha256.convert(zipBytes).toString(),
      sizeBytes: zipBytes.length,
      fileName: fileNameFor(packId, version),
    );
  }

  /// The release ZIP filename convention, matching the tag convention
  /// (`<pack_id>-v<version>`) documented in registry_generator/README.md.
  static String fileNameFor(String packId, String version) =>
      '$packId-v$version.zip';

  static String _relativePath(Directory root, File file) {
    final rootPath = root.path.replaceAll('\\', '/');
    final filePath = file.path.replaceAll('\\', '/');
    final normalizedRoot = rootPath.endsWith('/') ? rootPath : '$rootPath/';
    return filePath.substring(normalizedRoot.length);
  }

  static String _baseName(File file) =>
      file.path.replaceAll('\\', '/').split('/').last;
}
