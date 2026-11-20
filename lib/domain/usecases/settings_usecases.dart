import 'package:expira/core/errors/failure.dart';
import 'package:expira/domain/models/app_settings.dart';
import 'package:expira/domain/repositories/settings_repository.dart';

/// Use case for loading app settings.
class GetAppSettingsUseCase {
  GetAppSettingsUseCase(this._repository);

  final SettingsRepository _repository;

  Future<Result<AppSettings>> call() => _repository.load();
}

/// Use case for watching app settings as a stream.
class WatchAppSettingsUseCase {
  WatchAppSettingsUseCase(this._repository);

  final SettingsRepository _repository;

  Stream<Result<AppSettings>> call() => _repository.watch();
}

/// Use case for saving app settings.
class SaveAppSettingsUseCase {
  SaveAppSettingsUseCase(this._repository);

  final SettingsRepository _repository;

  Future<Result<AppSettings>> call(AppSettings settings) =>
      _repository.save(settings);
}

/// Use case for resetting app settings to defaults.
class ResetAppSettingsUseCase {
  ResetAppSettingsUseCase(this._repository);

  final SettingsRepository _repository;

  Future<Result<AppSettings>> call() => _repository.reset();
}