// ignore_for_file: avoid_print

part of 'util.dart';

/// A utility class for printing styled console messages with ANSI colors.
class Print {
  /// Prints an error message in red with a prefix `[!]`.
  ///
  /// Example:
  /// ```dart
  /// Print.error('This is an error message');
  /// ```
  static error(String message) {
    const red = '\x1B[31m'; // ANSI code for red
    const reset = '\x1B[0m'; // ANSI code to reset to default color
    print('$red[!] $message$reset');
  }

  /// Prints an informational message in green with a prefix `[¡]`.
  ///
  /// Example:
  /// ```dart
  /// Print.info('This is an info message');
  /// ```
  static info(dynamic message) {
    print('\x1B[32m[¡] $message\x1B[0m');
  }
}
