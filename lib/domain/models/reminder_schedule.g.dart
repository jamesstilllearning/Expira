// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReminderScheduleItemImpl _$$ReminderScheduleItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ReminderScheduleItemImpl(
      daysBefore: (json['daysBefore'] as num?)?.toInt() ?? 1,
      enabled: json['enabled'] as bool? ?? true,
      label: json['label'] as String? ?? '',
    );

Map<String, dynamic> _$$ReminderScheduleItemImplToJson(
        _$ReminderScheduleItemImpl instance) =>
    <String, dynamic>{
      'daysBefore': instance.daysBefore,
      'enabled': instance.enabled,
      'label': instance.label,
    };
