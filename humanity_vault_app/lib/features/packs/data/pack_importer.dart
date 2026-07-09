import 'dart:io';

import 'package:archive/archive.dart';

import '../../library/data/articles_repository.dart';
import '../../terrain/data/terrain_registry.dart';
import '../models/pack_manifest.dart';
import 'pack_storage.dart';
import 'packs_loader.dart';

/// The outcome of a single ZIP Knowledge Pack import attempt.
class PackImportResult {
  const PackImportResult.success({
    required this.packName,
    required this.importedCount,
    required this.skippedCount,
  })  : isSuccess = true,
        message = null;

  const PackImportResult.failure(this.message)
      : isSuccess = false,
        packName = null,
        importedCount = 0,
        skippedCount = 0;

  final bool isSuccess;

  /// Short, user-facing reason the import failed. Null on success.
  final String? message;

  /// The imported pack's display name. Null on failure.
  final String? packName;

  /// Number of articles successfully imported. Zero on failure.
  final int importedCount;

  /// Number of article files skipped during import (malformed, unknown
  /// category, or duplicate slug).
  final int skippedCount;
}

/// Imports a single ZIP Knowledge Pack: extracts it into a private
/// staging directory, validates it in full, and only then moves it
/// into permanent app-private storage.
///
/// A pack is never written to permanent storage unless every check
/// passes. On any failure, staging is cleaned up and the core Vault -
/// and any already-installed packs - are left completely unchanged.
/// ArticlesRepository is never touched here; a newly-imported pack is
/// picked up by PacksLoader on the next app start.
class PackImporter {
  PackImporter._();

  /// Maximum size of the picked ZIP file itself, checked before it is
  /// read into memory. A Knowledge Pack is plain Markdown text - the
  /// entire current 31-article core corpus is ~125 KB - so 20 MB is
  /// generous headroom for a large pack while still rejecting anything
  /// clearly not a lightweight text pack.
  static const int maxCompressedBytes = 20 * 1024 * 1024;

  /// Maximum total bytes written to disk during extraction. Enforced
  /// as a running total while extracting, so an archive that would
  /// exceed this is aborted mid-extraction rather than allowed to
  /// finish writing an oversized pack.
  static const int maxExtractedBytes = 50 * 1024 * 1024;

  /// Maximum number of entries in the archive (and, equivalently,
  /// files written during extraction). Guards against an archive with
  /// an excessive file count regardless of individual file size.
  static const int maxFileCount = 500;

  /// Maximum length of any single entry path inside the archive.
  static const int maxPathLength = 200;

  /// Real entry point used by the app: resolves the staging and
  /// permanent packs directories via path_provider, then delegates to
  /// [importZipInto] for the actual import logic.
  static Future<PackImportResult> importZip(File zipFile) async {
    try {
      await PackStorage.clearStaleStagingDirectory();
      final staging = await PackStorage.stagingDirectory();
      await PackStorage.ensurePacksDirectoryExists();
      final packsDir = await PackStorage.packsDirectory();
      return await importZipInto(zipFile, staging: staging, packsDir: packsDir);
    } catch (_) {
      return const PackImportResult.failure(
        'Something went wrong importing this pack.',
      );
    }
  }

  /// Core import logic: extracts [zipFile] into [staging], validates
  /// it in full, and moves it into [packsDir] only if every check
  /// passes. Kept separate from [importZip] so it can be exercised in
  /// tests against plain temp directories, with no path_provider
  /// involved.
  static Future<PackImportResult> importZipInto(
    File zipFile, {
    required Directory staging,
    required Directory packsDir,
  }) async {
    try {
      final compressedSize = await zipFile.length();
      if (compressedSize > maxCompressedBytes) {
        return const PackImportResult.failure(
          'This pack file is too large to import.',
        );
      }

      final Archive archive;
      try {
        final bytes = await zipFile.readAsBytes();
        archive = ZipDecoder().decodeBytes(bytes);
      } catch (_) {
        return const PackImportResult.failure(
          'This file is not a valid Knowledge Pack (.zip).',
        );
      }

      final entries = archive.files.where((f) => f.isFile).toList();
      if (entries.length > maxFileCount) {
        return const PackImportResult.failure(
          'This pack contains too many files to import.',
        );
      }

      if (await staging.exists()) {
        await _safeDelete(staging);
      }
      await staging.create(recursive: true);

      var extractedBytes = 0;
      var sawManifest = false;

      for (final entry in entries) {
        final name = entry.name;

        if (name.length > maxPathLength || _isUnsafePath(name)) {
          return await _fail(
            staging,
            'This pack contains an unsafe or invalid file path.',
          );
        }

        final isManifest = name == 'manifest.md';
        final isArticle = !isManifest && name.endsWith('.md');
        // Allowlist: only manifest.md and .md article files are ever
        // written to disk. Everything else in the archive - images,
        // executables, scripts, anything - is silently ignored.
        if (!isManifest && !isArticle) continue;

        final content = entry.content as List<int>;
        extractedBytes += content.length;
        if (extractedBytes > maxExtractedBytes) {
          return await _fail(staging, 'This pack is too large to import.');
        }

        final outFile = File('${staging.path}/$name');
        await outFile.parent.create(recursive: true);
        await outFile.writeAsBytes(content);
        if (isManifest) sawManifest = true;
      }

      if (!sawManifest) {
        return await _fail(
          staging,
          'This pack is missing its manifest and cannot be imported.',
        );
      }

      final manifestFile = File('${staging.path}/manifest.md');
      final manifest =
          PackManifest.tryParse(await manifestFile.readAsString());
      if (manifest == null) {
        return await _fail(
          staging,
          "This pack's manifest is missing required information.",
        );
      }

      final installedIds = await PackStorage.installedPackIdsIn(packsDir);
      if (installedIds.contains(manifest.packId)) {
        return await _fail(
          staging,
          'A pack with this ID is already installed.',
        );
      }

      final validTerrainIds =
          TerrainRegistry.terrains.map((t) => t.id).toSet();
      final knownSlugs =
          ArticlesRepository().getAllArticles().map((a) => a.slug).toSet();
      final parseResult = await PacksLoader.parsePackContents(
        staging,
        validTerrainIds,
        knownSlugs,
      );

      if (parseResult.acceptedCount == 0) {
        return await _fail(
          staging,
          'This pack has no valid articles and cannot be imported.',
        );
      }

      if (!await packsDir.exists()) {
        await packsDir.create(recursive: true);
      }
      final targetDir =
          Directory('${packsDir.path}/${_safeFolderName(manifest.packId)}');
      if (await targetDir.exists()) {
        return await _fail(
          staging,
          'A pack with this ID is already installed.',
        );
      }

      await staging.rename(targetDir.path);

      return PackImportResult.success(
        packName: manifest.packName,
        importedCount: parseResult.acceptedCount,
        skippedCount: parseResult.skippedCount,
      );
    } catch (_) {
      await _safeDelete(staging);
      return const PackImportResult.failure(
        'Something went wrong importing this pack.',
      );
    }
  }

  static Future<PackImportResult> _fail(
    Directory staging,
    String message,
  ) async {
    await _safeDelete(staging);
    return PackImportResult.failure(message);
  }

  static Future<void> _safeDelete(Directory dir) async {
    try {
      if (await dir.exists()) await dir.delete(recursive: true);
    } catch (_) {
      // Best-effort cleanup only.
    }
  }

  static bool _isUnsafePath(String name) {
    if (name.isEmpty) return true;
    if (name.startsWith('/') || name.startsWith('\\')) return true;
    if (name.contains(':')) return true; // e.g. Windows drive letters
    final segments = name.split(RegExp(r'[/\\]'));
    return segments.any((segment) => segment == '..');
  }

  static String _safeFolderName(String packId) {
    final sanitized = packId.replaceAll(RegExp(r'[^A-Za-z0-9_-]'), '_');
    return sanitized.isEmpty ? 'pack' : sanitized;
  }
}
