import 'package:flutter/foundation.dart';

import '../models/app_settings.dart';
import '../services/settings_storage.dart';

class SettingsController extends ChangeNotifier {
  SettingsController(this._storage);

  final SettingsStorage _storage;
  AppSettings _settings = const AppSettings();

  AppSettings get settings => _settings;

  Future<void> load() async {
    _settings = await _storage.load();
    notifyListeners();
  }

  /// Updates the in-memory settings immediately, then persists them.
  Future<void> apply(AppSettings next) {
    _settings = next;
    notifyListeners();
    return _storage.save(next);
  }
}
