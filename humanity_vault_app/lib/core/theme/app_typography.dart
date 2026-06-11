import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Centralized text styles for the Humanity Vault design system.
///
/// Uses system fonts for offline reliability. Headings and titles are
/// bold/semi-bold for clarity; body text uses relaxed line height for
/// long-form reading.
class AppTypography {
  AppTypography._();

  static const TextTheme textTheme = TextTheme(
    headlineMedium: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      height: 1.3,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
      height: 1.3,
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      height: 1.6,
      color: AppColors.textPrimary,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      height: 1.6,
      color: AppColors.textPrimary,
    ),
    labelSmall: TextStyle(
      fontWeight: FontWeight.w500,
      letterSpacing: 0.4,
      color: AppColors.textPrimary,
    ),
  );
}
