import 'package:expira/domain/models/app_settings.dart' as domain;
import 'package:expira/domain/models/app_settings.dart' show ExpiryThresholds;
import 'package:expira/models/app_settings.dart' as legacy;
import 'package:expira/models/food_item.dart' as legacy_food;

/// Mapper to convert between domain and legacy AppSettings models.
class SettingsMapper {
  SettingsMapper._();

  /// Converts a legacy AppSettings to a domain AppSettings.
  static domain.AppSettings toDomain(legacy.AppSettings legacy) {
    return domain.AppSettings(
      householdSettings: _toDomainHouseholdSettings(legacy),
      userSettings: _toDomainUserSettings(legacy),
    );
  }

  /// Converts a domain AppSettings to a legacy AppSettings.
  static legacy.AppSettings toLegacy(domain.AppSettings domain) {
    final thresholds = domain.householdSettings.thresholds;
    final isStrict = thresholds.expiringDays == ExpiryThresholds.strict.expiringDays &&
        thresholds.soonDays == ExpiryThresholds.strict.soonDays;

    return legacy.AppSettings(
      autoFlashlight: domain.userSettings.autoFlashlight,
      celebrationEffects: domain.userSettings.celebrationEffects,
      strictThresholds: isStrict,
      darkMode: domain.userSettings.darkMode,
      remindersEnabled: domain.householdSettings.remindersEnabled,
      reminderSchedule: _toLegacyReminderSchedule(domain.householdSettings.reminderSchedule),
      reminderHour: domain.householdSettings.reminderHour,
    );
  }

  static domain.HouseholdSettings _toDomainHouseholdSettings(legacy.AppSettings legacy) {
    return domain.HouseholdSettings(
      thresholds: _toDomainThresholds(legacy.thresholds),
      remindersEnabled: legacy.remindersEnabled,
      reminderSchedule: _toDomainReminderSchedule(legacy.reminderSchedule),
      reminderHour: legacy.reminderHour,
      timezone: 'UTC', // Legacy doesn't have timezone
    );
  }

  static domain.ExpiryThresholds _toDomainThresholds(legacy_food.ExpiryThresholds legacy) {
    // Compare by values since legacy doesn't override ==
    if (legacy.expiringWithinDays == legacy_food.ExpiryThresholds.strict.expiringWithinDays &&
        legacy.soonWithinDays == legacy_food.ExpiryThresholds.strict.soonWithinDays) {
      return ExpiryThresholds.strict;
    } else if (legacy.expiringWithinDays == legacy_food.ExpiryThresholds.relaxed.expiringWithinDays &&
        legacy.soonWithinDays == legacy_food.ExpiryThresholds.relaxed.soonWithinDays) {
      return ExpiryThresholds.relaxed;
    }
    // Custom thresholds - map based on values
    return ExpiryThresholds(
      expiringDays: legacy.expiringWithinDays,
      soonDays: legacy.soonWithinDays,
    );
  }

  static domain.UserSettings _toDomainUserSettings(legacy.AppSettings legacy) {
    return domain.UserSettings(
      darkMode: legacy.darkMode,
      locale: 'en_US',
      autoFlashlight: legacy.autoFlashlight,
      celebrationEffects: legacy.celebrationEffects,
    );
  }

  static List<domain.ReminderScheduleItem> _toDomainReminderSchedule(
    List<legacy.ReminderScheduleItem> legacy,
  ) {
    return legacy.map((item) => domain.ReminderScheduleItem(
      daysBefore: item.daysBefore,
      enabled: item.enabled,
      label: item.label ?? '',
    )).toList();
  }

  static List<legacy.ReminderScheduleItem> _toLegacyReminderSchedule(
    List<domain.ReminderScheduleItem> domain,
  ) {
    return domain.map((item) => legacy.ReminderScheduleItem(
      daysBefore: item.daysBefore,
      enabled: item.enabled,
      label: item.label.isEmpty ? null : item.label,
    )).toList();
  }
}