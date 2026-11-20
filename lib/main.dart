import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'di/di.dart';
import 'domain/models/app_settings.dart';
import 'presentation/routing/app_router_provider.dart';
import 'services/expiry_reminder_service.dart';
import 'services/notification_service.dart';
import 'services/notification_storage.dart';
import 'theme/app_theme.dart';
import 'widgets/app_settings_scope.dart';
import 'widgets/celebration_overlay.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection
  await configureDependencies();

  // Initialize services
  final notifications = NotificationService();
  final notificationStorage = NotificationStorage();
  final reminders = ExpiryReminderService(notifications, notificationStorage);

  runApp(ProviderScope(child: ExpiraApp(reminders: reminders)));
}

class ExpiraApp extends ConsumerWidget {
  const ExpiraApp({super.key, required this.reminders});

  final ExpiryReminderService reminders;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'ExPIRA',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      routerConfig: router,
      builder: (context, child) => CelebrationOverlay(
        consumptions: const Stream.empty(),
        settings: const AppSettings(),
        child: child!,
      ),
    );
  }
}