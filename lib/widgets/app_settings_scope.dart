import 'package:flutter/material.dart';

import '../controllers/settings_controller.dart';
import '../models/app_settings.dart';

/// Makes the current [AppSettings] available to any screen in the app.
class AppSettingsScope extends InheritedNotifier<SettingsController> {
  const AppSettingsScope(
      {super.key, required SettingsController settings, required super.child})
      : super(notifier: settings);

  static AppSettings settingsOf(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<AppSettingsScope>();
    return scope?.notifier?.settings ?? const AppSettings();
  }
}
