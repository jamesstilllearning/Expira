import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppSpacing {
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const xl = 24.0;
  static const xxl = 32.0;
  static const xxxl = 40.0;
}

abstract final class AppRadius {
  static const card = 20.0;
  static const control = 14.0;
  static const pill = 999.0;
}

abstract final class AppIconSize {
  static const sm = 16.0;
  static const md = 20.0;
  static const lg = 24.0;
  static const xl = 28.0;
  static const xxl = 36.0;
}

abstract final class AppElevation {
  static const level0 = 0.0;
  static const level1 = 1.0;
  static const level2 = 3.0;
  static const level3 = 6.0;
  static const level4 = 12.0;
}

abstract final class AppDuration {
  static const fast = Duration(milliseconds: 150);
  static const normal = Duration(milliseconds: 250);
  static const slow = Duration(milliseconds: 350);
  static const pageTransition = Duration(milliseconds: 320);
}

/// Central Material 3 themes for ExPIRA. Brand and semantic colors are fixed
/// so expiry status remains consistent; surface and content roles adapt by
/// brightness.
abstract final class AppTheme {
  static ThemeData light() => _build(Brightness.light);
  static ThemeData dark() => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final canvas = isDark ? AppColors.canvasDark : AppColors.canvas;
    final surface = isDark ? AppColors.surfaceDark : AppColors.surface;
    final surfaceVariant =
        isDark ? AppColors.surfaceVariantDark : AppColors.surfaceVariant;
    final base = ThemeData(
      brightness: brightness,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.brand,
        brightness: brightness,
        surface: surface,
      ).copyWith(
        primary: isDark ? AppColors.brandLight : AppColors.brand,
        onPrimary: isDark ? AppColors.brandDeep : Colors.white,
        primaryContainer:
            isDark ? const Color(0xFF234B36) : const Color(0xFFD8EFDF),
        onPrimaryContainer:
            isDark ? const Color(0xFFD8EFDF) : AppColors.brandDeep,
        secondary: isDark ? const Color(0xFFFFC27A) : AppColors.accent,
        surface: surface,
        onSurface: isDark ? const Color(0xFFE5ECE6) : AppColors.deep,
        surfaceContainerHighest: surfaceVariant,
        onSurfaceVariant:
            isDark ? const Color(0xFFB8C7BC) : const Color(0xFF53645A),
        outline: isDark ? const Color(0xFF526157) : const Color(0xFF87958B),
        outlineVariant:
            isDark ? const Color(0xFF35443A) : const Color(0xFFD7E0D8),
      ),
    );

    final scheme = base.colorScheme;
    final text = base.textTheme.copyWith(
      headlineMedium: base.textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.w700,
        letterSpacing: -0.55,
      ),
      headlineSmall: base.textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.w700,
        letterSpacing: -0.35,
      ),
      titleLarge: base.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w700,
        letterSpacing: -0.2,
      ),
      titleMedium: base.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      labelLarge: base.textTheme.labelLarge?.copyWith(
        fontWeight: FontWeight.w700,
      ),
    );
    final cardShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.card),
    );
    final pillShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.pill),
    );

    return base.copyWith(
      textTheme: text,
      scaffoldBackgroundColor: canvas,
      appBarTheme: AppBarTheme(
        backgroundColor: canvas,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: text.titleLarge?.copyWith(color: scheme.onSurface),
      ),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: cardShape,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.control),
          borderSide: BorderSide(color: scheme.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.control),
          borderSide: BorderSide(color: scheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.control),
          borderSide: BorderSide(color: scheme.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.control),
          borderSide: BorderSide(color: scheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.control),
          borderSide: BorderSide(color: scheme.error, width: 1.5),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(48, 48),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: pillShape,
          textStyle: text.labelLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(48, 48),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: pillShape,
          textStyle: text.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: const Size(48, 48),
          shape: pillShape,
          textStyle: text.labelLarge,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: surface,
        indicatorColor: scheme.primaryContainer,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        labelTextStyle: WidgetStatePropertyAll(
          text.labelMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      chipTheme: base.chipTheme.copyWith(
        shape: pillShape,
        side: BorderSide(color: scheme.outlineVariant),
        labelStyle: text.labelLarge?.copyWith(color: scheme.onSurface),
        padding: const EdgeInsets.symmetric(horizontal: 4),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: surface,
        modalBackgroundColor: surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        showDragHandle: true,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.control),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),
    );
  }
}
