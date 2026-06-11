import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';

/// A grid tile representing a knowledge category.
///
/// Shows a tinted icon badge in the category's color and the category
/// name, sized for a 2-column grid on phone screens.
class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.icon,
    required this.name,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String name;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: color.withValues(alpha: 0.12),
                    child: Icon(icon, color: color),
                  ),
                  Icon(Icons.chevron_right,
                      color: Theme.of(context).colorScheme.outline),
                ],
              ),
              const SizedBox(height: AppSpacing.sm + AppSpacing.xs),
              Text(
                name,
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
