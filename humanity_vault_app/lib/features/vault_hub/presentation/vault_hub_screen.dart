import 'dart:io';

import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/widgets/bottom_safe_area.dart';
import '../../../shared/widgets/metadata_badge.dart';
import '../data/http_fetcher.dart';
import '../data/registry_client.dart';
import '../models/registry_pack_entry.dart';
import 'pack_detail_screen.dart';

/// The Vault Hub catalog: an offline-first list of Official Knowledge
/// Packs read from registry.json.
///
/// Loading follows the approved cache-first sequence: whatever is
/// already cached on device renders immediately, then a background
/// fetch silently refreshes it. A failed background refresh never
/// hides an already-visible cached catalog - it only adds a small
/// "offline" indicator.
class VaultHubScreen extends StatefulWidget {
  const VaultHubScreen({
    super.key,
    this.httpFetcher = const IoHttpFetcher(),
    this.cacheFileOverride,
    this.registryUrl,
  });

  final HttpFetcher httpFetcher;

  /// Test-only seam: when set, the registry cache is read from and
  /// written to this file directly instead of the real app documents
  /// directory, so widget tests can exercise the screen without
  /// path_provider involved.
  final File? cacheFileOverride;

  /// Test-only seam: overrides [RegistryClient.defaultRegistryUrl].
  final String? registryUrl;

  @override
  State<VaultHubScreen> createState() => _VaultHubScreenState();
}

class _VaultHubScreenState extends State<VaultHubScreen> {
  RegistryData? _data;
  bool _isRefreshing = true;
  bool _lastRefreshFailed = false;

  @override
  void initState() {
    super.initState();
    _loadOfflineFirst();
  }

  /// Resolves the cache file, if possible. Null means "no cache
  /// location available" (either no override in a test, or a real
  /// path_provider failure) - treated the same as "no cache yet",
  /// never as an error.
  Future<File?> _cacheFile() async {
    return widget.cacheFileOverride ?? await RegistryClient.cacheFile();
  }

  /// Step 1-2 of the approved offline-first sequence: load whatever is
  /// cached and render it immediately, before any network activity.
  Future<void> _loadOfflineFirst() async {
    final file = await _cacheFile();
    final cached = file == null ? null : await RegistryClient.readCache(file);
    if (!mounted) return;
    if (cached != null) {
      setState(() {
        _data = cached;
        _isRefreshing = true;
      });
    }
    await _refreshInBackground(file);
  }

  /// Step 3-4: refresh in the background and update in place if the
  /// fetch succeeds; a failure just keeps whatever is already shown.
  Future<void> _refreshInBackground(File? file) async {
    if (mounted) setState(() => _isRefreshing = true);

    final fetched = await RegistryClient.fetchRemote(
      widget.httpFetcher,
      url: widget.registryUrl,
    );

    if (!mounted) return;
    if (fetched != null) {
      if (file != null) {
        await RegistryClient.writeCache(file, fetched.rawJson);
        if (!mounted) return;
      }
      setState(() {
        _data = fetched.data;
        _isRefreshing = false;
        _lastRefreshFailed = false;
      });
    } else {
      setState(() {
        _isRefreshing = false;
        _lastRefreshFailed = true;
      });
    }
  }

  Future<void> _retry() async {
    final file = await _cacheFile();
    await _refreshInBackground(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vault Hub')),
      body: BottomSafeArea(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    final data = _data;

    if (data == null) {
      if (_isRefreshing) {
        return const Center(child: CircularProgressIndicator());
      }
      return _EmptyOrErrorState(onRetry: _retry);
    }

    if (data.packs.isEmpty) {
      return _EmptyOrErrorState(
        message: 'No Official Knowledge Packs are published yet.',
        onRetry: _retry,
      );
    }

    return Column(
      children: [
        if (_lastRefreshFailed) _OfflineBanner(generatedAt: data.generatedAt),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.screenPadding),
            itemCount: data.packs.length,
            separatorBuilder: (_, _) =>
                const SizedBox(height: AppSpacing.sm + AppSpacing.xs),
            itemBuilder: (context, index) {
              final pack = data.packs[index];
              return _VaultHubPackCard(
                pack: pack,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PackDetailScreen(
                        pack: pack,
                        httpFetcher: widget.httpFetcher,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _OfflineBanner extends StatelessWidget {
  const _OfflineBanner({required this.generatedAt});

  final String generatedAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.emergencySecondary,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        children: [
          const Icon(Icons.cloud_off, size: 16, color: AppColors.emergencyPrimary),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              generatedAt.isEmpty
                  ? 'Showing the last known catalog - offline.'
                  : 'Showing catalog as of $generatedAt - offline.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.emergencyPrimary,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyOrErrorState extends StatelessWidget {
  const _EmptyOrErrorState({this.message, required this.onRetry});

  final String? message;
  final VoidCallback onRetry;

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
            Icon(Icons.storefront_outlined, size: 48, color: colorScheme.outline),
            const SizedBox(height: AppSpacing.sm + AppSpacing.xs),
            Text(
              message ?? 'Could not load the Vault Hub catalog.',
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Check your connection and try again.',
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium
                  ?.copyWith(color: colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: AppSpacing.md),
            OutlinedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

class _VaultHubPackCard extends StatelessWidget {
  const _VaultHubPackCard({required this.pack, required this.onTap});

  final RegistryPackEntry pack;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.primary.withValues(alpha: 0.12),
                child: const Icon(Icons.inventory_2_outlined,
                    color: AppColors.primary),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(pack.packName, style: textTheme.titleMedium),
                    const SizedBox(height: 2),
                    Text(
                      'v${pack.version} · ${pack.articleCount} '
                      '${pack.articleCount == 1 ? 'article' : 'articles'} · '
                      '${formatPackSize(pack.sizeBytes)}',
                      style: textTheme.bodySmall
                          ?.copyWith(color: colorScheme.onSurfaceVariant),
                    ),
                    if ((pack.description ?? '').isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        pack.description!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodySmall
                            ?.copyWith(color: colorScheme.onSurfaceVariant),
                      ),
                    ],
                    const SizedBox(height: AppSpacing.sm),
                    MetadataBadge(
                      icon: Icons.verified_outlined,
                      label: pack.verificationSummary,
                      backgroundColor:
                          _verificationColor(pack.verificationSummary),
                      foregroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }

  static Color _verificationColor(String level) {
    switch (level.toLowerCase()) {
      case 'verified source':
        return AppColors.verificationVerified;
      case 'community verified':
        return AppColors.verificationCommunity;
      case 'historical source':
        return AppColors.verificationHistorical;
      default:
        return AppColors.verificationUnverified;
    }
  }
}

/// Formats a byte count as a short, human-readable size string. Shared
/// by the catalog list and the detail screen.
String formatPackSize(int bytes) {
  if (bytes < 1024) return '$bytes B';
  final kb = bytes / 1024;
  if (kb < 1024) return '${kb.toStringAsFixed(kb < 10 ? 1 : 0)} KB';
  final mb = kb / 1024;
  return '${mb.toStringAsFixed(mb < 10 ? 1 : 0)} MB';
}
