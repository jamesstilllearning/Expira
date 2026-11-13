import 'package:flutter/material.dart';

import '../models/app_settings.dart';
import '../models/food_item.dart';

@immutable
class PlannedReminder {
  const PlannedReminder({
    required this.id,
    required this.triggerAt,
    required this.title,
    required this.body,
    required this.itemId,
    required this.itemName,
    required this.itemCategory,
    required this.expiryDate,
    required this.daysBefore,
    this.payload,
  });

  final int id;
  final DateTime triggerAt;
  final String title;
  final String body;
  final String itemId;
  final String itemName;
  final String itemCategory;
  final DateTime expiryDate;
  final int daysBefore;
  final Map<String, dynamic>? payload;
}

/// Stable notification IDs derived from an item ID. Uses FNV-1a rather than
/// [Object.hashCode], which Dart does not keep the same across app launches.
abstract final class ReminderIds {
  /// Base hash for an item, multiplied to create space for multiple reminder types
  static int _baseHash(String itemId) {
    var hash = 0x811c9dc5;
    for (final unit in itemId.codeUnits) {
      hash ^= unit;
      hash = (hash * 0x01000193) & 0xFFFFFFFF;
    }
    return (hash & 0x3FFFFFFF) * 4; // *4 to accommodate up to 4 reminder types
  }

  /// Get notification ID for a specific reminder schedule item
  static int forItem(String itemId, int scheduleIndex) {
    return _baseHash(itemId) + scheduleIndex;
  }
}

/// Turns one item into the reminders that should be pending for it based on
/// the configured reminder schedule in AppSettings.
abstract final class ReminderPlanner {
  static List<PlannedReminder> plan({
    required FoodItem item,
    required AppSettings settings,
    required DateTime now,
  }) {
    if (!settings.remindersEnabled) return const [];

    final today = DateUtils.dateOnly(now);
    final expiry = DateUtils.dateOnly(item.expiryDate);
    final daysLeft = expiry.difference(today).inDays;
    if (daysLeft < 0) return const [];

    final reminders = <PlannedReminder>[];
    final enabledReminders = settings.enabledReminders;

    for (var i = 0; i < enabledReminders.length; i++) {
      final scheduleItem = enabledReminders[i];
      final daysBefore = scheduleItem.daysBefore;
      final triggerDay = expiry.subtract(Duration(days: daysBefore));
      final triggerAt = _at(triggerDay, settings.reminderHour);

      // Only schedule if trigger time is in the future
      if (!triggerAt.isAfter(now)) continue;

      // For expiry day (daysBefore=0), we only want to notify if not already expired
      if (daysBefore == 0 && daysLeft < 0) continue;

      final id = ReminderIds.forItem(item.id, i);
      final isExpiryDay = daysBefore == 0;

      reminders.add(PlannedReminder(
        id: id,
        triggerAt: triggerAt,
        title: isExpiryDay ? '${item.name} expires today' : '${item.name} expires soon',
        body: _buildBody(item, daysBefore, isExpiryDay),
        itemId: item.id,
        itemName: item.name,
        itemCategory: item.category,
        expiryDate: item.expiryDate,
        daysBefore: daysBefore,
        payload: {
          'itemId': item.id,
          'itemName': item.name,
          'itemCategory': item.category,
          'expiryDate': item.expiryDate.toIso8601String(),
          'daysBefore': daysBefore,
          'triggerAt': triggerAt.toIso8601String(),
        },
      ));
    }
    return reminders;
  }

  static String _buildBody(FoodItem item, int daysBefore, bool isExpiryDay) {
    if (isExpiryDay) {
      return 'Expires today. Use it to avoid waste.';
    }
    final dayText = daysBefore == 1 ? 'day' : 'days';
    return 'Expires in $daysBefore $dayText (${_formatDate(item.expiryDate)}). Plan to use it.';
  }

  static String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }

  static DateTime _at(DateTime day, int hour) =>
      DateTime(day.year, day.month, day.day, hour);
}
