import 'package:expira/models/app_settings.dart';
import 'package:expira/models/food_item.dart';
import 'package:expira/models/notification_record.dart';
import 'package:expira/services/expiry_reminder_service.dart';
import 'package:expira/services/notification_storage.dart';
import 'package:expira/services/reminder_planner.dart';
import 'package:flutter_test/flutter_test.dart';

final _now = DateTime(2030, 6, 1, 8);

FoodItem _item(String id, DateTime expiry) => FoodItem(
      id: id,
      name: 'Milk',
      category: 'Fridge',
      expiryDate: expiry,
    );

class FakeGateway implements ReminderGateway {
  final List<PlannedReminder> pending = [];
  final Set<int> failingIds = {};
  int cancelAllCalls = 0;

  @override
  Future<void> schedule(PlannedReminder reminder) async {
    if (failingIds.contains(reminder.id)) throw StateError('platform rejected');
    pending.add(reminder);
  }

  @override
  Future<void> cancelAll() async {
    cancelAllCalls++;
    pending.clear();
  }
}

class FakeNotificationStorage implements NotificationStorage {
  @override
  Future<void> addNotification(NotificationRecord notification) async {}

  @override
  Future<void> clearAll() async {}

  @override
  Future<void> deleteNotification(String id) async {}

  @override
  Future<List<NotificationRecord>> getFiltered(
    NotificationFilter filter, {
    DateTime? since,
  }) async => [];

  @override
  Future<int> getUnreadCount() async => 0;

  @override
  Future<List<NotificationRecord>> loadAll() async => [];

  @override
  Future<void> markAsRead(String id) async {}

  @override
  Future<void> markAsUnread(String id) async {}

  @override
  Future<void> saveAll(List<NotificationRecord> notifications) async {}
}

void main() {
  final expiry = DateTime(2030, 6, 11);

  group('ReminderPlanner', () {
    test('default schedule creates reminders at 7, 3, 1, 0 days before expiry',
        () {
      const settings = AppSettings(remindersEnabled: true);
      final plan = ReminderPlanner.plan(
        item: _item('a', expiry),
        settings: settings,
        now: _now,
      );

      // Default schedule: 7, 3, 1, 0 days before
      // Expiry: June 11, Now: June 1 8am
      // 7 days before = June 4, 3 days = June 8, 1 day = June 10, 0 day = June 11
      // All are after June 1 8am, so all 4 should be scheduled
      expect(plan.length, 4);
      expect(plan[0].triggerAt, DateTime(2030, 6, 4, 9));
      expect(plan[1].triggerAt, DateTime(2030, 6, 8, 9));
      expect(plan[2].triggerAt, DateTime(2030, 6, 10, 9));
      expect(plan[3].triggerAt, DateTime(2030, 6, 11, 9));
    });

    test('disabled reminders are not scheduled', () {
      const settings = AppSettings(
        remindersEnabled: true,
        reminderSchedule: [
          ReminderScheduleItem(daysBefore: 7, enabled: true),
          ReminderScheduleItem(daysBefore: 3, enabled: false), // disabled
          ReminderScheduleItem(daysBefore: 1, enabled: true),
          ReminderScheduleItem(daysBefore: 0, enabled: true),
        ],
      );
      final plan = ReminderPlanner.plan(
        item: _item('a', expiry),
        settings: settings,
        now: _now,
      );

      // Only 3 enabled reminders
      expect(plan.length, 3);
      expect(plan[0].triggerAt, DateTime(2030, 6, 4, 9)); // 7 days
      expect(plan[1].triggerAt, DateTime(2030, 6, 10, 9)); // 1 day
      expect(plan[2].triggerAt, DateTime(2030, 6, 11, 9)); // 0 day
    });

    test('reminders in the past are not scheduled', () {
      const settings = AppSettings(remindersEnabled: true);
      // Now is June 9 10am, so reminders for June 4 and June 8 have passed
      final plan = ReminderPlanner.plan(
        item: _item('a', expiry),
        settings: settings,
        now: DateTime(2030, 6, 9, 10),
      );

      // June 4 (7 days) and June 8 (3 days) are in the past
      // June 10 (1 day) and June 11 (0 day) are in the future
      expect(plan.length, 2);
      expect(plan[0].triggerAt, DateTime(2030, 6, 10, 9));
      expect(plan[1].triggerAt, DateTime(2030, 6, 11, 9));
    });

    test('expired items get no reminders', () {
      const settings = AppSettings(remindersEnabled: true);
      final plan = ReminderPlanner.plan(
        item: _item('a', DateTime(2030, 5, 30)), // expired before now
        settings: settings,
        now: _now,
      );
      expect(plan, isEmpty);
    });

    test('an item expiring today only gets a reminder before 9am', () {
      final item = _item('a', DateTime(2030, 6, 1)); // expires today
      const settings = AppSettings(remindersEnabled: true);

      // Before 9am - all future reminders should be scheduled
      final morning = ReminderPlanner.plan(
          item: item, settings: settings, now: _now);
      // Default schedule for today: 7 days before = May 25 (past), 3 days = May 29 (past),
      // 1 day = May 31 (past), 0 day = June 1 (today 9am - future)
      expect(morning.length, 1);
      expect(morning.single.triggerAt, DateTime(2030, 6, 1, 9));

      // After 9am - even the expiry day reminder has passed
      final afternoon = ReminderPlanner.plan(
        item: item,
        settings: settings,
        now: DateTime(2030, 6, 1, 10),
      );
      expect(afternoon, isEmpty);
    });

    test('notification IDs are stable per item and distinct across items', () {
      // With default schedule (4 enabled reminders), indices 0 and 3 are the first and last
      final firstSoon = ReminderIds.forItem('item-1', 0);
      final firstExpiry = ReminderIds.forItem('item-1', 3);
      final againSoon = ReminderIds.forItem('item-1', 0);
      final againExpiry = ReminderIds.forItem('item-1', 3);
      final otherSoon = ReminderIds.forItem('item-2', 0);

      expect(firstSoon, againSoon);
      expect(firstExpiry, againExpiry);
      expect(firstSoon, isNot(firstExpiry));
      expect(otherSoon, isNot(firstSoon));
      expect(firstSoon, isNonNegative);
    });
  });

  group('ExpiryReminderService', () {
    test('sync schedules every reminder for active items', () async {
      final gateway = FakeGateway();
      final storage = FakeNotificationStorage();
      final service = ExpiryReminderService(gateway, storage);

      await service.sync(
        items: [_item('a', expiry), _item('b', DateTime(2030, 6, 20))],
        settings: const AppSettings(remindersEnabled: true),
        now: _now,
      );

      // 2 items * 4 reminders each = 8
      expect(gateway.pending.length, 8);
    });

    test('disabled reminders cancel everything and schedule nothing', () async {
      final gateway = FakeGateway();
      final storage = FakeNotificationStorage();
      final service = ExpiryReminderService(gateway, storage);

      await service.sync(
        items: [_item('a', expiry)],
        settings: const AppSettings(remindersEnabled: false),
        now: _now,
      );

      expect(gateway.cancelAllCalls, 1);
      expect(gateway.pending, isEmpty);
    });

    test('repeated syncs do not duplicate notifications', () async {
      final gateway = FakeGateway();
      final storage = FakeNotificationStorage();
      final service = ExpiryReminderService(gateway, storage);
      final items = [_item('a', expiry)];
      const settings = AppSettings(remindersEnabled: true);

      await service.sync(items: items, settings: settings, now: _now);
      await service.sync(items: items, settings: settings, now: _now);

      // Should not duplicate - cancelAll called, then 4 reminders scheduled
      expect(gateway.pending.length, 4);
    });

    test('changing the expiry date replaces the old reminder times', () async {
      final gateway = FakeGateway();
      final storage = FakeNotificationStorage();
      final service = ExpiryReminderService(gateway, storage);
      const settings = AppSettings(remindersEnabled: true);

      await service
          .sync(items: [_item('a', expiry)], settings: settings, now: _now);
      await service.sync(
          items: [_item('a', DateTime(2030, 6, 20))],
          settings: settings,
          now: _now);

      // With default schedule (7, 3, 1, 0 days before) and expiry June 20:
      // June 13, June 17, June 19, June 20
      expect(gateway.pending.map((r) => r.triggerAt), [
        DateTime(2030, 6, 13, 9),
        DateTime(2030, 6, 17, 9),
        DateTime(2030, 6, 19, 9),
        DateTime(2030, 6, 20, 9),
      ]);
    });

    test('removing an item (delete or mark as used) cancels its reminders',
        () async {
      final gateway = FakeGateway();
      final storage = FakeNotificationStorage();
      final service = ExpiryReminderService(gateway, storage);
      const settings = AppSettings(remindersEnabled: true);

      await service.sync(
        items: [_item('a', expiry), _item('b', expiry)],
        settings: settings,
        now: _now,
      );
      await service
          .sync(items: [_item('b', expiry)], settings: settings, now: _now);

      // Only item-b's reminders remain (4 reminders)
      expect(gateway.pending.length, 4);
      expect(
          gateway.pending
              .every((r) => r.itemId == 'b'),
          isTrue);
    });

    test('changing reminder schedule reschedules reminders', () async {
      final gateway = FakeGateway();
      final storage = FakeNotificationStorage();
      final service = ExpiryReminderService(gateway, storage);
      final items = [_item('a', expiry)];

      // Start with default schedule (4 reminders)
      await service.sync(
        items: items,
        settings: const AppSettings(remindersEnabled: true),
        now: _now,
      );
      expect(gateway.pending.length, 4);

      // Switch to custom schedule with only 2 reminders
      await service.sync(
        items: items,
        settings: const AppSettings(
          remindersEnabled: true,
          reminderSchedule: [
            ReminderScheduleItem(daysBefore: 3, enabled: true),
            ReminderScheduleItem(daysBefore: 0, enabled: true),
          ],
        ),
        now: _now,
      );

      // Should have only 2 reminders now
      expect(gateway.pending.length, 2);
      expect(gateway.pending.map((r) => r.daysBefore).toSet(), {3, 0});
    });

    test('one failing reminder does not stop the others', () async {
      final logs = <String>[];
      final gateway = FakeGateway();
      final storage = FakeNotificationStorage();
      final service = ExpiryReminderService(gateway, storage, log: logs.add);
      // First reminder (index 0) for item 'a' will fail
      final failing = ReminderIds.forItem('a', 0);
      gateway.failingIds.add(failing);

      await service.sync(
        items: [_item('a', expiry)],
        settings: const AppSettings(remindersEnabled: true),
        now: _now,
      );

      // 3 reminders should succeed (indices 1, 2, 3)
      expect(gateway.pending.length, 3);
      expect(gateway.pending.every((r) => r.id != failing), isTrue);
      expect(logs.single, contains('Could not schedule reminder $failing'));
    });
  });
}