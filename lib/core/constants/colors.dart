import 'package:flutter/material.dart';

/// NEXI Assistant Color Palette
/// Extracted from Stitch HTML/CSS design
class NexiColors {
  NexiColors._();

  // Primary Colors - Indigo
  static const Color primary = Color(0xFF4B3FE9);
  static const Color primaryLight = Color(0xFF6B5FE9);
  static const Color primaryDark = Color(0xFF3A2FD9);
  static const Color primary20 = Color(0x334B3FE9);

  // Accent Colors - Teal
  static const Color accentTeal = Color(0xFF2DD4BF);
  static const Color accentTealLight = Color(0xFF5EE4D4);
  static const Color accentTealDark = Color(0xFF14B8A6);
  static const Color accentTeal10 = Color(0x1A2DD4BF);

  // Background Colors
  static const Color backgroundDark = Color(0xFF121121);
  static const Color backgroundAlt = Color(0xFF0F172A);
  static const Color cardDark = Color(0xFF1C1B2E);
  static const Color surfaceDark = Color(0xFF1E293B);

  // Glass/Surface
  static const Color glassBase = Color(0x08FFFFFF);
  static const Color glassBorder = Color(0x14FFFFFF);

  // Text Colors
  static const Color textPrimary = Color(0xFFF1F5F9);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textMuted = Color(0xFF64748B);
  static const Color textDisabled = Color(0xFF475569);

  // Status Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Gradients
  static const LinearGradient gradientPrimary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, accentTeal],
  );
}
