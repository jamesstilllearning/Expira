import 'app_exception.dart';

/// Represents a failure result from an operation.
/// Uses functional error handling instead of throwing exceptions.
sealed class Failure {
  const Failure();

  /// An unexpected error occurred.
  static Failure unexpected({
    required String message,
    Object? cause,
    StackTrace? stackTrace,
  }) => UnexpectedFailure(message: message, cause: cause, stackTrace: stackTrace);

  /// A network-related error occurred.
  static Failure network({
    required String message,
    Object? cause,
  }) => NetworkFailure(message: message, cause: cause);

  /// The requested resource was not found.
  static Failure notFound({
    required String message,
    String? resourceId,
  }) => NotFoundFailure(message: message, resourceId: resourceId);

  /// The operation is not authorized.
  static Failure unauthorized({
    required String message,
  }) => UnauthorizedFailure(message: message);

  /// The operation is forbidden (insufficient permissions).
  static Failure forbidden({
    required String message,
  }) => ForbiddenFailure(message: message);

  /// A validation error occurred.
  static Failure validation({
    required String message,
    Map<String, String>? fields,
  }) => ValidationFailure(message: message, fields: fields);

  /// A conflict occurred (e.g., concurrent modification).
  static Failure conflict({
    required String message,
    Object? serverData,
  }) => ConflictFailure(message: message, serverData: serverData);

  /// Local storage error.
  static Failure storage({
    required String message,
    Object? cause,
  }) => StorageFailure(message: message, cause: cause);

  /// Database error.
  static Failure database({
    required String message,
    Object? cause,
    StackTrace? stackTrace,
  }) => DatabaseFailure(message: message, cause: cause, stackTrace: stackTrace);

  /// Sync error between local and remote.
  static Failure sync({
    required String message,
    Object? cause,
    List<String>? failedOperations,
  }) => SyncFailure(message: message, cause: cause, failedOperations: failedOperations);

  /// Creates a Failure from an AppException.
  static Failure fromException(AppException exception) => switch (exception) {
    UnexpectedException(:final message, :final cause, :final stackTrace) =>
      Failure.unexpected(message: message, cause: cause, stackTrace: stackTrace),
    NetworkException(:final message, :final cause) =>
      Failure.network(message: message, cause: cause),
    NotFoundException(:final message, :final resourceId) =>
      Failure.notFound(message: message, resourceId: resourceId),
    UnauthorizedException(:final message) =>
      Failure.unauthorized(message: message),
    ForbiddenException(:final message) =>
      Failure.forbidden(message: message),
    ValidationException(:final message, :final fields) =>
      Failure.validation(message: message, fields: fields),
    ConflictException(:final message, :final serverData) =>
      Failure.conflict(message: message, serverData: serverData),
    StorageException(:final message, :final cause) =>
      Failure.storage(message: message, cause: cause),
    DatabaseException(:final message, :final cause) =>
      Failure.database(message: message, cause: cause, stackTrace: null),
    SyncException(:final message, :final cause, :final failedOperations) =>
      Failure.sync(message: message, cause: cause, failedOperations: failedOperations),
  };

  /// Returns a user-friendly message for display.
  String get userMessage => switch (this) {
    UnexpectedFailure(message: final msg) => 'Something went wrong: $msg',
    NetworkFailure(message: final msg) => 'Network error: $msg',
    NotFoundFailure(message: final msg) => 'Not found: $msg',
    UnauthorizedFailure(message: final msg) => 'Please sign in to continue: $msg',
    ForbiddenFailure(message: final msg) => 'You do not have permission: $msg',
    ValidationFailure(message: final msg) => 'Invalid input: $msg',
    ConflictFailure(message: final msg) => 'Conflict: $msg',
    StorageFailure(message: final msg) => 'Storage error: $msg',
    DatabaseFailure(message: final msg) => 'Database error: $msg',
    SyncFailure(message: final msg) => 'Sync error: $msg',
  };
}

/// An unexpected error occurred.
class UnexpectedFailure extends Failure {
  const UnexpectedFailure({
    required this.message,
    this.cause,
    this.stackTrace,
  });

  final String message;
  final Object? cause;
  final StackTrace? stackTrace;

  @override
  String toString() => 'UnexpectedFailure: $message';
}

/// A network-related error occurred.
class NetworkFailure extends Failure {
  const NetworkFailure({
    required this.message,
    this.cause,
  });

  final String message;
  final Object? cause;

  @override
  String toString() => 'NetworkFailure: $message';
}

/// The requested resource was not found.
class NotFoundFailure extends Failure {
  const NotFoundFailure({
    required this.message,
    this.resourceId,
  });

  final String message;
  final String? resourceId;

  @override
  String toString() => 'NotFoundFailure: $message';
}

/// The operation is not authorized.
class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({required this.message});

  final String message;

  @override
  String toString() => 'UnauthorizedFailure: $message';
}

/// The operation is forbidden (insufficient permissions).
class ForbiddenFailure extends Failure {
  const ForbiddenFailure({required this.message});

  final String message;

  @override
  String toString() => 'ForbiddenFailure: $message';
}

/// A validation error occurred.
class ValidationFailure extends Failure {
  const ValidationFailure({
    required this.message,
    this.fields,
  });

  final String message;
  final Map<String, String>? fields;

  @override
  String toString() => 'ValidationFailure: $message';
}

/// A conflict occurred (e.g., concurrent modification).
class ConflictFailure extends Failure {
  const ConflictFailure({
    required this.message,
    this.serverData,
  });

  final String message;
  final Object? serverData;

  @override
  String toString() => 'ConflictFailure: $message';
}

/// Local storage error.
class StorageFailure extends Failure {
  const StorageFailure({
    required this.message,
    this.cause,
  });

  final String message;
  final Object? cause;

  @override
  String toString() => 'StorageFailure: $message';
}

/// Database error.
class DatabaseFailure extends Failure {
  const DatabaseFailure({
    required this.message,
    this.cause,
    this.stackTrace,
  });

  final String message;
  final Object? cause;
  final StackTrace? stackTrace;

  @override
  String toString() => 'DatabaseFailure: $message';
}

/// Sync error between local and remote.
class SyncFailure extends Failure {
  const SyncFailure({
    required this.message,
    this.cause,
    this.failedOperations,
  });

  final String message;
  final Object? cause;
  final List<String>? failedOperations;

  @override
  String toString() => 'SyncFailure: $message';
}

/// Result type for operations that can fail.
/// Use [Result.success] for success or [Result.failure] for failure.
sealed class Result<T> {
  const Result();

  /// Creates a successful result.
  factory Result.success(T value) => Success<T>(value);

  /// Creates a failure result.
  factory Result.failure(Failure failure) => FailureResult<T>(failure);

  /// Returns true if this is a success result.
  bool get isSuccess => this is Success<T>;

  /// Returns true if this is a failure result.
  bool get isFailure => this is FailureResult<T>;

  /// Returns the value if success, throws if failure.
  T getOrThrow() => switch (this) {
    Success(:final value) => value,
    FailureResult(:final failure) => throw failure,
  };

  /// Returns the value if success, or [defaultValue] if failure.
  T getOrElse(T defaultValue) => switch (this) {
    Success(:final value) => value,
    FailureResult() => defaultValue,
  };

  /// Maps the success value to a new type.
  Result<U> map<U>(U Function(T value) transform) => switch (this) {
    Success(:final value) => Result.success(transform(value)),
    FailureResult(:final failure) => Result.failure(failure),
  };

  /// Flat maps the success value to a new Result.
  Result<U> flatMap<U>(Result<U> Function(T value) transform) => switch (this) {
    Success(:final value) => transform(value),
    FailureResult(:final failure) => Result.failure(failure),
  };

  /// Recovers from failure by providing a fallback value.
  Result<T> recover(T Function(Failure failure) fallback) => switch (this) {
    Success(:final value) => Result.success(value),
    FailureResult(:final failure) => Result.success(fallback(failure)),
  };

  /// Recovers from failure by providing a fallback Result.
  Result<T> recoverWith(Result<T> Function(Failure failure) fallback) => switch (this) {
    Success(:final value) => Result.success(value),
    FailureResult(:final failure) => fallback(failure),
  };
}

/// Successful result containing a value.
class Success<T> extends Result<T> {
  const Success(this.value);

  final T value;

  @override
  String toString() => 'Success($value)';
}

/// Failure result containing a failure.
class FailureResult<T> extends Result<T> {
  const FailureResult(this.failure);

  final Failure failure;

  @override
  String toString() => 'FailureResult($failure)';
}