import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/notification_record.dart';

/// Local storage for notification history using SharedPreferences.
class NotificationStorage {
  static const _notificationsKey = 'notifications.history';
  static const _maxNotifications = 500; // Cap to avoid unbounded growth

  Future<List<NotificationRecord>> loadAll() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_notificationsKey);
    if (jsonString == null) return [];

    try {
      final List<dynamic> jsonList = jsonDecode(jsonString) as List<dynamic>;
      return jsonList
          .map((e) => NotificationRecord.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> saveAll(List<NotificationRecord> notifications) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(
      notifications.map((n) => n.toJson()).toList(),
    );
    await prefs.setString(_notificationsKey, jsonString);
  }

  Future<void> addNotification(NotificationRecord notification) async {
    final existing = await loadAll();

    // Check for duplicate (same reminder ID) - don't add if already exists
    final isDuplicate = existing.any((n) => n.id == notification.id);
    if (isDuplicate) return;

    existing.insert(0, notification); // Newest first

    // Trim to max size
    if (existing.length > _maxNotifications) {
      existing.removeRange(_maxNotifications, existing.length);
    }

    await saveAll(existing);
  }

  Future<void> markAsRead(String id) async {
    final notifications = await loadAll();
    final index = notifications.indexWhere((n) => n.id == id);
    if (index >= 0) {
      notifications[index] = notifications[index].copyWith(isRead: true);
      await saveAll(notifications);
    }
  }

  Future<void> markAsUnread(String id) async {
    final notifications = await loadAll();
    final index = notifications.indexWhere((n) => n.id == id);
    if (index >= 0) {
      notifications[index] = notifications[index].copyWith(isRead: false);
      await saveAll(notifications);
    }
  }

  Future<void> deleteNotification(String id) async {
    final notifications = await loadAll();
    notifications.removeWhere((n) => n.id == id);
    await saveAll(notifications);
  }

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_notificationsKey);
  }

  Future<int> getUnreadCount() async {
    final notifications = await loadAll();
    return notifications.where((n) => !n.isRead && n.deletedAt == null).length;
  }

  Future<List<NotificationRecord>> getFiltered(
    NotificationFilter filter, {
    DateTime? since,
  }) async {
    var notifications = await loadAll();

    // Filter out deleted
    notifications = notifications.where((n) => n.deletedAt == null).toList();

    // Filter by time
    if (since != null) {
      notifications = notifications
          .where((n) => n.triggeredAt.isAfter(since))
          .toList();
    }

    // Apply filter
    switch (filter) {
      case NotificationFilter.all:
        break;
      case NotificationFilter.unread:
        notifications = notifications.where((n) => !n.isRead).toList();
        break;
      case NotificationFilter.read:
        notifications = notifications.where((n) => n.isRead).toList();
        break;
      case NotificationFilter.expiryDay:
        notifications = notifications.where((n) => n.isExpiryDay).toList();
        break;
      case NotificationFilter.upcoming:
        notifications = notifications.where((n) => !n.isExpiryDay).toList();
        break;
    }

    // Sort by triggeredAt descending (newest first)
    notifications.sort((a, b) => b.triggeredAt.compareTo(a.triggeredAt));

    return notifications;
  }
}