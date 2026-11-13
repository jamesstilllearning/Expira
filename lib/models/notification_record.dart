import 'package:flutter/foundation.dart';

import '../services/reminder_planner.dart';

/// A record of a notification that was sent, stored locally for the notification center.
@immutable
class NotificationRecord {
  const NotificationRecord({
    required this.id,
    required this.itemId,
    required this.itemName,
    required this.itemCategory,
    required this.expiryDate,
    required this.daysBefore,
    required this.title,
    required this.body,
    required this.triggeredAt,
    required this.isRead,
    this.deletedAt,
  });

  /// Unique identifier for this notification record
  final String id;

  /// The item this notification is about
  final String itemId;
  final String itemName;
  final String itemCategory;
  final DateTime expiryDate;

  /// Days before expiry when this was triggered (0 = on expiry day)
  final int daysBefore;

  /// Notification content
  final String title;
  final String body;

  /// When the notification was actually triggered/shown
  final DateTime triggeredAt;

  /// Whether the user has read this notification
  final bool isRead;

  /// When the notification was deleted (soft delete)
  final DateTime? deletedAt;

  /// Create from a PlannedReminder
  factory NotificationRecord.fromPlannedReminder(
    PlannedReminder reminder, {
    bool isRead = false,
  }) {
    return NotificationRecord(
      id: 'reminder_${reminder.id}',
      itemId: reminder.itemId,
      itemName: reminder.itemName,
      itemCategory: reminder.itemCategory,
      expiryDate: reminder.expiryDate,
      daysBefore: reminder.daysBefore,
      title: reminder.title,
      body: reminder.body,
      triggeredAt: reminder.triggerAt,
      isRead: isRead,
    );
  }

  /// Days remaining at the time of notification
  int get daysRemaining => daysBefore;

  /// Whether this notification is for the expiry day
  bool get isExpiryDay => daysBefore == 0;

  /// Formatted expiry date for display
  String get formattedExpiryDate {
    return '${expiryDate.month}/${expiryDate.day}/${expiryDate.year}';
  }

  /// Formatted trigger time for display
  String get formattedTriggerTime {
    return '${triggeredAt.hour.toString().padLeft(2, '0')}:${triggeredAt.minute.toString().padLeft(2, '0')}';
  }

  NotificationRecord copyWith({
    String? id,
    String? itemId,
    String? itemName,
    String? itemCategory,
    DateTime? expiryDate,
    int? daysBefore,
    String? title,
    String? body,
    DateTime? triggeredAt,
    bool? isRead,
    DateTime? deletedAt,
  }) {
    return NotificationRecord(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      itemName: itemName ?? this.itemName,
      itemCategory: itemCategory ?? this.itemCategory,
      expiryDate: expiryDate ?? this.expiryDate,
      daysBefore: daysBefore ?? this.daysBefore,
      title: title ?? this.title,
      body: body ?? this.body,
      triggeredAt: triggeredAt ?? this.triggeredAt,
      isRead: isRead ?? this.isRead,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'itemId': itemId,
        'itemName': itemName,
        'itemCategory': itemCategory,
        'expiryDate': expiryDate.toIso8601String(),
        'daysBefore': daysBefore,
        'title': title,
        'body': body,
        'triggeredAt': triggeredAt.toIso8601String(),
        'isRead': isRead,
        'deletedAt': deletedAt?.toIso8601String(),
      };

  factory NotificationRecord.fromJson(Map<String, dynamic> json) =>
      NotificationRecord(
        id: json['id'] as String,
        itemId: json['itemId'] as String,
        itemName: json['itemName'] as String,
        itemCategory: json['itemCategory'] as String,
        expiryDate: DateTime.parse(json['expiryDate'] as String),
        daysBefore: json['daysBefore'] as int,
        title: json['title'] as String,
        body: json['body'] as String,
        triggeredAt: DateTime.parse(json['triggeredAt'] as String),
        isRead: json['isRead'] as bool? ?? false,
        deletedAt: json['deletedAt'] == null
            ? null
            : DateTime.parse(json['deletedAt'] as String),
      );
}

/// Filter options for the notification center
enum NotificationFilter {
  all,
  unread,
  read,
  expiryDay,
  upcoming,
}