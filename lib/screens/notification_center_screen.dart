import 'package:flutter/material.dart';

import '../controllers/inventory_controller.dart';
import '../models/notification_record.dart';
import '../services/notification_storage.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/app_card.dart';
import '../widgets/app_loading_indicator.dart';
import '../widgets/empty_state.dart';
import 'item_form_screen.dart';

class NotificationCenterScreen extends StatefulWidget {
  const NotificationCenterScreen({
    super.key,
    required this.controller,
    this.onOpenSettings,
  });

  final InventoryController controller;
  final VoidCallback? onOpenSettings;

  @override
  State<NotificationCenterScreen> createState() => _NotificationCenterScreenState();
}

class _NotificationCenterScreenState extends State<NotificationCenterScreen> {
  final NotificationStorage _storage = NotificationStorage();
  NotificationFilter _filter = NotificationFilter.all;
  List<NotificationRecord> _notifications = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    setState(() => _isLoading = true);
    try {
      final notifications = await _storage.getFiltered(_filter);
      if (mounted) {
        setState(() {
          _notifications = notifications;
          _isLoading = false;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _onFilterChanged(NotificationFilter filter) async {
    setState(() => _filter = filter);
    await _loadNotifications();
  }

  Future<void> _markAsRead(NotificationRecord notification) async {
    await _storage.markAsRead(notification.id);
    await _loadNotifications();
  }

  Future<void> _markAsUnread(NotificationRecord notification) async {
    await _storage.markAsUnread(notification.id);
    await _loadNotifications();
  }

  Future<void> _deleteNotification(NotificationRecord notification) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete notification?'),
        content: Text('Remove "${notification.itemName}" notification?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      await _storage.deleteNotification(notification.id);
      await _loadNotifications();
    }
  }

  Future<void> _openItemDetails(NotificationRecord notification) async {
    final matches = widget.controller.items
        .where((i) => i.id == notification.itemId)
        .toList();
    final item = matches.isNotEmpty ? matches.first : null;

    if (item != null && mounted) {
      await ItemFormScreen.open(context, widget.controller, item: item);
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${notification.itemName} not found in inventory')),
      );
    }
  }

  Future<void> _clearAllRead() async {
    final readNotifications = _notifications.where((n) => n.isRead).toList();
    if (readNotifications.isEmpty) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear read notifications?'),
        content: Text('Remove ${readNotifications.length} read notification(s)?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Clear'),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      for (final notification in readNotifications) {
        await _storage.deleteNotification(notification.id);
      }
      await _loadNotifications();
    }
  }

  @override
  Widget build(BuildContext context) {
    final unreadCount = _notifications.where((n) => !n.isRead).length;

    return Scaffold(
      appBar: AppBar(
        title: Text(unreadCount > 0
            ? 'Notifications ($unreadCount unread)'
            : 'Notifications'),
        actions: [
          PopupMenuButton<NotificationFilter>(
            tooltip: 'Filter',
            icon: const Icon(Icons.filter_list),
            initialValue: _filter,
            onSelected: _onFilterChanged,
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: NotificationFilter.all,
                child: Row(
                  children: [
                    Icon(Icons.list_alt, size: 20),
                    SizedBox(width: 8),
                    Text('All'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: NotificationFilter.unread,
                child: Row(
                  children: [
                    Icon(Icons.mark_email_unread_outlined, size: 20),
                    SizedBox(width: 8),
                    Text('Unread'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: NotificationFilter.read,
                child: Row(
                  children: [
                    Icon(Icons.mark_email_read_outlined, size: 20),
                    SizedBox(width: 8),
                    Text('Read'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: NotificationFilter.expiryDay,
                child: Row(
                  children: [
                    Icon(Icons.event_available, size: 20, color: AppColors.expiring),
                    SizedBox(width: 8),
                    Text('Expiry day'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: NotificationFilter.upcoming,
                child: Row(
                  children: [
                    Icon(Icons.schedule_outlined, size: 20, color: AppColors.soon),
                    SizedBox(width: 8),
                    Text('Upcoming'),
                  ],
                ),
              ),
            ],
          ),
          if (_notifications.any((n) => n.isRead))
            IconButton(
              tooltip: 'Clear read',
              onPressed: _clearAllRead,
              icon: const Icon(Icons.delete_sweep_outlined),
            ),
          if (widget.onOpenSettings != null)
            IconButton(
              tooltip: 'Settings',
              onPressed: widget.onOpenSettings,
              icon: const Icon(Icons.settings_outlined),
            ),
        ],
      ),
      body: _isLoading
          ? const AppLoadingIndicator(showText: true, text: 'Loading notifications...')
          : _notifications.isEmpty
              ? EmptyState(
                  icon: _filter == NotificationFilter.unread
                      ? Icons.mark_email_read_outlined
                      : Icons.notifications_none_outlined,
                  message: _filter == NotificationFilter.unread
                      ? 'No unread notifications.\nYou\'re all caught up!'
                      : 'No notifications yet.\nReminders will appear here.',
                )
              : RefreshIndicator(
                  onRefresh: _loadNotifications,
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
                    itemCount: _notifications.length,
                    itemBuilder: (context, index) =>
                        _NotificationTile(
                          notification: _notifications[index],
                          onMarkRead: _markAsRead,
                          onMarkUnread: _markAsUnread,
                          onDelete: _deleteNotification,
                          onTap: _openItemDetails,
                        ),
                  ),
                ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({
    required this.notification,
    required this.onMarkRead,
    required this.onMarkUnread,
    required this.onDelete,
    required this.onTap,
  });

  final NotificationRecord notification;
  final Future<void> Function(NotificationRecord) onMarkRead;
  final Future<void> Function(NotificationRecord) onMarkUnread;
  final Future<void> Function(NotificationRecord) onDelete;
  final Future<void> Function(NotificationRecord) onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isExpiryDay = notification.isExpiryDay;
    final statusColor = isExpiryDay ? AppColors.expiring : AppColors.soon;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Dismissible(
        key: ValueKey(notification.id),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            color: theme.colorScheme.error,
            borderRadius: BorderRadius.circular(AppRadius.card),
          ),
          child: const Icon(Icons.delete_outline, color: Colors.white, size: 28),
        ),
        confirmDismiss: (_) => onDelete(notification).then((_) => false),
        child: AppCard(
          onTap: () => onTap(notification),
          padding: EdgeInsets.zero,
          child: InkWell(
            borderRadius: BorderRadius.circular(AppRadius.card),
            onTap: () => onTap(notification),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status indicator
                  Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.only(top: 6, right: AppSpacing.md),
                    decoration: BoxDecoration(
                      color: notification.isRead
                          ? theme.colorScheme.outlineVariant
                          : statusColor,
                      shape: BoxShape.circle,
                    ),
                  ),

                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                notification.title,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: notification.isRead
                                      ? FontWeight.w500
                                      : FontWeight.w700,
                                  color: notification.isRead
                                      ? theme.colorScheme.onSurfaceVariant
                                      : theme.colorScheme.onSurface,
                                ),
                              ),
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Text(
                              _formatTimeAgo(notification.triggeredAt),
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          notification.body,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Row(
                          children: [
                            _InfoChip(
                              icon: Icons.category_outlined,
                              label: notification.itemCategory,
                              color: statusColor,
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            _InfoChip(
                              icon: Icons.event_outlined,
                              label: 'Expires ${notification.formattedExpiryDate}',
                              color: statusColor,
                            ),
                            if (notification.daysBefore > 0) ...[
                              const SizedBox(width: AppSpacing.sm),
                              _InfoChip(
                                icon: Icons.hourglass_bottom_outlined,
                                label: '${notification.daysRemaining} day${notification.daysRemaining == 1 ? '' : 's'} left',
                                color: statusColor,
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Trailing actions
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (!notification.isRead)
                        IconButton(
                          tooltip: 'Mark as read',
                          onPressed: () => onMarkRead(notification),
                          icon: Icon(
                            Icons.mark_email_read_outlined,
                            color: theme.colorScheme.primary,
                          ),
                        )
                      else
                        IconButton(
                          tooltip: 'Mark as unread',
                          onPressed: () => onMarkUnread(notification),
                          icon: Icon(
                            Icons.mark_email_unread_outlined,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      IconButton(
                        tooltip: 'Open item',
                        onPressed: () => onTap(notification),
                        icon: Icon(
                          Icons.chevron_right,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _formatTimeAgo(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);

    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return '${time.month}/${time.day}/${time.year}';
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}