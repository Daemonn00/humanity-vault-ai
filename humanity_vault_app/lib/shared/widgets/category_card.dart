import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';

/// A grid tile representing a knowledge category, styled as a
/// field-manual index entry.
///
/// Shows a tinted icon badge and a thin accent line in the category's
/// color, a muted two-digit index marker, the category name, and the
/// real article count - sized for a 2-column grid on phone screens.
class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.icon,
    required this.name,
    required this.color,
    required this.index,
    required this.articleCount,
    required this.onTap,
  });

  final IconData icon;
  final String name;
  final Color color;

  /// 1-based position in the category display order, shown as a
  /// two-digit index marker (e.g. `01`).
  final int index;

  /// Number of real articles in this category.
  final int articleCount;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final countLabel =
        articleCount == 1 ? '1 article' : '$articleCount articles';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: color.withValues(alpha: 0.18),
                      child: Icon(icon, color: color, size: 22),
                    ),
                    Text(
                      index.toString().padLeft(2, '0'),
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: colorScheme.outline),
                    ),
                  ],
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          name,
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        countLabel,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
