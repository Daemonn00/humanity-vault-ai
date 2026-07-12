import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:crypto/crypto.dart';

import 'markdown_parser.dart';
import 'models.dart';
import 'pack_reader.dart';
import 'release_source.dart';
import 'validation.dart';

/// One line of structured output describing what happened to one pack
/// during a generation run - used for the run summary. Never per-pack
/// noise for the ordinary "not yet released" case (that's counted, not
/// logged individually), per the approved "skip silently" behavior.
class PackOutcome {
  const PackOutcome({
    required this.packDirName,
    required this.status,
    this.detail,
  });

  final String packDirName;
  final PackOutcomeStatus status;
  final String? detail;
}

enum PackOutcomeStatus {
  /// Included in the registry.
  included,

  /// No manifest.md / no pack_id - cannot even be looked up.
  noPackId,

  /// No matching release found - the ordinary, silent, expected case.
  noRelease,

  /// A release lookup failed for a reason other than "not found"
  /// (network error, malformed response) - logged as a warning, pack
  /// still excluded from this run.
  releaseLookupFailed,

  /// A release exists but the pack failed validation - logged as an
  /// error, since a published release with a structural problem is a
  /// real issue worth attention.
  validationFailed,

  /// A release exists but no .zip asset could be found on it.
  noZipAsset,
}

/// Scans an official packs directory, checks each pack for a matching
/// published release via [releaseSource], validates it, and produces a
/// RegistryOutput containing only packs that are both released and
/// valid. Never reads REVIEW_NOTES.md, CHANGELOG.md, or LICENSE.
class RegistryGenerator {
  RegistryGenerator({
    required this.releaseSource,
    this.generatorVersion = '0.1.0',
    this.schemaVersion = '1',
    this.sourceRepositories = const ['Daemonn00/humanity-vault-ai'],
  });

  final ReleaseSource releaseSource;
  final String generatorVersion;
  final String schemaVersion;
  final List<String> sourceRepositories;

  final List<PackOutcome> outcomes = [];

  Future<RegistryOutput> generate(Directory officialPacksDir) async {
    outcomes.clear();
    final packEntries = <RegistryPackEntry>[];

    if (!await officialPacksDir.exists()) {
      return RegistryOutput(
        schemaVersion: schemaVersion,
        generatedAt: DateTime.now().toUtc(),
        generatorVersion: generatorVersion,
        sourceRepositories: sourceRepositories,
        packs: const [],
      );
    }

    final packDirs =
        (await officialPacksDir.list().toList()).whereType<Directory>().toList()
          ..sort((a, b) => a.path.compareTo(b.path));

    for (final packDir in packDirs) {
      final dirName = packDir.uri.pathSegments
          .where((s) => s.isNotEmpty)
          .last;
      final entry = await _processPack(packDir, dirName);
      if (entry != null) packEntries.add(entry);
    }

    return RegistryOutput(
      schemaVersion: schemaVersion,
      generatedAt: DateTime.now().toUtc(),
      generatorVersion: generatorVersion,
      sourceRepositories: sourceRepositories,
      packs: packEntries,
    );
  }

  Future<RegistryPackEntry?> _processPack(
    Directory packDir,
    String dirName,
  ) async {
    final packId = await PackReader.readPackId(packDir);
    if (packId == null) {
      outcomes.add(
        PackOutcome(packDirName: dirName, status: PackOutcomeStatus.noPackId),
      );
      return null;
    }

    // A minimal manifest read (pack_id only) already happened above;
    // read pack_version the same lightweight way to know which release
    // to look for, without yet reading articles or the rest of the
    // manifest - REVIEW_NOTES.md is never touched at any point.
    final versionProbe = await PackReader.readManifest(packDir);
    final expectedVersion = versionProbe?.packVersion;
    if (expectedVersion == null) {
      outcomes.add(
        PackOutcome(packDirName: dirName, status: PackOutcomeStatus.noPackId),
      );
      return null;
    }

    ReleaseInfo? release;
    try {
      release = await releaseSource.findRelease(packId, expectedVersion);
    } on ReleaseLookupException catch (e) {
      outcomes.add(
        PackOutcome(
          packDirName: dirName,
          status: PackOutcomeStatus.releaseLookupFailed,
          detail: e.message,
        ),
      );
      return null;
    }

    if (release == null) {
      outcomes.add(
        PackOutcome(packDirName: dirName, status: PackOutcomeStatus.noRelease),
      );
      return null;
    }

    final zipAsset = release.assets
        .where((a) => a.name.toLowerCase().endsWith('.zip'))
        .firstOrNull;
    if (zipAsset == null) {
      outcomes.add(
        PackOutcome(packDirName: dirName, status: PackOutcomeStatus.noZipAsset),
      );
      return null;
    }

    final manifest = versionProbe!;
    final articles = await PackReader.readArticles(packDir);

    final result = PackValidation.validate(
      manifest: manifest,
      articles: articles,
      releaseVersion: release.version,
    );

    if (result.hasErrors) {
      outcomes.add(
        PackOutcome(
          packDirName: dirName,
          status: PackOutcomeStatus.validationFailed,
          detail: result.issues
              .where((i) => !i.isWarning)
              .map((i) => i.message)
              .join('; '),
        ),
      );
      return null;
    }

    final bytes = await releaseSource.downloadAsset(zipAsset);

    // Cross-check the ZIP's own internal manifest.md pack_id against
    // what the release was believed to be for - defense in depth
    // against a registry-entry-to-file mismatch.
    final internalPackId = _readInternalPackId(bytes);
    if (internalPackId != packId) {
      outcomes.add(
        PackOutcome(
          packDirName: dirName,
          status: PackOutcomeStatus.validationFailed,
          detail:
              'release ZIP internal pack_id "$internalPackId" does not '
              'match expected "$packId"',
        ),
      );
      return null;
    }

    final sha256Hex = sha256.convert(bytes).toString();
    final sourceCommit = await _tryGetGitCommit(officialPacksParent(packDir));

    final categoryTags = result.validArticles
        .map((a) => a.category)
        .toSet()
        .toList()
      ..sort();

    outcomes.add(
      PackOutcome(packDirName: dirName, status: PackOutcomeStatus.included),
    );

    return RegistryPackEntry(
      packId: manifest.packId,
      packName: manifest.packName,
      description: manifest.description,
      categoryTags: categoryTags,
      trustTier: 'official',
      verificationSummary: PackValidation.verificationSummary(
        result.validArticles,
      ),
      latestVersion: release.version,
      version: release.version,
      publishDate: release.publishedAt,
      changelogSummary: release.body,
      downloadUrl: zipAsset.downloadUrl,
      sha256: sha256Hex,
      sizeBytes: bytes.length,
      articleCount: result.validArticles.length,
      sourceCommit: sourceCommit,
    );
  }

  String? _readInternalPackId(List<int> zipBytes) {
    try {
      final archive = ZipDecoder().decodeBytes(zipBytes);
      final manifestFile = archive.files.firstWhere(
        (f) => f.isFile && f.name == 'manifest.md',
      );
      final content = utf8.decode(manifestFile.content as List<int>);
      return MarkdownParser.parse(content).field('pack_id');
    } catch (_) {
      return null;
    }
  }

  Directory officialPacksParent(Directory packDir) => packDir.parent.parent;

  Future<String?> _tryGetGitCommit(Directory repoRoot) async {
    try {
      final result = await Process.run(
        'git',
        ['rev-parse', 'HEAD'],
        workingDirectory: repoRoot.path,
      );
      if (result.exitCode != 0) return null;
      final sha = (result.stdout as String).trim();
      return sha.isEmpty ? null : sha;
    } catch (_) {
      return null;
    }
  }
}

extension _FirstOrNull<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}
