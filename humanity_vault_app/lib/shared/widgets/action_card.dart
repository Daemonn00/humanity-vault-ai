import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';

/// A card-based primary action item, used for top-level navigation
/// entries such as on the home screen.
class ActionCard extends StatelessWidget {
  const ActionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconBackgroundColor,
    required this.iconColor,
    required this.onTap,
    this.backgroundColor,
    this.borderColor,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconBackgroundColor;
  final Color iconColor;
  final VoidCallback onTap;

  /// Optional card background color, used to make this action visually
  /// stand apart from regular navigation entries (e.g. Emergency Mode).
  final Color? backgroundColor;

  /// Optional card border color, paired with [backgroundColor] for a
  /// high-visibility entry point.
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      shape: borderColor == null
          ? null
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
              side: BorderSide(color: borderColor!, width: 1.5),
            ),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: iconBackgroundColor,
                child: Icon(icon, color: iconColor),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
