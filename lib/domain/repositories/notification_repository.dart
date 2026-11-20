import 'package:expira/core/errors/failure.dart';
import 'package:expira/core/errors/result.dart';

/// Repository interface for notification token operations.
abstract class NotificationRepository {
  /// Registers an FCM token for the current user.
  Future<Result<void>> registerToken({
    required String userId,
    required String token,
    required String platform,
  });

  /// Unregisters the FCM token for the current user.
  Future<Result<void>> unregisterToken(String userId);

  /// Watches token changes.
  Stream<Result<String?>> watchToken(String userId);
}