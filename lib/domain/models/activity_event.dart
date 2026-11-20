import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'activity_event.freezed.dart';
part 'activity_event.g.dart';

/// Activity event types.
@freezed
abstract class ActivityType with _$ActivityType {
  const ActivityType._();

  const factory ActivityType.itemAdded() = ItemAdded;
  const factory ActivityType.itemUpdated() = ItemUpdated;
  const factory ActivityType.itemUsed() = ItemUsed;
  const factory ActivityType.itemExpired() = ItemExpired;
  const factory ActivityType.itemDeleted() = ItemDeleted;
  const factory ActivityType.memberJoined() = MemberJoined;
  const factory ActivityType.memberLeft() = MemberLeft;
  const factory ActivityType.memberRoleChanged() = MemberRoleChanged;
  const factory ActivityType.settingsChanged() = SettingsChanged;
  const factory ActivityType.householdCreated() = HouseholdCreated;

  factory ActivityType.fromJson(Map<String, dynamic> json) => _$ActivityTypeFromJson(json);
}

/// Activity event for audit log.
@freezed
abstract class ActivityEvent with _$ActivityEvent {
  const ActivityEvent._();

  const factory ActivityEvent({
    /// Unique event ID
    @Default('') String id,

    /// Household ID
    @Default('') String householdId,

    /// Event type
    required ActivityType type,

    /// Actor user ID
    @Default('') String actorUid,

    /// Actor display name
    @Default('') String actorName,

    /// Event payload (structured data)
    @Default({}) Map<String, dynamic> payload,

    /// Timestamp
    required DateTime timestamp,

    /// Server document ID
    @Default('') String serverId,
  }) = _ActivityEvent;

  factory ActivityEvent.fromJson(Map<String, dynamic> json) => _$ActivityEventFromJson(json);
}