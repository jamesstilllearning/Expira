import 'package:expira/core/errors/failure.dart';
import 'package:expira/data/mappers/settings_mapper.dart';
import 'package:expira/domain/models/app_settings.dart';
import 'package:expira/services/settings_storage.dart';

/// Local data source for settings using SharedPreferences.
class SettingsLocalDataSource {
  SettingsLocalDataSource(this._storage);

  final SettingsStorage _storage;

  Future<Result<AppSettings>> load() async {
    try {
      final legacySettings = await _storage.load();
      // Convert legacy to domain
      final settings = SettingsMapper.toDomain(legacySettings);
      return Result.success(settings);
    } catch (e) {
      return Result.failure(
        Failure.storage(message: 'Failed to load settings', cause: e),
      );
    }
  }

  Stream<Result<AppSettings>> watch() async* {
    final result = await load();
    yield result;
    // SettingsStorage uses SharedPreferences which doesn't have a stream
    // We'll emit on manual refresh
  }

  Future<Result<AppSettings>> save(AppSettings settings) async {
    try {
      // Convert domain to legacy
      final legacySettings = SettingsMapper.toLegacy(settings);
      await _storage.save(legacySettings);
      return Result.success(settings);
    } catch (e) {
      return Result.failure(
        Failure.storage(message: 'Failed to save settings', cause: e),
      );
    }
  }

  Future<Result<AppSettings>> reset() async {
    try {
      // SettingsStorage doesn't have reset, so we save default settings
      const defaultDomainSettings = AppSettings();
      final defaultLegacySettings = SettingsMapper.toLegacy(defaultDomainSettings);
      await _storage.save(defaultLegacySettings);
      return Result.success(defaultDomainSettings);
    } catch (e) {
      return Result.failure(
        Failure.storage(message: 'Failed to reset settings', cause: e),
      );
    }
  }
}