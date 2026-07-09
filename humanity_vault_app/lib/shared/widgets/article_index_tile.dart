import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';

/// A field-manual style list row for an article.
///
/// Shows a thin accent line and tinted icon badge in the category's
/// color, the article title, and its category name. The whole row is
/// tappable; there is no trailing chevron. An optional two-digit
/// [index] marker (e.g. `03`) can be shown for lists whose order is
/// stable, such as a category's article list - omit it for dynamic
/// orders like search results.
class ArticleIndexTile extends StatelessWidget {
  const ArticleIndexTile({
    super.key,
    required this.title,
    required this.category,
    required this.color,
    required this.onTap,
    this.index,
  });

  final String title;
  final String category;
  final Color color;
  final VoidCallback onTap;

  /// Optional 1-based stable position, rendered as `01`, `02`, ...
  final int? index;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: color, width: 3),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: color.withValues(alpha: 0.18),
                  child: Icon(Icons.article_outlined, color: color, size: 22),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        category,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
                if (index != null) ...[
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    index.toString().padLeft(2, '0'),
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: colorScheme.outline),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
