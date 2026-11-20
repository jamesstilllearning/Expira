import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'expiry_status.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

/// Reminder schedule item.
@JsonSerializable()
class ReminderScheduleItem {
  const ReminderScheduleItem({
    this.daysBefore = 0,
    this.enabled = true,
    this.label = '',
  });

  final int daysBefore;
  final bool enabled;
  final String label;

  factory ReminderScheduleItem.fromJson(Map<String, dynamic> json) =>
      _$ReminderScheduleItemFromJson(json);

  Map<String, dynamic> toJson() => _$ReminderScheduleItemToJson(this);

  /// Default reminder schedule (day of, 1 day before, 3 days before, 7 days before).
  static List<ReminderScheduleItem> get defaultSchedule => [
        const ReminderScheduleItem(daysBefore: 0, enabled: true, label: 'Today'),
        const ReminderScheduleItem(daysBefore: 1, enabled: true, label: 'Tomorrow'),
        const ReminderScheduleItem(daysBefore: 3, enabled: true, label: '3 days'),
        const ReminderScheduleItem(daysBefore: 7, enabled: true, label: '1 week'),
      ];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReminderScheduleItem &&
          runtimeType == other.runtimeType &&
          daysBefore == other.daysBefore &&
          enabled == other.enabled &&
          label == other.label;

  @override
  int get hashCode => Object.hash(daysBefore, enabled, label);

  @override
  String toString() =>
      'ReminderScheduleItem(daysBefore: $daysBefore, enabled: $enabled, label: $label)';

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
}

/// Expiry thresholds for strict vs relaxed mode.
@JsonSerializable()
class ExpiryThresholds {
  const ExpiryThresholds({
    this.expiringDays = 2,
    this.soonDays = 7,
  });

  final int expiringDays;
  final int soonDays;

  factory ExpiryThresholds.fromJson(Map<String, dynamic> json) =>
      _$ExpiryThresholdsFromJson(json);

  Map<String, dynamic> toJson() => _$ExpiryThresholdsToJson(this);

  /// Strict thresholds (default).
  static const ExpiryThresholds strict = ExpiryThresholds(expiringDays: 2, soonDays: 7);

  /// Relaxed thresholds.
  static const ExpiryThresholds relaxed = ExpiryThresholds(expiringDays: 1, soonDays: 3);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpiryThresholds &&
          runtimeType == other.runtimeType &&
          expiringDays == other.expiringDays &&
          soonDays == other.soonDays;

  @override
  int get hashCode => Object.hash(expiringDays, soonDays);

  @override
  String toString() => 'ExpiryThresholds(expiringDays: $expiringDays, soonDays: $soonDays)';

  ExpiryThresholds copyWith({
    int? expiringDays,
    int? soonDays,
  }) {
    return ExpiryThresholds(
      expiringDays: expiringDays ?? this.expiringDays,
      soonDays: soonDays ?? this.soonDays,
    );
  }
}

/// User-specific settings (theme, preferences).
@JsonSerializable()
class UserSettings {
  const UserSettings({
    this.darkMode = false,
    this.locale = 'en_US',
    this.autoFlashlight = false,
    this.celebrationEffects = true,
  });

  final bool darkMode;
  final String locale;
  final bool autoFlashlight;
  final bool celebrationEffects;

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$UserSettingsToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserSettings &&
          runtimeType == other.runtimeType &&
          darkMode == other.darkMode &&
          locale == other.locale &&
          autoFlashlight == other.autoFlashlight &&
          celebrationEffects == other.celebrationEffects;

  @override
  int get hashCode => Object.hash(darkMode, locale, autoFlashlight, celebrationEffects);

  @override
  String toString() =>
      'UserSettings(darkMode: $darkMode, locale: $locale, autoFlashlight: $autoFlashlight, celebrationEffects: $celebrationEffects)';

  UserSettings copyWith({
    bool? darkMode,
    String? locale,
    bool? autoFlashlight,
    bool? celebrationEffects,
  }) {
    return UserSettings(
      darkMode: darkMode ?? this.darkMode,
      locale: locale ?? this.locale,
      autoFlashlight: autoFlashlight ?? this.autoFlashlight,
      celebrationEffects: celebrationEffects ?? this.celebrationEffects,
    );
  }
}

/// Household-level settings (shared among members).
@JsonSerializable()
class HouseholdSettings {
  const HouseholdSettings({
    this.thresholds = ExpiryThresholds.strict,
    this.remindersEnabled = true,
    this.reminderSchedule = const [],
    this.reminderHour = 9,
    this.timezone = 'UTC',
  });

  final ExpiryThresholds thresholds;
  final bool remindersEnabled;
  final List<ReminderScheduleItem> reminderSchedule;
  final int reminderHour;
  final String timezone;

  factory HouseholdSettings.fromJson(Map<String, dynamic> json) =>
      _$HouseholdSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$HouseholdSettingsToJson(this);

  /// Returns the default reminder schedule if empty.
  List<ReminderScheduleItem> get effectiveReminderSchedule =>
      reminderSchedule.isEmpty ? ReminderScheduleItem.defaultSchedule : reminderSchedule;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HouseholdSettings &&
          runtimeType == other.runtimeType &&
          thresholds == other.thresholds &&
          remindersEnabled == other.remindersEnabled &&
          reminderSchedule == other.reminderSchedule &&
          reminderHour == other.reminderHour &&
          timezone == other.timezone;

  @override
  int get hashCode => Object.hash(
        thresholds,
        remindersEnabled,
        reminderSchedule,
        reminderHour,
        timezone,
      );

  @override
  String toString() =>
      'HouseholdSettings(thresholds: $thresholds, remindersEnabled: $remindersEnabled, reminderHour: $reminderHour, timezone: $timezone)';

  HouseholdSettings copyWith({
    ExpiryThresholds? thresholds,
    bool? remindersEnabled,
    List<ReminderScheduleItem>? reminderSchedule,
    int? reminderHour,
    String? timezone,
  }) {
    return HouseholdSettings(
      thresholds: thresholds ?? this.thresholds,
      remindersEnabled: remindersEnabled ?? this.remindersEnabled,
      reminderSchedule: reminderSchedule ?? this.reminderSchedule,
      reminderHour: reminderHour ?? this.reminderHour,
      timezone: timezone ?? this.timezone,
    );
  }
}

/// Combined settings for backward compatibility.
@freezed
abstract class AppSettings with _$AppSettings {
  const AppSettings._();

  const factory AppSettings({
    @Default(HouseholdSettings()) HouseholdSettings householdSettings,
    @Default(UserSettings()) UserSettings userSettings,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);

  /// Convenience getters
  ExpiryThresholds get thresholds => householdSettings.thresholds;
  bool get remindersEnabled => householdSettings.remindersEnabled;
  List<ReminderScheduleItem> get reminderSchedule => householdSettings.effectiveReminderSchedule;
  int get reminderHour => householdSettings.reminderHour;
  String get timezone => householdSettings.timezone;
  bool get darkMode => userSettings.darkMode;
  bool get autoFlashlight => userSettings.autoFlashlight;
  bool get celebrationEffects => userSettings.celebrationEffects;
  String get locale => userSettings.locale;
}