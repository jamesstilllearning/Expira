import 'package:expira/core/errors/failure.dart';
import 'package:expira/core/errors/result.dart';
import 'package:expira/domain/models/app_settings.dart';

/// Repository interface for settings operations.
abstract class SettingsRepository {
  /// Loads the current settings.
  Future<Result<AppSettings>> load();

  /// Watches settings changes as a stream.
  Stream<Result<AppSettings>> watch();

  /// Saves settings.
  Future<Result<AppSettings>> save(AppSettings settings);

  /// Resets settings to defaults.
  Future<Result<AppSettings>> reset();
}