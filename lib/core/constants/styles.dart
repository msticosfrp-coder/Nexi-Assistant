import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

/// NEXI Assistant Design System Styles
class NexiStyles {
  NexiStyles._();

  // Border Radius
  static const double radiusSmall = 8.0;
  static const double radiusDefault = 16.0;
  static const double radiusLarge = 24.0;
  static const double radiusFull = 9999.0;

  // Spacing
  static const double spaceXS = 4.0;
  static const double spaceS = 8.0;
  static const double spaceM = 16.0;
  static const double spaceL = 24.0;
  static const double spaceXL = 32.0;

  // Blur
  static const double glassBlur = 20.0;

  // Shadows
  static BoxShadow shadowCard = BoxShadow(
    color: Colors.black.withOpacity(0.2),
    blurRadius: 20,
    offset: const Offset(0, 8),
  );

  // Glass Decoration
  static BoxDecoration glassDecoration = BoxDecoration(
    color: NexiColors.glassBase,
    borderRadius: BorderRadius.circular(radiusDefault),
    border: Border.all(color: NexiColors.glassBorder, width: 1),
  );

  // Text Styles (font applied via Google Fonts)
  static TextStyle get headlineLarge =>
      GoogleFonts.spaceGrotesk(fontSize: 32, fontWeight: FontWeight.bold);

  static TextStyle get headlineMedium =>
      GoogleFonts.spaceGrotesk(fontSize: 28, fontWeight: FontWeight.bold);

  static TextStyle get headlineSmall =>
      GoogleFonts.spaceGrotesk(fontSize: 24, fontWeight: FontWeight.bold);

  static TextStyle get bodyLarge =>
      GoogleFonts.spaceGrotesk(fontSize: 16, fontWeight: FontWeight.normal);

  static TextStyle get bodyMedium =>
      GoogleFonts.spaceGrotesk(fontSize: 14, fontWeight: FontWeight.normal);

  static TextStyle get caption =>
      GoogleFonts.spaceGrotesk(fontSize: 12, fontWeight: FontWeight.w500);
}
