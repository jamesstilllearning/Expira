import 'dart:async';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import 'controllers/inventory_controller.dart';
import 'controllers/settings_controller.dart';
import 'screens/home_screen.dart';
import 'screens/inventory_screen.dart';
import 'screens/friends_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/barcode_scanner_screen.dart';
import 'screens/item_form_screen.dart';
import 'screens/product_review_screen.dart';
import 'screens/notification_center_screen.dart';
import 'screens/analytics_screen.dart';
import 'services/expiry_reminder_service.dart';
import 'services/item_storage.dart';
import 'services/notification_service.dart';
import 'services/notification_storage.dart';
import 'services/product_lookup_service.dart';
import 'services/settings_storage.dart';
import 'theme/app_theme.dart';
import 'widgets/app_settings_scope.dart';
import 'widgets/celebration_overlay.dart';
import 'widgets/directional_tab_view.dart';
import 'widgets/sign_in_required_dialog.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final settings = SettingsController(SettingsStorage());
  final inventory = InventoryController(ItemStorage());
  final notifications = NotificationService();
  final notificationStorage = NotificationStorage();
  final reminders = ExpiryReminderService(notifications, notificationStorage);

  await settings.load();
  inventory.updateThresholds(settings.settings.thresholds);
  await inventory.load();

  // Reminders are rebuilt from the current items and settings whenever either
  // changes, so the pending notifications always match the app's data.
  void resyncReminders() {
    if (kIsWeb) return;
    unawaited(
        reminders.sync(items: inventory.items, settings: settings.settings));
  }

  settings.addListener(() {
    inventory.updateThresholds(settings.settings.thresholds);
    resyncReminders();
  });
  inventory.addListener(resyncReminders);
  resyncReminders();

  runApp(ExpiraApp(
      inventory: inventory, settings: settings, notifications: notifications));
}

class ExpiraApp extends StatelessWidget {
  const ExpiraApp({
    super.key,
    required this.inventory,
    required this.settings,
    required this.notifications,
  });

  final InventoryController inventory;
  final SettingsController settings;
  final NotificationService notifications;

  @override
  Widget build(BuildContext context) {
    return AppSettingsScope(
      settings: settings,
      child: ListenableBuilder(
        listenable: settings,
        builder: (context, _) => MaterialApp(
          title: 'ExPIRA',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode:
              settings.settings.darkMode ? ThemeMode.dark : ThemeMode.light,
          home: AppShell(
            inventory: inventory,
            settings: settings,
            notifications: notifications,
          ),
        ),
      ),
    );
  }
}

class AppShell extends StatefulWidget {
  const AppShell({
    super.key,
    required this.inventory,
    required this.settings,
    required this.notifications,
  });

  final InventoryController inventory;
  final SettingsController settings;
  final NotificationService notifications;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  static const _homeIndex = 0;
  static const _inventoryIndex = 1;
  static const _chatsIndex = 4;
  static const _notificationsIndex = 5;

  int _index = _homeIndex;
  bool _signInDialogOpen = false;

  void _openSettings() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SettingsScreen(
          controller: widget.settings,
          inventory: widget.inventory,
          notifications: widget.notifications,
        ),
      ),
    );
  }

  void _onDestinationSelected(int index) {
    if (index == _chatsIndex) {
      _showSignInDialog();
      return;
    }
    if (index == _index) return;
    setState(() => _index = index);
  }

  /// Chats has no page yet. Opening it explains that sign-in comes first, and
  /// repeated taps while the dialog is open are ignored.
  void _showSignInDialog() {
    if (_signInDialogOpen) return;
    _signInDialogOpen = true;
    showSignInRequiredDialog(context, onContinue: _openSettings)
        .whenComplete(() => _signInDialogOpen = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CelebrationOverlay(
        consumptions: widget.inventory.consumptions,
        settings: widget.settings,
        child: DirectionalTabView(
          index: _index,
          children: [
            HomeScreen(
              controller: widget.inventory,
              onOpenInventory: () => setState(() => _index = _inventoryIndex),
              onOpenSettings: _openSettings,
              onScanBarcode: () async {
                final barcode = await BarcodeScannerScreen.scan(context);
                if (barcode == null || !context.mounted) return;

                final product = await ProductLookupService().lookup(barcode);
                if (!context.mounted) return;
                final matches = widget.inventory.items
                    .where((item) => item.barcode == barcode);
                if (matches.isNotEmpty) {
                  await ItemFormScreen.open(context, widget.inventory,
                      item: matches.first);
                } else {
                  await ProductReviewScreen.open(
                    context,
                    controller: widget.inventory,
                    barcode: barcode,
                    product: product,
                    onEdit: () {
                      ItemFormScreen.open(context, widget.inventory,
                          initialBarcode: barcode, initialProduct: product);
                    },
                  );
                }
              },
              onOpenCalendar: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Expiration calendar coming soon!'),
                  ),
                );
              },
              onOpenNotifications: () => setState(() => _index = _notificationsIndex),
            ),
            InventoryScreen(
              controller: widget.inventory,
              onOpenSettings: _openSettings,
              onOpenNotifications: () =>
                  setState(() => _index = _notificationsIndex),
            ),
            AnalyticsScreen(controller: widget.inventory),
            FriendsScreen(onOpenSettings: _openSettings),
            // Chats has no page yet. Chats never selects this slot.
            const SizedBox.shrink(),
            NotificationCenterScreen(
              controller: widget.inventory,
              onOpenSettings: _openSettings,
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index == _notificationsIndex ? _inventoryIndex : _index,
        onDestinationSelected: _onDestinationSelected,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined),
            selectedIcon: Icon(Icons.inventory_2),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.analytics_outlined),
            selectedIcon: Icon(Icons.analytics),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.groups_outlined),
            selectedIcon: Icon(Icons.groups),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline),
            selectedIcon: Icon(Icons.chat_bubble),
            label: '',
          ),
        ],
      ),
    );
  }
}
