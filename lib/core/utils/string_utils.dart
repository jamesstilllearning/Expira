/// String utilities for the application.

/// Capitalizes the first letter of a string.
String capitalize(String value) {
  if (value.isEmpty) return value;
  return value[0].toUpperCase() + value.substring(1);
}

/// Capitalizes the first letter of each word.
String capitalizeWords(String value) {
  if (value.isEmpty) return value;
  return value.split(' ').map(capitalize).join(' ');
}

/// Truncates a string to a maximum length, adding ellipsis if needed.
String truncate(String value, int maxLength, {String ellipsis = '...'}) {
  if (value.length <= maxLength) return value;
  return '${value.substring(0, maxLength - ellipsis.length)}$ellipsis';
}

/// Removes all whitespace from a string.
String removeWhitespace(String value) {
  return value.replaceAll(RegExp(r'\s+'), '');
}

/// Checks if a string is a valid email address.
bool isValidEmail(String value) {
  return RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
  ).hasMatch(value);
}

/// Checks if a string is a valid URL.
bool isValidUrl(String value) {
  return RegExp(
    r'^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$',
  ).hasMatch(value);
}

/// Generates a slug from a string (lowercase, hyphens instead of spaces).
String slugify(String value) {
  return value
      .toLowerCase()
      .replaceAll(RegExp(r'[^a-z0-9]+'), '-')
      .replaceAll(RegExp(r'^-+|-+$'), '');
}

/// Masks a string (e.g., for displaying partial emails/phone numbers).
String mask(String value, {int visibleStart = 2, int visibleEnd = 2, String maskChar = '*'}) {
  if (value.length <= visibleStart + visibleEnd) {
    return maskChar * value.length;
  }
  final start = value.substring(0, visibleStart);
  final end = value.substring(value.length - visibleEnd);
  final middle = maskChar * (value.length - visibleStart - visibleEnd);
  return '$start$middle$end';
}

/// Formats a number with commas (e.g., 1,000,000).
String formatNumberWithCommas(int value) {
  return value.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (match) => '${match[1]},',
      );
}

/// Parses a string to int, returning null if invalid.
int? parseIntOrNull(String? value) {
  if (value == null) return null;
  return int.tryParse(value);
}

/// Parses a string to double, returning null if invalid.
double? parseDoubleOrNull(String? value) {
  if (value == null) return null;
  return double.tryParse(value);
}