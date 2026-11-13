import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'expiry_reminder_service.dart';
import 'reminder_planner.dart';

/// Local device notifications only. No push or server-side delivery.
class NotificationService implements ReminderGateway {
  static const _channelId = 'expiry_reminders';
  static const _channelName = 'Expiry reminders';
  static const _channelDescription =
      'Reminders before food and products expire';

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();
  Future<void>? _initialization;

  Future<void> init() {
    return _initialization ??= _initialize().catchError((Object error) {
      _initialization = null;
      throw error;
    });
  }

  Future<void> _initialize() async {
    tz.initializeTimeZones();
    try {
      final localZone = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(localZone.identifier));
    } catch (_) {
      // Fall back to UTC if the device timezone can't be read.
    }

    await _plugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
        ),
      ),
    );

    await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(
          const AndroidNotificationChannel(
            _channelId,
            _channelName,
            description: _channelDescription,
            importance: Importance.high,
          ),
        );
  }

  /// Asks the OS for permission. Returns false when the user declines.
  Future<bool> requestPermission() async {
    await init();
    final android = await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    final ios = await _plugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);
    return (android ?? true) && (ios ?? true);
  }

  @override
  Future<void> schedule(PlannedReminder reminder) async {
    await init();

    final isExpiryDay = reminder.daysBefore == 0;
    final dayText = reminder.daysBefore == 1 ? 'day' : 'days';
    final remainingText = isExpiryDay
        ? 'today'
        : 'in ${reminder.daysBefore} $dayText';

    await _plugin.zonedSchedule(
      reminder.id,
      reminder.title,
      reminder.body,
      tz.TZDateTime.from(reminder.triggerAt, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          channelDescription: _channelDescription,
          importance: Importance.high,
          priority: Priority.high,
          styleInformation: BigTextStyleInformation(
            reminder.body,
            htmlFormatBigText: true,
            contentTitle: reminder.title,
            summaryText: 'Category: ${reminder.itemCategory} • Expires ${_formatDate(reminder.expiryDate)} ($remainingText)',
          ),
          category: AndroidNotificationCategory.reminder,
          color: isExpiryDay ? const Color(0xFFFF4444) : const Color(0xFFFFA500), // Red for expiry, orange for upcoming
          enableVibration: true,
          playSound: true,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
          subtitle: 'Category: ${reminder.itemCategory} • Expires ${_formatDate(reminder.expiryDate)} ($remainingText)',
        ),
      ),
      // Inexact timing avoids the exact-alarm permission. Reminders can run a
      // few minutes late, which is fine for daily expiry reminders.
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: reminder.payload != null
          ? _encodePayload(reminder.payload!)
          : null,
    );
  }

  static String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }

  static String _encodePayload(Map<String, dynamic> payload) {
    // For local notifications, we can pass a simple payload
    // In practice, this would be handled by the notification click handler
    return payload['itemId'] ?? '';
  }

  @override
  Future<void> cancelAll() async {
    await init();
    await _plugin.cancelAll();
  }

  /// Cancel a specific reminder by ID
  Future<void> cancel(int id) async {
    await init();
    await _plugin.cancel(id);
  }
}
