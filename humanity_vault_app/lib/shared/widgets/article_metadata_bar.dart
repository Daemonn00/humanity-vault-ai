import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../features/library/models/article.dart';
import 'metadata_badge.dart';

/// Displays an article's optional metadata: verification level and
/// knowledge level badges, plus author, last-updated, and subcategory
/// info lines.
///
/// Renders nothing if no metadata fields are present.
class ArticleMetadataBar extends StatelessWidget {
  const ArticleMetadataBar({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    final badges = <Widget>[];

    final verificationLevel = article.verificationLevel;
    if (verificationLevel != null && verificationLevel.isNotEmpty) {
      badges.add(
        MetadataBadge(
          icon: Icons.verified_outlined,
          label: verificationLevel,
          backgroundColor: _verificationColor(verificationLevel),
          foregroundColor: Colors.white,
        ),
      );
    }

    final knowledgeLevel = article.knowledgeLevel;
    if (knowledgeLevel != null && knowledgeLevel.isNotEmpty) {
      badges.add(
        MetadataBadge(
          icon: Icons.school_outlined,
          label: knowledgeLevel,
          backgroundColor: AppColors.accent,
          foregroundColor: AppColors.textPrimary,
        ),
      );
    }

    final infoLines = <Widget>[];

    final author = article.author;
    if (author != null && author.isNotEmpty) {
      infoLines.add(_InfoLine(icon: Icons.person_outline, text: 'By $author'));
    }

    final lastUpdated = article.lastUpdated;
    if (lastUpdated != null && lastUpdated.isNotEmpty) {
      infoLines.add(_InfoLine(icon: Icons.update, text: 'Updated $lastUpdated'));
    }

    final subcategory = article.subcategory;
    if (subcategory != null && subcategory.isNotEmpty) {
      infoLines.add(_InfoLine(icon: Icons.label_outline, text: subcategory));
    }

    if (badges.isEmpty && infoLines.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.sm + AppSpacing.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (badges.isNotEmpty)
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: badges,
            ),
          if (badges.isNotEmpty && infoLines.isNotEmpty)
            const SizedBox(height: AppSpacing.sm),
          if (infoLines.isNotEmpty)
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.xs,
              children: infoLines,
            ),
        ],
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

class _InfoLine extends StatelessWidget {
  const _InfoLine({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final mutedColor = AppColors.textPrimary.withValues(alpha: 0.6);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: mutedColor),
        const SizedBox(width: AppSpacing.xs),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: mutedColor, fontSize: 13),
        ),
      ],
    );
  }
}
