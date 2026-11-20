/// Base exception class for all application errors.
sealed class AppException implements Exception {
  const AppException();

  /// An unexpected error occurred.
  static AppException unexpected({
    required String message,
    Object? cause,
    StackTrace? stackTrace,
  }) => UnexpectedException(message: message, cause: cause, stackTrace: stackTrace);

  /// A network-related error occurred.
  static AppException network({
    required String message,
    Object? cause,
  }) => NetworkException(message: message, cause: cause);

  /// The requested resource was not found.
  static AppException notFound({
    required String message,
    String? resourceId,
  }) => NotFoundException(message: message, resourceId: resourceId);

  /// The operation is not authorized.
  static AppException unauthorized({
    required String message,
  }) => UnauthorizedException(message: message);

  /// The operation is forbidden (insufficient permissions).
  static AppException forbidden({
    required String message,
  }) => ForbiddenException(message: message);

  /// A validation error occurred.
  static AppException validation({
    required String message,
    Map<String, String>? fields,
  }) => ValidationException(message: message, fields: fields);

  /// A conflict occurred (e.g., concurrent modification).
  static AppException conflict({
    required String message,
    Object? serverData,
  }) => ConflictException(message: message, serverData: serverData);

  /// Local storage error.
  static AppException storage({
    required String message,
    Object? cause,
  }) => StorageException(message: message, cause: cause);

  /// Database error.
  static AppException database({
    required String message,
    Object? cause,
  }) => DatabaseException(message: message, cause: cause);

  /// Sync error between local and remote.
  static AppException sync({
    required String message,
    Object? cause,
    List<String>? failedOperations,
  }) => SyncException(message: message, cause: cause, failedOperations: failedOperations);

  /// Returns a user-friendly message for display.
  String get userMessage => switch (this) {
    UnexpectedException(:final message) => 'Something went wrong: $message',
    NetworkException(:final message) => 'Network error: $message',
    NotFoundException(:final message) => 'Not found: $message',
    UnauthorizedException(:final message) => 'Please sign in to continue: $message',
    ForbiddenException(:final message) => 'You do not have permission: $message',
    ValidationException(:final message) => 'Invalid input: $message',
    ConflictException(:final message) => 'Conflict: $message',
    StorageException(:final message) => 'Storage error: $message',
    DatabaseException(:final message) => 'Database error: $message',
    SyncException(:final message) => 'Sync error: $message',
  };
}

/// An unexpected error occurred.
class UnexpectedException extends AppException {
  const UnexpectedException({
    required this.message,
    this.cause,
    this.stackTrace,
  });

  final String message;
  final Object? cause;
  final StackTrace? stackTrace;

  @override
  String toString() => 'UnexpectedException: $message';
}

/// A network-related error occurred.
class NetworkException extends AppException {
  const NetworkException({
    required this.message,
    this.cause,
  });

  final String message;
  final Object? cause;

  @override
  String toString() => 'NetworkException: $message';
}

/// The requested resource was not found.
class NotFoundException extends AppException {
  const NotFoundException({
    required this.message,
    this.resourceId,
  });

  final String message;
  final String? resourceId;

  @override
  String toString() => 'NotFoundException: $message';
}

/// The operation is not authorized.
class UnauthorizedException extends AppException {
  const UnauthorizedException({required this.message});

  final String message;

  @override
  String toString() => 'UnauthorizedException: $message';
}

/// The operation is forbidden (insufficient permissions).
class ForbiddenException extends AppException {
  const ForbiddenException({required this.message});

  final String message;

  @override
  String toString() => 'ForbiddenException: $message';
}

/// A validation error occurred.
class ValidationException extends AppException {
  const ValidationException({
    required this.message,
    this.fields,
  });

  final String message;
  final Map<String, String>? fields;

  @override
  String toString() => 'ValidationException: $message';
}

/// A conflict occurred (e.g., concurrent modification).
class ConflictException extends AppException {
  const ConflictException({
    required this.message,
    this.serverData,
  });

  final String message;
  final Object? serverData;

  @override
  String toString() => 'ConflictException: $message';
}

/// Local storage error.
class StorageException extends AppException {
  const StorageException({
    required this.message,
    this.cause,
  });

  final String message;
  final Object? cause;

  @override
  String toString() => 'StorageException: $message';
}

/// Database error.
class DatabaseException extends AppException {
  const DatabaseException({
    required this.message,
    this.cause,
  });

  final String message;
  final Object? cause;

  @override
  String toString() => 'DatabaseException: $message';
}

/// Sync error between local and remote.
class SyncException extends AppException {
  const SyncException({
    required this.message,
    this.cause,
    this.failedOperations,
  });

  final String message;
  final Object? cause;
  final List<String>? failedOperations;

  @override
  String toString() => 'SyncException: $message';
}