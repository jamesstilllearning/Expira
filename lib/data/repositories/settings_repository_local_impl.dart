import 'package:expira/core/errors/failure.dart';
import 'package:expira/data/datasources/local/settings_local_data_source.dart';
import 'package:expira/domain/models/app_settings.dart';
import 'package:expira/domain/repositories/settings_repository.dart';

/// Local implementation of SettingsRepository using SharedPreferences.
class SettingsRepositoryLocalImpl implements SettingsRepository {
  SettingsRepositoryLocalImpl(this._dataSource);

  final SettingsLocalDataSource _dataSource;

  @override
  Future<Result<AppSettings>> load() => _dataSource.load();

  @override
  Stream<Result<AppSettings>> watch() => _dataSource.watch();

  @override
  Future<Result<AppSettings>> save(AppSettings settings) => _dataSource.save(settings);

  @override
  Future<Result<AppSettings>> reset() => _dataSource.reset();
}