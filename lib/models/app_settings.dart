import 'package:flutter/foundation.dart';

import 'food_item.dart';

/// Configuration for a single reminder in the notification schedule.
@immutable
class ReminderScheduleItem {
  const ReminderScheduleItem({
    required this.daysBefore,
    required this.enabled,
    this.label,
  });

  /// Days before expiry (0 = on expiry day, 1 = 1 day before, etc.)
  final int daysBefore;

  /// Whether this reminder is active
  final bool enabled;

  /// Optional custom label for the reminder
  final String? label;

  /// Default schedule: 7 days, 3 days, 1 day, and on expiry day
  static const List<ReminderScheduleItem> defaults = [
    ReminderScheduleItem(daysBefore: 7, enabled: true, label: '1 week before'),
    ReminderScheduleItem(daysBefore: 3, enabled: true, label: '3 days before'),
    ReminderScheduleItem(daysBefore: 1, enabled: true, label: '1 day before'),
    ReminderScheduleItem(daysBefore: 0, enabled: true, label: 'On expiry day'),
  ];

  ReminderScheduleItem copyWith({
    int? daysBefore,
    bool? enabled,
    String? label,
  }) {
    return ReminderScheduleItem(
      daysBefore: daysBefore ?? this.daysBefore,
      enabled: enabled ?? this.enabled,
      label: label ?? this.label,
    );
  }

  Map<String, dynamic> toJson() => {
        'daysBefore': daysBefore,
        'enabled': enabled,
        'label': label,
      };

  factory ReminderScheduleItem.fromJson(Map<String, dynamic> json) =>
      ReminderScheduleItem(
        daysBefore: json['daysBefore'] as int,
        enabled: json['enabled'] as bool? ?? true,
        label: json['label'] as String?,
      );
}

@immutable
class AppSettings {
  const AppSettings({
    this.autoFlashlight = false,
    this.celebrationEffects = true,
    this.strictThresholds = true,
    this.darkMode = false,
    this.remindersEnabled = false,
    this.reminderSchedule = ReminderScheduleItem.defaults,
    this.reminderHour = 9,
  });

  final bool autoFlashlight;
  final bool celebrationEffects;
  final bool strictThresholds;
  final bool darkMode;
  final bool remindersEnabled;

  /// Customizable reminder schedule - which days before expiry to notify
  final List<ReminderScheduleItem> reminderSchedule;

  /// Hour of day (0-23) when reminders should fire
  final int reminderHour;

  ExpiryThresholds get thresholds =>
      strictThresholds ? ExpiryThresholds.strict : ExpiryThresholds.relaxed;

  /// Get only enabled reminder schedule items
  List<ReminderScheduleItem> get enabledReminders =>
      reminderSchedule.where((r) => r.enabled).toList();

  AppSettings copyWith({
    bool? autoFlashlight,
    bool? celebrationEffects,
    bool? strictThresholds,
    bool? darkMode,
    bool? remindersEnabled,
    List<ReminderScheduleItem>? reminderSchedule,
    int? reminderHour,
  }) {
    return AppSettings(
      autoFlashlight: autoFlashlight ?? this.autoFlashlight,
      celebrationEffects: celebrationEffects ?? this.celebrationEffects,
      strictThresholds: strictThresholds ?? this.strictThresholds,
      darkMode: darkMode ?? this.darkMode,
      remindersEnabled: remindersEnabled ?? this.remindersEnabled,
      reminderSchedule: reminderSchedule ?? this.reminderSchedule,
      reminderHour: reminderHour ?? this.reminderHour,
    );
  }

  Map<String, dynamic> toJson() => {
        'autoFlashlight': autoFlashlight,
        'celebrationEffects': celebrationEffects,
        'strictThresholds': strictThresholds,
        'darkMode': darkMode,
        'remindersEnabled': remindersEnabled,
        'reminderSchedule': reminderSchedule.map((r) => r.toJson()).toList(),
        'reminderHour': reminderHour,
      };

  factory AppSettings.fromJson(Map<String, dynamic> json) => AppSettings(
        autoFlashlight: json['autoFlashlight'] as bool? ?? false,
        celebrationEffects: json['celebrationEffects'] as bool? ?? true,
        strictThresholds: json['strictThresholds'] as bool? ?? true,
        darkMode: json['darkMode'] as bool? ?? false,
        remindersEnabled: json['remindersEnabled'] as bool? ?? false,
        reminderHour: json['reminderHour'] as int? ?? 9,
        reminderSchedule: (json['reminderSchedule'] as List?)
                ?.map((e) => ReminderScheduleItem.fromJson(e as Map<String, dynamic>))
                .toList() ??
            ReminderScheduleItem.defaults,
      );
}
