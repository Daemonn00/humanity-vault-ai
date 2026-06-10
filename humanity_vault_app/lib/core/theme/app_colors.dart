import 'package:flutter/material.dart';

/// Centralized color tokens for the Humanity Vault design system.
///
/// Green is the dominant brand color (growth, resilience, continuity).
/// Gold is an accent color only and must be used sparingly (small
/// highlights, badges) - never as a large background or dominant tone.
class AppColors {
  AppColors._();

  /// Page background - calm, neutral, not parchment/sepia.
  static const Color background = Color(0xFFF5F4EE);

  /// Card and surface background.
  static const Color surface = Color(0xFFFFFFFF);

  /// Dominant brand color - used for app bars, hero banners, primary
  /// actions, and active states.
  static const Color primary = Color(0xFF2F5D50);

  /// Accent color - used sparingly for highlights and badges only.
  static const Color accent = Color(0xFFD4B26A);

  /// Primary text color.
  static const Color textPrimary = Color(0xFF2A2A2A);

  /// Emergency Mode primary tone - prepared and resilient, not alarming.
  static const Color emergencyPrimary = Color(0xFFC7772B);

  /// Emergency Mode secondary tone - soft background/tint for cards.
  static const Color emergencySecondary = Color(0xFFF2E6D8);

  // ---------------------------------------------------------------------
  // Muted category colors
  // ---------------------------------------------------------------------

  static const Color survival = Color(0xFF4E7A4F);
  static const Color medicine = Color(0xFF5B8FA8);
  static const Color agriculture = Color(0xFF7D9C55);
  static const Color engineering = Color(0xFF7A7A7A);
  static const Color electronics = Color(0xFF4D6B8C);
  static const Color construction = Color(0xFF8A6B47);
  static const Color history = Color(0xFFA67C52);
  static const Color philosophy = Color(0xFF6E5A8A);
  static const Color islam = Color(0xFF2F7A5F);
  static const Color localWisdom = Color(0xFF8C6A4A);
}
