import 'dart:io';

import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/widgets/bottom_safe_area.dart';
import '../../../shared/widgets/metadata_badge.dart';
import '../../../shared/widgets/section_card.dart';
import '../../packs/data/pack_importer.dart';
import '../../packs/data/pack_storage.dart';
import '../data/http_fetcher.dart';
import '../data/pack_downloader.dart';
import '../models/pack_lifecycle_state.dart';
import '../models/registry_pack_entry.dart';
import 'vault_hub_screen.dart' show formatPackSize;

/// A single pack's detail view and the state-driven Install action.
///
/// Drives the approved five-state lifecycle (Available -> Downloading
/// -> Verifying -> Installing -> Installed) directly: downloads the
/// release ZIP, verifies its SHA-256 against the registry entry
/// *before* anything is written to a location PackImporter will read,
/// then hands the verified file to the existing, unmodified
/// PackImporter. Any failure at any step reverts to Available with a
/// transient error message - there is no separate Failed state.
class PackDetailScreen extends StatefulWidget {
  const PackDetailScreen({
    super.key,
    required this.pack,
    this.httpFetcher = const IoHttpFetcher(),
    this.downloadFileOverride,
    this.stagingDirectoryOverride,
    this.packsDirectoryOverride,
  });

  final RegistryPackEntry pack;
  final HttpFetcher httpFetcher;

  /// Test-only seam: where the downloaded ZIP bytes are written before
  /// being handed to PackImporter, instead of the real app documents
  /// directory.
  final File? downloadFileOverride;

  /// Test-only seam: passed straight through to
  /// `PackImporter.importZipInto`'s `staging` parameter.
  final Directory? stagingDirectoryOverride;

  /// Test-only seam: passed straight through to
  /// `PackImporter.importZipInto`'s `packsDir` parameter, and used to
  /// check whether this pack is already installed.
  final Directory? packsDirectoryOverride;

  @override
  State<PackDetailScreen> createState() => _PackDetailScreenState();
}

class _PackDetailScreenState extends State<PackDetailScreen> {
  PackLifecycleState _state = PackLifecycleState.available;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _checkInstalled();
  }

  Future<void> _checkInstalled() async {
    try {
      final installedIds = widget.packsDirectoryOverride != null
          ? await PackStorage.installedPackIdsIn(widget.packsDirectoryOverride!)
          : await PackStorage.installedPackIds();
      if (!mounted) return;
      if (installedIds.contains(widget.pack.packId)) {
        setState(() => _state = PackLifecycleState.installed);
      }
    } catch (_) {
      // Leave the pack as Available - the worst case is a redundant
      // "already installed" error surfaced later by PackImporter
      // itself, not a crash here.
    }
  }

  Future<void> _install() async {
    setState(() {
      _state = PackLifecycleState.downloading;
      _errorMessage = null;
    });

    final uri = Uri.tryParse(widget.pack.downloadUrl);
    if (uri == null) {
      _revertWithError('This pack has an invalid download link.');
      return;
    }

    final HttpFetchResult result;
    try {
      result = await widget.httpFetcher.get(uri);
    } catch (_) {
      _revertWithError(
        'Could not download this pack. Check your connection and try again.',
      );
      return;
    }
    if (!mounted) return;
    if (result.statusCode != 200) {
      _revertWithError('Could not download this pack. Try again.');
      return;
    }

    if (!mounted) return;
    setState(() => _state = PackLifecycleState.verifying);
    final verified =
        PackDownloader.verifyChecksum(result.bodyBytes, widget.pack.sha256);
    if (!verified) {
      _revertWithError(
        'This pack could not be verified and was not installed.',
      );
      return;
    }

    if (!mounted) return;
    setState(() => _state = PackLifecycleState.installing);

    final File zipFile;
    try {
      final target =
          widget.downloadFileOverride ?? await PackDownloader.stagingFile();
      zipFile = await PackDownloader.writeToFile(result.bodyBytes, target);
    } catch (_) {
      _revertWithError('Could not save this pack for installation. Try again.');
      return;
    }

    final PackImportResult importResult;
    try {
      importResult = widget.stagingDirectoryOverride != null &&
              widget.packsDirectoryOverride != null
          ? await PackImporter.importZipInto(
              zipFile,
              staging: widget.stagingDirectoryOverride!,
              packsDir: widget.packsDirectoryOverride!,
            )
          : await PackImporter.importZip(zipFile);
    } catch (_) {
      _revertWithError('Something went wrong installing this pack.');
      return;
    }

    if (!mounted) return;
    if (importResult.isSuccess) {
      setState(() => _state = PackLifecycleState.installed);
      _showMessage('Installed ${importResult.packName ?? widget.pack.packName}.');
    } else {
      _revertWithError(
        importResult.message ?? 'Something went wrong installing this pack.',
      );
    }
  }

  void _revertWithError(String message) {
    if (!mounted) return;
    setState(() {
      _state = PackLifecycleState.available;
      _errorMessage = message;
    });
  }

  void _showMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 4)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pack = widget.pack;

    return Scaffold(
      appBar: AppBar(title: Text(pack.packName)),
      body: BottomSafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.screenPadding),
              children: [
                _Header(pack: pack),
                const SizedBox(height: AppSpacing.md),
                if ((pack.description ?? '').isNotEmpty) ...[
                  SectionCard(
                    icon: Icons.info_outline,
                    title: 'About this pack',
                    child: Text(pack.description!),
                  ),
                  const SizedBox(height: AppSpacing.md),
                ],
                if (pack.changelogSummary.isNotEmpty) ...[
                  SectionCard(
                    icon: Icons.history_edu_outlined,
                    title: "What's in this version",
                    child: Text(pack.changelogSummary),
                  ),
                  const SizedBox(height: AppSpacing.md),
                ],
                if (_errorMessage != null) ...[
                  _ErrorBanner(message: _errorMessage!),
                  const SizedBox(height: AppSpacing.md),
                ],
                _ActionButton(state: _state, onInstall: _install),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.pack});

  final RegistryPackEntry pack;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(AppSpacing.heroRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pack.packName,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: AppSpacing.sm + AppSpacing.xs),
          Text(
            'v${pack.version} · ${pack.articleCount} '
            '${pack.articleCount == 1 ? 'article' : 'articles'} · '
            '${formatPackSize(pack.sizeBytes)}',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.background),
          ),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              MetadataBadge(
                icon: Icons.verified_outlined,
                label: pack.verificationSummary,
                backgroundColor: AppColors.accent,
                foregroundColor: AppColors.textPrimary,
              ),
              for (final tag in pack.categoryTags)
                MetadataBadge(
                  icon: Icons.label_outline,
                  label: tag,
                  backgroundColor: Colors.white.withValues(alpha: 0.16),
                  foregroundColor: Colors.white,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ErrorBanner extends StatelessWidget {
  const _ErrorBanner({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.emergencySecondary,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        border: Border.all(color: AppColors.emergencyPrimary, width: 1),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: AppColors.emergencyPrimary),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.emergencyPrimary),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.state, required this.onInstall});

  final PackLifecycleState state;
  final VoidCallback onInstall;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case PackLifecycleState.available:
        return FilledButton.icon(
          onPressed: onInstall,
          icon: const Icon(Icons.download_outlined),
          label: const Text('Install'),
        );
      case PackLifecycleState.downloading:
        return const _BusyButton(label: 'Downloading…');
      case PackLifecycleState.verifying:
        return const _BusyButton(label: 'Verifying…');
      case PackLifecycleState.installing:
        return const _BusyButton(label: 'Installing…');
      case PackLifecycleState.installed:
        return FilledButton.icon(
          onPressed: null,
          icon: const Icon(Icons.check_circle_outline),
          label: const Text('Installed'),
        );
    }
  }
}

class _BusyButton extends StatelessWidget {
  const _BusyButton({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: null,
      icon: const SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
      ),
      label: Text(label),
    );
  }
}
