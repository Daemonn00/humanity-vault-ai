import 'dart:io';

import 'package:path_provider/path_provider.dart';

/// Resolves and manages the on-device directories used by Knowledge
/// Packs.
///
/// All packs live under the app's private Application Documents
/// directory - no external/shared storage, no network. Nothing here
/// imports content; it only resolves paths, creates missing
/// directories, and safely lists what is already installed.
class PackStorage {
  PackStorage._();

  static const String _packsDirName = 'knowledge_packs';
  static const String _stagingDirName = 'knowledge_packs_staging';

  /// The directory holding installed pack subdirectories.
  static Future<Directory> packsDirectory() async {
    final documents = await getApplicationDocumentsDirectory();
    return Directory('${documents.path}/$_packsDirName');
  }

  /// The directory reserved for staging a pack during import before it
  /// is committed to [packsDirectory]. Not used by any import logic
  /// yet - only resolved and cleaned here so a future importer has a
  /// safe, already-tested location to build on.
  static Future<Directory> stagingDirectory() async {
    final documents = await getApplicationDocumentsDirectory();
    return Directory('${documents.path}/$_stagingDirName');
  }

  /// Creates [packsDirectory] if it does not already exist. Safe to
  /// call on every launch.
  static Future<void> ensurePacksDirectoryExists() async {
    final dir = await packsDirectory();
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
  }

  /// Deletes any leftover staging directory from a previous, possibly
  /// interrupted, import. Never touches [packsDirectory] - only the
  /// staging area - so an interrupted import can never leave a partial
  /// pack visible to the loader.
  static Future<void> clearStaleStagingDirectory() async {
    final dir = await stagingDirectory();
    if (await dir.exists()) {
      try {
        await dir.delete(recursive: true);
      } catch (_) {
        // Best-effort cleanup; a locked/undeletable staging directory
        // must never block startup.
      }
    }
  }

  /// Returns the installed pack subdirectories under [packsDirectory],
  /// sorted by path for deterministic processing order.
  static Future<List<Directory>> listInstalledPackDirectories() async {
    final dir = await packsDirectory();
    return listPackDirectoriesIn(dir);
  }

  /// Lists pack subdirectories inside [dir], sorted by path. Returns an
  /// empty list - never throws - if [dir] does not exist, is empty, or
  /// is inaccessible for any reason. Kept separate from
  /// [listInstalledPackDirectories] so it can be exercised in tests
  /// against a plain temp directory, with no path_provider involved.
  static Future<List<Directory>> listPackDirectoriesIn(Directory dir) async {
    try {
      if (!await dir.exists()) return const [];

      final entries = await dir.list().toList();
      final packDirs = entries.whereType<Directory>().toList()
        ..sort((a, b) => a.path.compareTo(b.path));
      return packDirs;
    } catch (_) {
      return const [];
    }
  }
}
