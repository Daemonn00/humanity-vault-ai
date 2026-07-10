import 'dart:io';

import 'pack_manifest.dart';

/// A display-ready summary of one installed Knowledge Pack directory,
/// used by the Pack Library screen.
///
/// [manifest] and [articleCount] are null when the pack's manifest is
/// missing or could not be parsed - such packs are still summarized
/// (never omitted) so they remain visible and removable in the UI.
class InstalledPackSummary {
  const InstalledPackSummary({
    required this.directory,
    required this.folderName,
    this.manifest,
    this.articleCount,
  });

  /// The pack's own installed directory. Removing a pack deletes
  /// exactly this directory and nothing else.
  final Directory directory;

  /// The directory's own folder name, used as a fallback label when
  /// the manifest is unreadable.
  final String folderName;

  /// Null if `manifest.md` is missing or failed to parse.
  final PackManifest? manifest;

  /// Number of valid articles this pack contributes on its own merits
  /// (computed independently of any other installed pack or the core
  /// corpus, so the number is stable regardless of load order). Null
  /// if the manifest is unreadable.
  final int? articleCount;

  /// Whether this pack has a valid, parsed manifest.
  bool get isReadable => manifest != null;
}
