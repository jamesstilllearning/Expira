import 'package:expira/core/errors/failure.dart';
import 'package:expira/core/errors/result.dart';
import 'package:expira/domain/models/user_profile.dart';

/// Repository interface for authentication operations.
abstract class AuthRepository {
  /// Signs in anonymously.
  Future<Result<UserProfile>> signInAnonymously();

  /// Signs in with email and password.
  Future<Result<UserProfile>> signInWithEmail(String email, String password);

  /// Signs in with Google.
  Future<Result<UserProfile>> signInWithGoogle();

  /// Links credentials to an anonymous account.
  Future<Result<UserProfile>> linkCredential(String email, String password);

  /// Signs out the current user.
  Future<Result<void>> signOut();

  /// Watches auth state changes.
  Stream<Result<UserProfile?>> watchAuthState();

  /// Gets the current user profile.
  Future<Result<UserProfile?>> getCurrentUser();

  /// Updates the user profile.
  Future<Result<UserProfile>> updateProfile(UserProfile profile);
}