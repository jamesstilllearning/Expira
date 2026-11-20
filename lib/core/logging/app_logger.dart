import 'package:logger/logger.dart';

/// Application logger wrapper.
/// Provides structured logging with consistent formatting.
/// Uses [LogLevel] from the logger package.

/// Log levels for structured logging.
enum LogLevel {
  debug,
  info,
  warning,
  error,
  critical,
}

/// Application logger wrapper.
/// Provides structured logging with consistent formatting.
class AppLogger {
  AppLogger._();

  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 1,
      errorMethodCount: 3,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.dateAndTime,
    ),
    filter: _LogFilter(),
  );

  /// Log a debug message.
  static void debug(String message, {Map<String, Object?>? extra}) {
    _log(LogLevel.debug, message, extra: extra);
  }

  /// Log an info message.
  static void info(String message, {Map<String, Object?>? extra}) {
    _log(LogLevel.info, message, extra: extra);
  }

  /// Log a warning message.
  static void warning(String message, {Map<String, Object?>? extra}) {
    _log(LogLevel.warning, message, extra: extra);
  }

  /// Log an error message.
  static void error(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    Map<String, Object?>? extra,
  }) {
    _log(LogLevel.error, message, error: error, stackTrace: stackTrace, extra: extra);
  }

  /// Log a critical error message.
  static void critical(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    Map<String, Object?>? extra,
  }) {
    _log(LogLevel.critical, message, error: error, stackTrace: stackTrace, extra: extra);
  }

  static void _log(
    LogLevel level,
    String message, {
    Object? error,
    StackTrace? stackTrace,
    Map<String, Object?>? extra,
  }) {
    final buffer = StringBuffer()
      ..write(message);
    if (extra != null && extra.isNotEmpty) {
      buffer.write(' | $extra');
    }

    switch (level) {
      case LogLevel.debug:
        _logger.d(buffer.toString());
      case LogLevel.info:
        _logger.i(buffer.toString());
      case LogLevel.warning:
        _logger.w(buffer.toString());
      case LogLevel.error:
        _logger.e(buffer.toString(), error: error, stackTrace: stackTrace);
      case LogLevel.critical:
        _logger.f(buffer.toString(), error: error, stackTrace: stackTrace);
    }
  }
}

/// Custom log filter to control verbosity.
class _LogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    // In release mode, only show warnings and above
    const bool isRelease = bool.fromEnvironment('dart.vm.product');
    if (isRelease) {
      // Compare with warning level (index 2)
      return event.level.index >= 2;
    }
    return true;
  }
}