import '../data/daily_messages.dart';

/// Picks the message for [date]'s calendar day. The same day always gives the
/// same message, so it holds through rebuilds, tab switches, and restarts, and
/// it changes when the date changes. Nothing is stored and nothing is random.
String dailyMessageFor(
  DateTime date, {
  List<String> messages = dailyInspirationMessages,
}) {
  assert(messages.isNotEmpty, 'At least one message is required.');
  // Count whole days using UTC so daylight saving changes can't shift the result.
  final dayNumber = DateTime.utc(date.year, date.month, date.day)
      .difference(DateTime.utc(2000))
      .inDays;
  final index =
      ((dayNumber % messages.length) + messages.length) % messages.length;
  return messages[index];
}
