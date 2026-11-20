import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/constants/app_constants.dart';
import '../core/utils/date_utils.dart' as app_date_utils;
import '../domain/models/app_settings.dart';
import '../domain/models/reminder_schedule.dart';
import '../presentation/providers/state_providers.dart';
import '../presentation/providers/usecase_providers.dart';
import '../services/backup_service.dart';
import '../services/consumption_storage.dart';
import '../services/item_storage.dart';
import '../services/notification_service.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/pop_in.dart';
import '../widgets/section_header.dart';

/// Settings screen using Riverpod for state management and go_router for navigation.
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  Future<bool> _exportBackup(BuildContext context, {bool showMessage = true}) async {
    final service = BackupService(
      items: ItemStorage(),
      records: ConsumptionStorage(),
    );
    final content = await service.createBackupJson();
    final date = DateTime.now();
    final stamp = '${date.year.toString().padLeft(4, '0')}'
        '${date.month.toString().padLeft(2, '0')}'
        '${date.day.toString().padLeft(2, '0')}';
    final saved = await FilePicker.saveFile(
      dialogTitle: 'Save ExPIRA backup',
      fileName: 'expira-backup-$stamp.json',
      type: FileType.custom,
      allowedExtensions: const ['json'],
      bytes: Uint8List.fromList(utf8.encode(content)),
    );
    if (saved == null) return false;
    if (showMessage && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Backup saved.')),
      );
    }
    return true;
  }

  Future<void> _restoreBackup(BuildContext context, WidgetRef ref) async {
    try {
      final picked = await FilePicker.pickFile(
        type: FileType.custom,
        allowedExtensions: const ['json'],
      );
      if (picked == null || !context.mounted) return;
      final bytes = await picked.xFile.readAsBytes();
      if (!context.mounted) return;

      final service = BackupService(
        items: ItemStorage(),
        records: ConsumptionStorage(),
      );
      final backup = service.decodeBackup(utf8.decode(bytes));
      final confirmed = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Replace current data?'),
              content: Text(
                'This backup contains ${backup.items.length} items and '
                '${backup.records.length} usage records. ExPIRA will first '
                'ask you to save a safety backup, then replace the current '
                'inventory and history.',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Cancel'),
                ),
                FilledButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('Continue'),
                ),
              ],
            ),
          ) ??
          false;
      if (!confirmed || !context.mounted) return;

      final safetyBackupSaved = await _exportBackup(context, showMessage: false);
      if (!safetyBackupSaved || !context.mounted) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: PopIn(child: Text('Restore cancelled because the safety backup was not saved.'))),
          );
        }
        return;
      }

      final replaceAllUseCase = ref.read(replaceAllFoodItemsUseCaseProvider);
      final result = await replaceAllUseCase(backup.items);
      if (!context.mounted) return;

      if (result.isSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: PopIn(child: Text('Backup restored.'))),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: PopIn(child: Text('Failed to restore: ${result.failure?.message}'))),
        );
      }
    } on FormatException catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: PopIn(child: Text(error.message))),
        );
      }
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: PopIn(child: Text('Could not restore that backup. No data was replaced.'))),
        );
      }
    }
  }

  Future<void> _setReminders(BuildContext context, WidgetRef ref, bool enabled) async {
    final notifications = NotificationService();
    if (enabled) {
      final granted = await notifications.requestPermission();
      if (!granted) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: PopIn(child: Text('Allow notifications in Android Settings > Apps > ExPIRA > Notifications, then turn reminders on again.'))));
        }
        return;
      }
    }
    final settingsAsync = ref.read(appSettingsFutureProvider);
    final currentSettings = (await settingsAsync).getOrElse(() => const AppSettings());
    final saveUseCase = ref.read(saveAppSettingsUseCaseProvider);
    await saveUseCase(currentSettings.copyWith(remindersEnabled: enabled));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsync = ref.watch(appSettingsStreamProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: settingsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => _ErrorState(
          message: 'Failed to load settings',
          onRetry: () => ref.invalidate(appSettingsStreamProvider),
        ),
        data: (result) {
          final s = result.getOrElse(() => const AppSettings());
          return ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
            children: [
              const _SyncCard(),
              const SizedBox(height: AppSpacing.xl),
              const SectionHeader(title: 'Smart features'),
              _SettingsGroup(children: [
                if (kIsWeb)
                  const ListTile(
                    leading: Icon(Icons.flashlight_on_outlined),
                    title: Text('Auto flashlight'),
                    subtitle: Text('Available when scanning on Android.'),
                  )
                else
                  _SettingTile(
                    icon: Icons.flashlight_on_outlined,
                    color: AppColors.soon,
                    title: 'Auto flashlight',
                    subtitle: 'Turn on the flashlight when scanning in the dark',
                    value: s.autoFlashlight,
                    onChanged: (v) => _updateSettings(ref, s.copyWith(autoFlashlight: v)),
                  ),
                _SettingTile(
                  icon: Icons.celebration_outlined,
                  color: AppColors.brand,
                  title: 'Celebration effects',
                  subtitle: 'Celebrate when you use an item before it expires',
                  value: s.celebrationEffects,
                  onChanged: (v) => _updateSettings(ref, s.copyWith(celebrationEffects: v)),
                ),
                _SettingTile(
                  icon: Icons.tune,
                  color: AppColors.expiring,
                  title: 'Strict thresholds',
                  subtitle: s.strictThresholds
                      ? 'Warn 2 days before expiry'
                      : 'Warn only 1 day before expiry',
                  value: s.strictThresholds,
                  onChanged: (v) => _updateSettings(ref, s.copyWith(strictThresholds: v)),
                ),
              ]),
              const SizedBox(height: AppSpacing.xl),
              const SectionHeader(title: 'Reminders'),
              _SettingsGroup(children: [
                if (kIsWeb)
                  const ListTile(
                    leading: Icon(Icons.notifications_off_outlined),
                    title: Text('Expiry reminders'),
                    subtitle: Text('Scheduled reminders are available in the Android app only.'),
                  )
                else
                  _SettingTile(
                    icon: Icons.notifications_active_outlined,
                    color: AppColors.brand,
                    title: 'Expiry reminders',
                    subtitle: 'Notify me when items start expiring and on the day they expire',
                    value: s.remindersEnabled,
                    onChanged: (enabled) => _setReminders(context, ref, enabled),
                  ),
                if (!kIsWeb && s.remindersEnabled)
                  _ReminderScheduleTile(
                    settings: s,
                    onChanged: (schedule, hour) =>
                        _updateSettings(ref, s.copyWith(reminderSchedule: schedule, reminderHour: hour)),
                  ),
              ]),
              const SizedBox(height: AppSpacing.xl),
              const SectionHeader(title: 'Appearance'),
              _SettingsGroup(children: [
                _SettingTile(
                  icon: Icons.dark_mode_outlined,
                  color: AppColors.deep,
                  title: 'Dark mode',
                  subtitle: 'Use the dark theme across the app',
                  value: s.darkMode,
                  onChanged: (v) => _updateSettings(ref, s.copyWith(darkMode: v)),
                ),
              ]),
              const SizedBox(height: AppSpacing.xl),
              const SectionHeader(title: 'Your data'),
              _SettingsGroup(children: [
                if (kIsWeb)
                  const ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text('Browser-only data'),
                    subtitle: Text(
                      'Inventory is saved in this browser and is separate from your Android data. Clearing this site\'s data will erase it.',
                    ),
                  ),
                ListTile(
                  leading: const Icon(Icons.download_outlined),
                  title: const Text('Export backup'),
                  subtitle: const Text('Save inventory and usage history as a JSON file'),
                  onTap: () async {
                    try {
                      await _exportBackup(context);
                    } catch (_) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: PopIn(child: Text('Could not save the backup.'))));
                      }
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.restore_outlined),
                  title: const Text('Restore backup'),
                  subtitle: const Text('Replace this device\'s inventory and usage history'),
                  onTap: () => _restoreBackup(context, ref),
                ),
              ]),
            ],
          );
        },
      ),
    );
  }

  Future<void> _updateSettings(WidgetRef ref, AppSettings settings) async {
    final saveUseCase = ref.read(saveAppSettingsUseCaseProvider);
    await saveUseCase(settings);
  }
}

/// Error state widget
class _ErrorState extends StatelessWidget {
  const _ErrorState({
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 64, color: theme.colorScheme.error),
            const SizedBox(height: AppSpacing.md),
            Text(message, style: theme.textTheme.titleMedium, textAlign: TextAlign.center),
            const SizedBox(height: AppSpacing.lg),
            FilledButton(onPressed: onRetry, child: const Text('Retry')),
          ],
        ),
      ),
    );
  }
}

/// Account card. Sync is not available yet, so it shows status rather than a
/// button that does nothing.
class _SyncCard extends StatelessWidget {
  const _SyncCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(AppRadius.control),
            ),
            child: Icon(Icons.cloud_outlined, color: theme.colorScheme.onPrimaryContainer),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Household sync', style: theme.textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(
                  'Coming soon. Your items stay on this device for now.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Icon(Icons.schedule_outlined, size: 20, color: theme.colorScheme.onSurfaceVariant),
        ],
      ),
    );
  }
}

class _SettingsGroup extends StatelessWidget {
  const _SettingsGroup({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          for (var i = 0; i < children.length; i++) ...[
            if (i > 0) const Divider(height: 1, indent: 66),
            children[i],
          ],
        ],
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  const _SettingTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    HapticFeedback.selectionClick();
    onChanged(!value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(14, 8, 8, 8),
      onTap: _handleTap,
      leading: Container(
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.14),
          borderRadius: BorderRadius.circular(AppRadius.control),
        ),
        child: Icon(icon, color: color, size: AppIconSize.md),
      ),
      title: Text(title, style: theme.textTheme.titleMedium),
      subtitle: Text(subtitle, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
      trailing: Switch(
        value: value,
        onChanged: (v) {
          HapticFeedback.selectionClick();
          onChanged(v);
        },
        activeThumbColor: AppColors.brand,
        activeTrackColor: AppColors.brand.withValues(alpha: 0.3),
        inactiveThumbColor: theme.colorScheme.outline,
        inactiveTrackColor: theme.colorScheme.surfaceContainerHighest,
      ),
    );
  }
}

// Custom callback types for multi-parameter callbacks
typedef ScheduleChangedCallback = void Function(List<ReminderScheduleItem> schedule, int hour);

/// Tile for configuring the reminder schedule (which days before expiry to notify)
class _ReminderScheduleTile extends StatefulWidget {
  const _ReminderScheduleTile({
    required this.settings,
    required this.onChanged,
  });

  final AppSettings settings;
  final ScheduleChangedCallback onChanged;

  @override
  State<_ReminderScheduleTile> createState() => _ReminderScheduleTileState();
}

class _ReminderScheduleTileState extends State<_ReminderScheduleTile> {
  late List<ReminderScheduleItem> _schedule;
  late int _reminderHour;

  @override
  void initState() {
    super.initState();
    _schedule = List.from(widget.settings.reminderSchedule);
    _reminderHour = widget.settings.reminderHour;
  }

  void _save() {
    widget.onChanged(_schedule, _reminderHour);
  }

  void _toggleEnabled(int index) {
    setState(() {
      _schedule[index] = _schedule[index].copyWith(enabled: !_schedule[index].enabled);
    });
    _save();
  }

  void _changeDays(int index, int newDays) {
    setState(() {
      _schedule[index] = _schedule[index].copyWith(daysBefore: newDays);
    });
    _save();
  }

  void _changeLabel(int index, String newLabel) {
    setState(() {
      _schedule[index] = _schedule[index].copyWith(label: newLabel);
    });
    _save();
  }

  void _pickHour() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: _reminderHour, minute: 0),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child!,
      ),
    );
    if (picked != null && mounted) {
      setState(() => _reminderHour = picked.hour);
      _save();
    }
  }

  void _addReminder() {
    // Find a sensible default (e.g., 14 days if not taken, or 30)
    final existingDays = _schedule.map((s) => s.daysBefore).toSet();
    int newDays = 14;
    while (existingDays.contains(newDays)) {
      newDays += 7;
    }
    if (newDays > 90) newDays = 90;

    setState(() {
      _schedule.add(ReminderScheduleItem(daysBefore: newDays, enabled: true, label: '$newDays days before'));
      // Keep sorted by daysBefore descending
      _schedule.sort((a, b) => b.daysBefore.compareTo(a.daysBefore));
    });
    _save();
  }

  void _removeReminder(int index) {
    if (_schedule.length <= 1) return; // Keep at least one
    setState(() {
      _schedule.removeAt(index);
    });
    _save();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ExpansionTile(
      tilePadding: const EdgeInsets.fromLTRB(14, 8, 8, 8),
      initiallyExpanded: true,
      leading: Container(
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: AppColors.brand.withValues(alpha: 0.14),
          borderRadius: BorderRadius.circular(AppRadius.control),
        ),
        child: const Icon(Icons.schedule_outlined, color: AppColors.brand, size: AppIconSize.md),
      ),
      title: Text('Reminder schedule', style: theme.textTheme.titleMedium),
      subtitle: Text('Choose when to be notified before items expire', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
      children: [
        // Reminder hour picker
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(66, 8, 14, 8),
          leading: Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: AppColors.soon.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(AppRadius.control),
            ),
            child: const Icon(Icons.access_time_outlined, color: AppColors.soon, size: 20),
          ),
          title: const Text('Notification time'),
          subtitle: Text('Reminders will be sent at ${_reminderHour.toString().padLeft(2, '0')}:00', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
          onTap: _pickHour,
          trailing: const Icon(Icons.chevron_right),
        ),
        const Divider(height: 1, indent: 66),
        // Reminder schedule items
        for (var i = 0; i < _schedule.length; i++)
          _ReminderScheduleItemTile(
            index: i,
            item: _schedule[i],
            onToggleEnabled: _toggleEnabled,
            onChangeDays: _changeDays,
            onChangeLabel: _changeLabel,
            onRemove: _schedule.length > 1 ? () => _removeReminder(i) : null,
          ),
        // Add new reminder button
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(66, 8, 14, 8),
          leading: Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: AppColors.brand.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(AppRadius.control),
            ),
            child: const Icon(Icons.add_outlined, color: AppColors.brand, size: 20),
          ),
          title: const Text('Add reminder'),
          subtitle: Text('Notify at a custom number of days before expiry', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
          onTap: _addReminder,
        ),
      ],
    );
  }
}

class _ReminderScheduleItemTile extends StatefulWidget {
  const _ReminderScheduleItemTile({
    required this.index,
    required this.item,
    required this.onToggleEnabled,
    required this.onChangeDays,
    required this.onChangeLabel,
    this.onRemove,
  });

  final int index;
  final ReminderScheduleItem item;
  final ValueChanged<int> onToggleEnabled;
  final void Function(int index, int newDays) onChangeDays;
  final void Function(int index, String newLabel) onChangeLabel;
  final VoidCallback? onRemove;

  @override
  State<_ReminderScheduleItemTile> createState() => _ReminderScheduleItemTileState();
}

class _ReminderScheduleItemTileState extends State<_ReminderScheduleItemTile> {
  late TextEditingController _daysController;
  late TextEditingController _labelController;
  bool _editingDays = false;
  bool _editingLabel = false;

  @override
  void initState() {
    super.initState();
    _daysController = TextEditingController(text: widget.item.daysBefore.toString());
    _labelController = TextEditingController(text: widget.item.label);
  }

  @override
  void dispose() {
    _daysController.dispose();
    _labelController.dispose();
    super.dispose();
  }

  void _submitDays() {
    final value = int.tryParse(_daysController.text.trim());
    if (value != null && value >= 0 && value <= 90) {
      widget.onChangeDays(widget.index, value);
    }
    setState(() => _editingDays = false);
  }

  void _submitLabel() {
    widget.onChangeLabel(widget.index, _labelController.text.trim());
    setState(() => _editingLabel = false);
  }

  String _getDisplayLabel() {
    if (widget.item.daysBefore == 0) return 'On expiry day';
    if (widget.item.daysBefore == 1) return '1 day before';
    return '${widget.item.daysBefore} days before';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isExpiryDay = widget.item.daysBefore == 0;
    final statusColor = isExpiryDay ? AppColors.expiring : AppColors.soon;

    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(66, 8, 14, 8),
      leading: Container(
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: statusColor.withValues(alpha: 0.14),
          borderRadius: BorderRadius.circular(AppRadius.control),
        ),
        child: Icon(isExpiryDay ? Icons.event_available : Icons.schedule_outlined, color: statusColor, size: 20),
      ),
      title: Row(
        children: [
          Checkbox(value: widget.item.enabled, onChanged: (_) => widget.onToggleEnabled(widget.index), activeColor: AppColors.brand),
          const SizedBox(width: 8),
          Expanded(
            child: _editingDays
                ? SizedBox(
                    width: 80,
                    child: TextField(
                      controller: _daysController,
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(isDense: true, hintText: 'Days', border: OutlineInputBorder()),
                      onSubmitted: (_) => _submitDays(),
                      onEditingComplete: _submitDays,
                    ),
                  )
                : Text(
                    _getDisplayLabel(),
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: widget.item.enabled ? theme.colorScheme.onSurface : theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
          ),
        ],
      ),
      subtitle: _editingLabel
          ? TextField(
              controller: _labelController,
              autofocus: true,
              decoration: const InputDecoration(isDense: true, hintText: 'Custom label (optional)', border: OutlineInputBorder()),
              onSubmitted: (_) => _submitLabel(),
              onEditingComplete: _submitLabel,
            )
          : widget.item.label.isNotEmpty
              ? Text(widget.item.label, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant))
              : null,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!_editingDays)
            IconButton(
              tooltip: 'Edit days',
              onPressed: () => setState(() => _editingDays = true),
              icon: Icon(Icons.edit_outlined, size: 20, color: theme.colorScheme.onSurfaceVariant),
            ),
          if (!_editingLabel && widget.item.label.isNotEmpty)
            IconButton(
              tooltip: 'Edit label',
              onPressed: () => setState(() => _editingLabel = true),
              icon: Icon(Icons.edit_outlined, size: 20, color: theme.colorScheme.onSurfaceVariant),
            ),
          if (widget.onRemove != null)
            IconButton(
              tooltip: 'Remove',
              onPressed: widget.onRemove,
              icon: Icon(Icons.delete_outline, size: 20, color: theme.colorScheme.error),
            ),
        ],
      ),
    );
  }
}