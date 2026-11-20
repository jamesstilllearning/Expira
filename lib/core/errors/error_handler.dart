import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'app_exception.dart';
import 'failure.dart';

/// Global error handler for the application.
/// Catches and logs all uncaught errors.
class ErrorHandler {
  ErrorHandler._();

  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.dateAndTime,
    ),
  );

  /// Initialize global error handlers.
  static void initialize() {
    // Handle Flutter framework errors
    FlutterError.onError = (FlutterErrorDetails details) {
      _logError(
        'Flutter framework error',
        details.exception,
        details.stack,
        context: details.context?.toString(),
      );
    };

    // Handle platform errors (including async errors)
    PlatformDispatcher.instance.onError = (error, stack) {
      _logError(
        'Platform error',
        error,
        stack,
      );
      return true; // Prevent default handling
    };

    // Handle Dart errors in debug mode
    if (kDebugMode) {
      ErrorWidget.builder = (FlutterErrorDetails details) {
        return _ErrorWidget(details: details);
      };
    }
  }

  /// Log an error with context.
  static void logError(
    String message,
    Object error,
    StackTrace? stackTrace, {
    String? context,
    Map<String, Object?>? extra,
  }) {
    _logError(message, error, stackTrace, context: context, extra: extra);
  }

  static void _logError(
    String message,
    Object error,
    StackTrace? stackTrace, {
    String? context,
    Map<String, Object?>? extra,
  }) {
    final buffer = StringBuffer()
      ..writeln('━━━ ERROR ━━━')
      ..writeln('Message: $message')
      ..writeln('Error: $error');

    if (context != null) {
      buffer.writeln('Context: $context');
    }
    if (extra != null && extra.isNotEmpty) {
      buffer.writeln('Extra: $extra');
    }
    if (stackTrace != null) {
      buffer.writeln('Stack trace:');
      buffer.writeln(stackTrace);
    }
    buffer.write('━━━━━━━━━━━━');

    _logger.e(buffer.toString());
  }

  /// Log a warning.
  static void logWarning(
    String message, {
    String? context,
    Map<String, Object?>? extra,
  }) {
    final buffer = StringBuffer()
      ..writeln('⚠️ WARNING')
      ..writeln('Message: $message');
    if (context != null) {
      buffer.writeln('Context: $context');
    }
    if (extra != null && extra.isNotEmpty) {
      buffer.writeln('Extra: $extra');
    }
    buffer.write('━━━━━━━━━━━━');

    _logger.w(buffer.toString());
  }

  /// Log an info message.
  static void logInfo(
    String message, {
    String? context,
    Map<String, Object?>? extra,
  }) {
    final buffer = StringBuffer()
      ..writeln('ℹ️ INFO')
      ..writeln('Message: $message');
    if (context != null) {
      buffer.writeln('Context: $context');
    }
    if (extra != null && extra.isNotEmpty) {
      buffer.writeln('Extra: $extra');
    }
    buffer.write('━━━━━━━━━━━━');

    _logger.i(buffer.toString());
  }

  /// Convert an exception to a Failure.
  static Failure toFailure(Object error, [StackTrace? stackTrace]) {
    if (error is AppException) {
      return Failure.fromException(error);
    }
    if (error is Failure) {
      return error;
    }
    return Failure.unexpected(
      message: error.toString(),
      cause: error,
      stackTrace: stackTrace,
    );
  }

  /// Execute a function and catch any errors, returning a Result.
  static Future<Result<T>> runCatching<T>(Future<T> Function() fn) async {
    try {
      final value = await fn();
      return Result.success(value);
    } catch (error, stackTrace) {
      return Result.failure(toFailure(error, stackTrace));
    }
  }

  /// Execute a synchronous function and catch any errors, returning a Result.
  static Result<T> runCatchingSync<T>(T Function() fn) {
    try {
      final value = fn();
      return Result.success(value);
    } catch (error, stackTrace) {
      return Result.failure(toFailure(error, stackTrace));
    }
  }
}

/// Error widget for debug mode.
class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({required this.details});

  final FlutterErrorDetails details;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.all(24),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 48,
              ),
              const SizedBox(height: 16),
              const Text(
                'Something went wrong',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Container(
                constraints: const BoxConstraints(maxWidth: 600),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SelectableText(
                  details.exception.toString(),
                  style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
                ),
              ),
              const SizedBox(height: 16),
              if (details.stack != null)
                Container(
                  constraints: const BoxConstraints(maxWidth: 600, maxHeight: 300),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SingleChildScrollView(
                    child: SelectableText(
                      details.stack.toString(),
                      style: const TextStyle(fontFamily: 'monospace', fontSize: 10),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}