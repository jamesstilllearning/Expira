import 'package:expira/models/app_settings.dart';
import 'package:expira/models/food_item.dart';
import 'package:expira/services/settings_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  test('settings survive a save and load cycle', () async {
    final storage = SettingsStorage();
    await storage.save(const AppSettings(
        darkMode: true, strictThresholds: false, autoFlashlight: true));

    final loaded = await storage.load();
    expect(loaded.darkMode, isTrue);
    expect(loaded.strictThresholds, isFalse);
    expect(loaded.autoFlashlight, isTrue);
    expect(loaded.celebrationEffects, isTrue);
  });

  test('missing storage falls back to defaults', () async {
    final loaded = await SettingsStorage().load();
    expect(loaded.darkMode, isFalse);
    expect(loaded.strictThresholds, isTrue);
  });

  test('relaxed thresholds warn later than strict ones', () {
    expect(ExpiryThresholds.strict.classify(2), ExpiryStatus.expiring);
    expect(ExpiryThresholds.relaxed.classify(2), ExpiryStatus.soon);
  });
}
