import 'dart:io';

import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/widgets/bottom_safe_area.dart';
import '../data/pack_storage.dart';
import '../data/packs_loader.dart';
import '../models/installed_pack_summary.dart';

/// Lists every installed Knowledge Pack and lets the user remove one,
/// with a confirmation dialog before any deletion.
class PackLibraryScreen extends StatefulWidget {
  const PackLibraryScreen({super.key, this.packsDirectoryOverride});

  /// Test-only seam: when set, summaries are read from this directory
  /// directly instead of the real app documents directory, so widget
  /// tests can exercise the screen without path_provider involved.
  final Directory? packsDirectoryOverride;

  @override
  State<PackLibraryScreen> createState() => _PackLibraryScreenState();
}

class _PackLibraryScreenState extends State<PackLibraryScreen> {
  late Future<List<InstalledPackSummary>> _summariesFuture;
  final Set<String> _removingFolders = {};

  @override
  void initState() {
    super.initState();
    _summariesFuture = _loadSummaries();
  }

  Future<List<InstalledPackSummary>> _loadSummaries() {
    final override = widget.packsDirectoryOverride;
    return override != null
        ? PacksLoader.installedPackSummariesIn(override)
        : PacksLoader.installedPackSummaries();
  }

  void _refresh() {
    setState(() {
      _summariesFuture = _loadSummaries();
    });
  }

  Future<void> _confirmAndRemove(InstalledPackSummary summary) async {
    final label = summary.manifest?.packName ?? summary.folderName;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Remove $label?'),
        content: const Text(
          'This deletes the pack from this device and cannot be undone. '
          'Articles already loaded from it will remain visible until you '
          'restart the app.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.emergencyPrimary,
            ),
            child: const Text('Remove'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    setState(() => _removingFolders.add(summary.folderName));
    final success = await PackStorage.removePack(summary.directory);
    if (!mounted) return;

    setState(() => _removingFolders.remove(summary.folderName));

    if (success) {
      _showMessage(
        'Removed. Restart the app for this change to take full effect.',
      );
      _refresh();
    } else {
      _showMessage('Could not remove this pack. Try again.');
    }
  }

  void _showMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 4)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manage Knowledge Packs')),
      body: BottomSafeArea(
        child: FutureBuilder<List<InstalledPackSummary>>(
          future: _summariesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }

            // A failure surfaces here as an empty list rather than a
            // permanent spinner - installedPackSummaries() already
            // treats every unreadable pack as a visible, removable
            // entry, so reaching an error here means something
            // unexpected (e.g. the packs directory itself vanished
            // mid-scan), not a single bad pack.
            final summaries = snapshot.data ?? const [];
            if (summaries.isEmpty) {
              return const _EmptyPackLibrary();
            }

            return ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.screenPadding),
              itemCount: summaries.length,
              separatorBuilder: (_, _) =>
                  const SizedBox(height: AppSpacing.sm + AppSpacing.xs),
              itemBuilder: (context, index) {
                final summary = summaries[index];
                final isRemoving =
                    _removingFolders.contains(summary.folderName);
                return _InstalledPackRow(
                  summary: summary,
                  isRemoving: isRemoving,
                  onRemove:
                      isRemoving ? null : () => _confirmAndRemove(summary),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _InstalledPackRow extends StatelessWidget {
  const _InstalledPackRow({
    required this.summary,
    required this.isRemoving,
    required this.onRemove,
  });

  final InstalledPackSummary summary;
  final bool isRemoving;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    final manifest = summary.manifest;
    final isReadable = manifest != null;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: isReadable
                  ? AppColors.primary.withValues(alpha: 0.12)
                  : AppColors.emergencyPrimary.withValues(alpha: 0.12),
              child: Icon(
                isReadable ? Icons.inventory_2_outlined : Icons.error_outline,
                color:
                    isReadable ? AppColors.primary : AppColors.emergencyPrimary,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isReadable ? manifest.packName : summary.folderName,
                    style: textTheme.titleMedium,
                  ),
                  const SizedBox(height: 2),
                  if (isReadable) ...[
                    Text(
                      'v${manifest.packVersion} · ${summary.articleCount ?? 0} '
                      '${(summary.articleCount ?? 0) == 1 ? 'article' : 'articles'}',
                      style: textTheme.bodySmall
                          ?.copyWith(color: colorScheme.onSurfaceVariant),
                    ),
                    if ((manifest.description ?? '').isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        manifest.description!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodySmall
                            ?.copyWith(color: colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ] else
                    Text(
                      'Unreadable pack - its manifest could not be parsed.',
                      style: textTheme.bodySmall
                          ?.copyWith(color: AppColors.emergencyPrimary),
                    ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            if (isRemoving)
              const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            else
              IconButton(
                icon: const Icon(Icons.delete_outline),
                color: AppColors.emergencyPrimary,
                tooltip: 'Remove pack',
                onPressed: onRemove,
              ),
          ],
        ),
      ),
    );
  }
}

class _EmptyPackLibrary extends StatelessWidget {
  const _EmptyPackLibrary();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 48,
              color: colorScheme.outline,
            ),
            const SizedBox(height: AppSpacing.sm + AppSpacing.xs),
            Text(
              'No Knowledge Packs installed yet.',
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Use Import Knowledge Pack in About to add one.',
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium
                  ?.copyWith(color: colorScheme.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}
