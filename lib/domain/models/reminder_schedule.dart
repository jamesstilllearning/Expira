import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder_schedule.freezed.dart';
part 'reminder_schedule.g.dart';

/// Reminder schedule item.
@freezed
sealed class ReminderScheduleItem with _$ReminderScheduleItem {
  const ReminderScheduleItem._();

  const factory ReminderScheduleItem({
    /// Days before expiry to notify
    @Default(1) int daysBefore,

    /// Whether this reminder is enabled
    @Default(true) bool enabled,

    /// Custom label (optional)
    @Default('') String label,
  }) = _ReminderScheduleItem;

  factory ReminderScheduleItem.fromJson(Map<String, dynamic> json) =>
      _$ReminderScheduleItemFromJson(json);
}

/// Default reminder schedule.
const List<ReminderScheduleItem> defaultReminderSchedule = [
  ReminderScheduleItem(daysBefore: 7, enabled: true, label: '1 week before'),
  ReminderScheduleItem(daysBefore: 3, enabled: true, label: '3 days before'),
  ReminderScheduleItem(daysBefore: 1, enabled: true, label: '1 day before'),
  ReminderScheduleItem(daysBefore: 0, enabled: true, label: 'On expiry day'),
];