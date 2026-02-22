import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/constants/colors.dart';
import 'core/constants/styles.dart';

/// NEXI Assistant Theme Configuration
/// Complete theme data for Material 3 dark mode
class NexiTheme {
  NexiTheme._();

  static ThemeData get darkTheme {
    final baseTextTheme = GoogleFonts.spaceGroteskTextTheme(
      Typography.dense2021,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.spaceGrotesk().fontFamily,

      // Color Scheme
      colorScheme: const ColorScheme.dark(
        primary: NexiColors.primary,
        onPrimary: Colors.white,
        primaryContainer: NexiColors.primaryDark,
        onPrimaryContainer: Colors.white,
        secondary: NexiColors.accentTeal,
        onSecondary: Colors.black,
        secondaryContainer: NexiColors.accentTealDark,
        onSecondaryContainer: Colors.black,
        surface: NexiColors.cardDark,
        onSurface: NexiColors.textPrimary,
        surfaceContainerHighest: NexiColors.surfaceDark,
        onSurfaceVariant: NexiColors.textSecondary,
        error: NexiColors.error,
        onError: Colors.white,
        outline: NexiColors.glassBorder,
        shadow: Colors.black,
        scrim: Colors.black54,
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: NexiColors.backgroundDark.withOpacity(0.8),
        foregroundColor: NexiColors.textPrimary,
        centerTitle: true,
        titleTextStyle: baseTextTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: NexiColors.textPrimary,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: NexiColors.backgroundDark,
        ),
      ),

      // Scaffold Background
      scaffoldBackgroundColor: NexiColors.backgroundDark,

      // Card Theme
      cardTheme: CardThemeData(
        elevation: 0,
        color: NexiColors.cardDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(NexiStyles.radiusDefault),
        ),
      ),

      // Bottom Navigation
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: NexiColors.backgroundDark.withOpacity(0.9),
        selectedItemColor: NexiColors.primary,
        unselectedItemColor: NexiColors.textSecondary,
        selectedLabelStyle: NexiStyles.caption,
        unselectedLabelStyle: NexiStyles.caption,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),

      // FAB Theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: NexiColors.primary,
        foregroundColor: Colors.white,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(NexiStyles.radiusFull),
        ),
      ),

      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: NexiColors.glassBase,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(NexiStyles.radiusFull),
          borderSide: const BorderSide(color: NexiColors.glassBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(NexiStyles.radiusFull),
          borderSide: const BorderSide(color: NexiColors.glassBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(NexiStyles.radiusFull),
          borderSide: const BorderSide(color: NexiColors.primary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: NexiStyles.spaceM,
          vertical: NexiStyles.spaceM,
        ),
        hintStyle: baseTextTheme.bodyMedium?.copyWith(
          color: NexiColors.textMuted,
        ),
      ),

      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: NexiColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: NexiStyles.spaceL,
            vertical: NexiStyles.spaceM,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(NexiStyles.radiusFull),
          ),
          textStyle: baseTextTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: NexiColors.primary,
          padding: const EdgeInsets.symmetric(
            horizontal: NexiStyles.spaceM,
            vertical: NexiStyles.spaceS,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(NexiStyles.radiusDefault),
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: NexiColors.textPrimary,
          side: const BorderSide(color: NexiColors.glassBorder),
          padding: const EdgeInsets.symmetric(
            horizontal: NexiStyles.spaceL,
            vertical: NexiStyles.spaceM,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(NexiStyles.radiusFull),
          ),
        ),
      ),

      // List Tile Theme
      listTileTheme: ListTileThemeData(
        tileColor: Colors.transparent,
        selectedTileColor: NexiColors.primary.withOpacity(0.1),
        iconColor: NexiColors.textSecondary,
        textColor: NexiColors.textPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(NexiStyles.radiusDefault),
        ),
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: NexiColors.glassBorder,
        thickness: 1,
        space: NexiStyles.spaceM,
      ),

      // Switch Theme
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          }
          return NexiColors.textSecondary;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return NexiColors.primary;
          }
          return NexiColors.surfaceDark;
        }),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      ),

      // Slider Theme
      sliderTheme: SliderThemeData(
        activeTrackColor: NexiColors.primary,
        inactiveTrackColor: NexiColors.surfaceDark,
        thumbColor: NexiColors.primary,
        overlayColor: NexiColors.primary.withOpacity(0.2),
        trackHeight: 4,
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: NexiColors.glassBase,
        selectedColor: NexiColors.primary.withOpacity(0.2),
        labelStyle: baseTextTheme.bodySmall,
        padding: const EdgeInsets.symmetric(
          horizontal: NexiStyles.spaceM,
          vertical: NexiStyles.spaceS,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(NexiStyles.radiusFull),
          side: const BorderSide(color: NexiColors.glassBorder),
        ),
      ),

      // Text Theme
      textTheme: baseTextTheme.copyWith(
        headlineLarge: NexiStyles.headlineLarge.copyWith(
          color: NexiColors.textPrimary,
        ),
        headlineMedium: NexiStyles.headlineMedium.copyWith(
          color: NexiColors.textPrimary,
        ),
        headlineSmall: NexiStyles.headlineSmall.copyWith(
          color: NexiColors.textPrimary,
        ),
        titleLarge: baseTextTheme.titleLarge?.copyWith(
          color: NexiColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: baseTextTheme.titleMedium?.copyWith(
          color: NexiColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: baseTextTheme.titleSmall?.copyWith(
          color: NexiColors.textSecondary,
        ),
        bodyLarge: NexiStyles.bodyLarge.copyWith(
          color: NexiColors.textPrimary,
        ),
        bodyMedium: NexiStyles.bodyMedium.copyWith(
          color: NexiColors.textPrimary,
        ),
        bodySmall: baseTextTheme.bodySmall?.copyWith(
          color: NexiColors.textSecondary,
        ),
        labelLarge: baseTextTheme.labelLarge?.copyWith(
          color: NexiColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
        labelMedium: baseTextTheme.labelMedium?.copyWith(
          color: NexiColors.textSecondary,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: NexiStyles.caption.copyWith(
          color: NexiColors.textMuted,
        ),
      ),

      // Icon Theme
      iconTheme: const IconThemeData(
        color: NexiColors.textSecondary,
        size: 24,
      ),

      // Progress Indicator
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: NexiColors.primary,
        linearTrackColor: NexiColors.surfaceDark,
      ),
    );
  }
}
