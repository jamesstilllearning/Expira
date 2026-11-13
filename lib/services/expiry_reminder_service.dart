import 'package:flutter/foundation.dart';

import '../models/app_settings.dart';
import '../models/food_item.dart';
import '../models/notification_record.dart';
import 'notification_storage.dart';
import 'reminder_planner.dart';

/// The platform side of reminders. Implemented by [NotificationService], and
/// replaced with a fake in tests.
abstract interface class ReminderGateway {
  Future<void> schedule(PlannedReminder reminder);
  Future<void> cancelAll();
}

/// Keeps pending reminders in step with the inventory. Every sync rebuilds the
/// whole set, so creates, date changes, deletes, and "used" actions all end in
/// the same state, and duplicates cannot pile up. Syncs run one at a time.
class ExpiryReminderService {
  ExpiryReminderService(
    this._gateway,
    this._notificationStorage, {
    void Function(String message)? log,
  }) : _log = log ?? debugPrint;

  final ReminderGateway _gateway;
  final NotificationStorage _notificationStorage;
  final void Function(String message) _log;
  Future<void> _queue = Future<void>.value();

  Future<void> sync({
    required List<FoodItem> items,
    required AppSettings settings,
    DateTime? now,
  }) {
    final run =
        _queue.then((_) => _replan(items, settings, now ?? DateTime.now()));
    _queue = run.then<void>((_) {}, onError: (Object error) {
      _log('Expiry reminder sync failed: $error');
    });
    return _queue;
  }

  Future<void> _replan(
      List<FoodItem> items, AppSettings settings, DateTime now) async {
    await _gateway.cancelAll();
    if (!settings.remindersEnabled) return;

    for (final item in items) {
      final reminders = ReminderPlanner.plan(
        item: item,
        settings: settings,
        now: now,
      );
      for (final reminder in reminders) {
        try {
          await _gateway.schedule(reminder);
          // Store in notification history
          await _notificationStorage.addNotification(
            NotificationRecord.fromPlannedReminder(reminder),
          );
        } catch (error) {
          _log('Could not schedule reminder ${reminder.id}: $error');
        }
      }
    }
  }
}