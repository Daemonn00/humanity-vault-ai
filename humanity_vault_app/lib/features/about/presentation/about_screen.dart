import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/widgets/bottom_safe_area.dart';
import '../../../shared/widgets/bullet_list.dart';
import '../../../shared/widgets/section_card.dart';
import '../../library/data/articles_repository.dart';
import '../../library/data/categories_repository.dart';
import '../../packs/data/pack_importer.dart';

/// Static screen describing Humanity Vault AI's mission, core
/// principles, and current library status - plus a minimal local
/// Knowledge Pack import entry point.
class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  bool _isImporting = false;

  Future<void> _importKnowledgePack() async {
    if (_isImporting) return;
    setState(() => _isImporting = true);

    try {
      final picked = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['zip'],
      );

      final path = picked?.files.single.path;
      if (path == null) {
        _showResult('No pack file was selected.');
        return;
      }

      final result = await PackImporter.importZip(File(path));

      if (result.isSuccess) {
        final skipped = result.skippedCount;
        final articleWord = result.importedCount == 1 ? 'article' : 'articles';
        _showResult(
          '${result.packName}: imported ${result.importedCount} '
          '$articleWord'
          '${skipped > 0 ? ', skipped $skipped' : ''}. '
          'Restart the app to load this pack.',
        );
      } else {
        _showResult(result.message ?? 'This pack could not be imported.');
      }
    } catch (_) {
      _showResult('Something went wrong importing this pack.');
    } finally {
      if (mounted) setState(() => _isImporting = false);
    }
  }

  void _showResult(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 4)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = CategoriesRepository().getCategories();
    final articleCount = categories.fold<int>(
      0,
      (total, category) =>
          total + ArticlesRepository().getArticles(category.folderName).length,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: BottomSafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.screenPadding),
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(AppSpacing.heroRadius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.eco, size: 40, color: Colors.white),
                  const SizedBox(height: AppSpacing.sm + AppSpacing.xs),
                  Text(
                    'Humanity Vault AI',
                    style: Theme.of(
                      context,
                    ).textTheme.headlineMedium?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    'Alpha 1.0 · ${categories.length} categories · $articleCount articles',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.background,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            SectionCard(
              icon: Icons.flag_outlined,
              title: 'Mission',
              child: const Text(
                "Preserve humanity's practical, scientific, cultural, "
                'historical, ethical, and spiritual knowledge for future '
                'generations - accessible even when internet infrastructure '
                'is unavailable.',
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            SectionCard(
              icon: Icons.checklist_outlined,
              title: 'Core Principles',
              child: const BulletList(
                items: [
                  'Offline First',
                  'Knowledge First',
                  'AI Optional',
                  'Open Source',
                  'Privacy First',
                  'Community Driven',
                  'Free Forever',
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            SectionCard(
              icon: Icons.lock_outline,
              title: 'Offline & Private',
              child: const Text(
                'Humanity Vault works entirely offline. There is no '
                'database, no AI, and no network access required - nothing '
                'you read ever leaves this device.',
              ),
            ),
            // Knowledge Pack storage is local-filesystem based (an
            // Android-focused concept) - not meaningful in a browser tab.
            if (!kIsWeb) const SizedBox(height: AppSpacing.md),
            if (!kIsWeb)
              SectionCard(
                icon: Icons.inventory_2_outlined,
                title: 'Knowledge Packs',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Import an optional local Knowledge Pack (.zip) from '
                      'this device - no internet required.',
                    ),
                    const SizedBox(height: AppSpacing.sm + AppSpacing.xs),
                    ImportPackRow(
                      isImporting: _isImporting,
                      onTap: _isImporting ? null : _importKnowledgePack,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// The tappable "Import Knowledge Pack" row, shown in the About
/// screen's Knowledge Packs section. Extracted as its own widget
/// (rather than kept inline) so its idle and loading layouts can be
/// tested directly, without depending on the exact async timing of a
/// real file pick.
class ImportPackRow extends StatelessWidget {
  const ImportPackRow({
    super.key,
    required this.isImporting,
    required this.onTap,
  });

  final bool isImporting;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.primary.withValues(alpha: 0.12),
                child: const Icon(
                  Icons.file_upload_outlined,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              const Expanded(child: Text('Import Knowledge Pack')),
              if (isImporting)
                const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              else
                const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
