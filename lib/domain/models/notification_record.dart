import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_record.freezed.dart';
part 'notification_record.g.dart';

/// Notification record for history.
@freezed
abstract class NotificationRecord with _$NotificationRecord {
  const NotificationRecord._();

  const factory NotificationRecord({
    /// Unique ID
    @Default('') String id,

    /// Notification type
    @Default(NotificationType.expiryReminder()) NotificationType type,

    /// Item ID (if related to an item)
    @Default('') String itemId,

    /// Item name (denormalized)
    @Default('') String itemName,

    /// Title
    @Default('') String title,

    /// Body message
    @Default('') String body,

    /// Whether read
    @Default(false) bool read,

    /// Timestamp
    required DateTime timestamp,

    /// Payload data (JSON)
    @Default({}) Map<String, dynamic> payload,
  }) = _NotificationRecord;

  factory NotificationRecord.fromJson(Map<String, dynamic> json) => _$NotificationRecordFromJson(json);
}

/// Notification type.
@freezed
abstract class NotificationType with _$NotificationType {
  const NotificationType._();

  const factory NotificationType.expiryReminder() = ExpiryReminder;
  const factory NotificationType.itemExpired() = ItemExpired;
  const factory NotificationType.itemUsed() = ItemUsed;
  const factory NotificationType.householdInvite() = HouseholdInvite;
  const factory NotificationType.settingsChanged() = SettingsChanged;

  factory NotificationType.fromJson(Map<String, dynamic> json) => _$NotificationTypeFromJson(json);
}

/// Notification filter for the notification center.
@freezed
abstract class NotificationFilter with _$NotificationFilter {
  const NotificationFilter._();

  const factory NotificationFilter.all() = All;
  const factory NotificationFilter.unread() = Unread;
  const factory NotificationFilter.read() = Read;
  const factory NotificationFilter.expiryDay() = ExpiryDay;
  const factory NotificationFilter.upcoming() = Upcoming;

  factory NotificationFilter.fromJson(Map<String, dynamic> json) => _$NotificationFilterFromJson(json);

  String get label => switch (this) {
        All() => 'All',
        Unread() => 'Unread',
        Read() => 'Read',
        ExpiryDay() => 'Expiry Day',
        Upcoming() => 'Upcoming',
        _ => 'Unknown',
      };
}