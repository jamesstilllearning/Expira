import 'package:flutter/material.dart';

/// ExPIRA's brand and semantic colors. Expiry colors stay stable between
/// themes so an item's urgency always means the same thing.
abstract final class AppColors {
  static const brand = Color(0xFF1B7650);
  static const brandDeep = Color(0xFF125238);
  static const brandLight = Color(0xFFB8E3C9);
  static const deep = Color(0xFF18251D);

  static const canvas = Color(0xFFF5F7F3);
  static const surface = Color(0xFFFFFFFF);
  static const surfaceVariant = Color(0xFFEDF2EC);
  static const canvasDark = Color(0xFF101713);
  static const surfaceDark = Color(0xFF19231D);
  static const surfaceVariantDark = Color(0xFF243129);

  static const accent = Color(0xFFD28A36);
  static const expired = Color(0xFF9B1D3F);
  static const expiring = Color(0xFFE8553D);
  static const soon = Color(0xFF9A6100);
  static const safe = Color(0xFF1F8059);

  static Color expiredFor(Brightness brightness) =>
      brightness == Brightness.dark ? const Color(0xFFFF8FA7) : expired;
  static Color expiringFor(Brightness brightness) =>
      brightness == Brightness.dark ? const Color(0xFFFF8A70) : expiring;
  static Color soonFor(Brightness brightness) =>
      brightness == Brightness.dark ? const Color(0xFFFFC15B) : soon;
  static Color safeFor(Brightness brightness) =>
      brightness == Brightness.dark ? const Color(0xFF73D6A2) : safe;
}
