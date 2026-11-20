/// Date and time utilities for the application.
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

/// Returns the start of the day (00:00:00) for the given date in UTC.
DateTime startOfDayUtc(DateTime date) {
  return DateTime.utc(date.year, date.month, date.day);
}

/// Returns the end of the day (23:59:59.999) for the given date in UTC.
DateTime endOfDayUtc(DateTime date) {
  return DateTime.utc(date.year, date.month, date.day, 23, 59, 59, 999);
}

/// Returns the number of days between two dates (ignoring time).
int daysBetween(DateTime from, DateTime to) {
  final fromUtc = startOfDayUtc(from);
  final toUtc = startOfDayUtc(to);
  return toUtc.difference(fromUtc).inDays;
}

/// Returns true if the date is today (in UTC).
bool isTodayUtc(DateTime date) {
  final now = DateTime.now().toUtc();
  return startOfDayUtc(date) == startOfDayUtc(now);
}

/// Returns true if the date is in the past (before today in UTC).
bool isPastUtc(DateTime date) {
  final now = DateTime.now().toUtc();
  return startOfDayUtc(date).isBefore(startOfDayUtc(now));
}

/// Returns true if the date is in the future (after today in UTC).
bool isFutureUtc(DateTime date) {
  final now = DateTime.now().toUtc();
  return startOfDayUtc(date).isAfter(startOfDayUtc(now));
}

/// Format a date for display (e.g., "Jan 15, 2024").
String formatDateDisplay(DateTime date, {String locale = 'en_US'}) {
  return DateFormat.yMMMd(locale).format(date.toLocal());
}

/// Format a date for short display (e.g., "1/15/24").
String formatDateShort(DateTime date, {String locale = 'en_US'}) {
  return DateFormat.Md(locale).format(date.toLocal());
}

/// Format a date with weekday (e.g., "Mon, Jan 15").
String formatDateWithWeekday(DateTime date, {String locale = 'en_US'}) {
  return DateFormat('EEE, MMM d', locale).format(date.toLocal());
}

/// Format a time for display (e.g., "2:30 PM").
String formatTimeDisplay(DateTime date, {String locale = 'en_US'}) {
  return DateFormat.jm(locale).format(date.toLocal());
}

/// Format a date and time for display (e.g., "Jan 15, 2024 at 2:30 PM").
String formatDateTimeDisplay(DateTime date, {String locale = 'en_US'}) {
  return DateFormat.yMMMd(locale).add_jm().format(date.toLocal());
}

/// Format a relative time (e.g., "2 days ago", "in 3 hours").
String formatRelativeTime(DateTime date, {String locale = 'en_US'}) {
  final now = DateTime.now();
  final difference = date.difference(now);

  if (difference.isNegative) {
    // Past
    final absDiff = difference.abs();
    if (absDiff.inDays > 0) {
      return '${absDiff.inDays} day${absDiff.inDays == 1 ? '' : 's'} ago';
    } else if (absDiff.inHours > 0) {
      return '${absDiff.inHours} hour${absDiff.inHours == 1 ? '' : 's'} ago';
    } else if (absDiff.inMinutes > 0) {
      return '${absDiff.inMinutes} minute${absDiff.inMinutes == 1 ? '' : 's'} ago';
    } else {
      return 'just now';
    }
  } else {
    // Future
    if (difference.inDays > 0) {
      return 'in ${difference.inDays} day${difference.inDays == 1 ? '' : 's'}';
    } else if (difference.inHours > 0) {
      return 'in ${difference.inHours} hour${difference.inHours == 1 ? '' : 's'}';
    } else if (difference.inMinutes > 0) {
      return 'in ${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'}';
    } else {
      return 'just now';
    }
  }
}

/// Get the timezone-aware date for a given date at a specific hour in a timezone.
tz.TZDateTime getTzDateTimeAtHour(
  DateTime date,
  int hour, {
  required tz.Location location,
}) {
  final localDate = tz.TZDateTime(location, date.year, date.month, date.day, hour);
  return localDate;
}

/// Convert a UTC date to a timezone-aware date at midnight.
tz.TZDateTime utcToTzMidnight(DateTime utcDate, tz.Location location) {
  return tz.TZDateTime.from(utcDate, location);
}

/// Get the current date in a specific timezone.
DateTime getCurrentDateInTimezone(tz.Location location) {
  return tz.TZDateTime.now(location);
}

/// Parse a date string in ISO format (yyyy-MM-dd).
DateTime? parseIsoDate(String? value) {
  if (value == null || value.isEmpty) return null;
  try {
    return DateTime.parse(value);
  } catch (_) {
    return null;
  }
}

/// Format a date as ISO string (yyyy-MM-dd).
String formatIsoDate(DateTime date) {
  return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
}