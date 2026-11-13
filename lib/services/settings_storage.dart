import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/app_settings.dart';

class SettingsStorage {
  static const _settingsKey = 'settings.all';

  Future<AppSettings> load() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_settingsKey);
    if (jsonString != null) {
      try {
        return AppSettings.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);
      } catch (_) {
        // Fall back to defaults if parsing fails
      }
    }
    return const AppSettings();
  }

  Future<void> save(AppSettings settings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_settingsKey, jsonEncode(settings.toJson()));
  }
}
