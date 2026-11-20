// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReminderScheduleItem _$ReminderScheduleItemFromJson(
        Map<String, dynamic> json) =>
    ReminderScheduleItem(
      daysBefore: (json['daysBefore'] as num?)?.toInt() ?? 0,
      enabled: json['enabled'] as bool? ?? true,
      label: json['label'] as String? ?? '',
    );

Map<String, dynamic> _$ReminderScheduleItemToJson(
        ReminderScheduleItem instance) =>
    <String, dynamic>{
      'daysBefore': instance.daysBefore,
      'enabled': instance.enabled,
      'label': instance.label,
    };

ExpiryThresholds _$ExpiryThresholdsFromJson(Map<String, dynamic> json) =>
    ExpiryThresholds(
      expiringDays: (json['expiringDays'] as num?)?.toInt() ?? 2,
      soonDays: (json['soonDays'] as num?)?.toInt() ?? 7,
    );

Map<String, dynamic> _$ExpiryThresholdsToJson(ExpiryThresholds instance) =>
    <String, dynamic>{
      'expiringDays': instance.expiringDays,
      'soonDays': instance.soonDays,
    };

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) => UserSettings(
      darkMode: json['darkMode'] as bool? ?? false,
      locale: json['locale'] as String? ?? 'en_US',
      autoFlashlight: json['autoFlashlight'] as bool? ?? false,
      celebrationEffects: json['celebrationEffects'] as bool? ?? true,
    );

Map<String, dynamic> _$UserSettingsToJson(UserSettings instance) =>
    <String, dynamic>{
      'darkMode': instance.darkMode,
      'locale': instance.locale,
      'autoFlashlight': instance.autoFlashlight,
      'celebrationEffects': instance.celebrationEffects,
    };

HouseholdSettings _$HouseholdSettingsFromJson(Map<String, dynamic> json) =>
    HouseholdSettings(
      thresholds: json['thresholds'] == null
          ? ExpiryThresholds.strict
          : ExpiryThresholds.fromJson(
              json['thresholds'] as Map<String, dynamic>),
      remindersEnabled: json['remindersEnabled'] as bool? ?? true,
      reminderSchedule: (json['reminderSchedule'] as List<dynamic>?)
              ?.map((e) =>
                  ReminderScheduleItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      reminderHour: (json['reminderHour'] as num?)?.toInt() ?? 9,
      timezone: json['timezone'] as String? ?? 'UTC',
    );

Map<String, dynamic> _$HouseholdSettingsToJson(HouseholdSettings instance) =>
    <String, dynamic>{
      'thresholds': instance.thresholds,
      'remindersEnabled': instance.remindersEnabled,
      'reminderSchedule': instance.reminderSchedule,
      'reminderHour': instance.reminderHour,
      'timezone': instance.timezone,
    };

_$AppSettingsImpl _$$AppSettingsImplFromJson(Map<String, dynamic> json) =>
    _$AppSettingsImpl(
      householdSettings: json['householdSettings'] == null
          ? const HouseholdSettings()
          : HouseholdSettings.fromJson(
              json['householdSettings'] as Map<String, dynamic>),
      userSettings: json['userSettings'] == null
          ? const UserSettings()
          : UserSettings.fromJson(json['userSettings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppSettingsImplToJson(_$AppSettingsImpl instance) =>
    <String, dynamic>{
      'householdSettings': instance.householdSettings,
      'userSettings': instance.userSettings,
    };
