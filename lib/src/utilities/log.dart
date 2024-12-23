// ignore_for_file: public_member_api_docs

part of 'utilities.dart';

/// Enum representing different log colors.
/// @nodoc
enum LogColor { normal, yellow, blue, green, red, purple, cyan, brightBlue }

/// Map of log colors and their corresponding ANSI escape codes.
Map<LogColor, String> _colors = {
  LogColor.normal: '0m', // normal
  LogColor.yellow: '93m', // yellow
  LogColor.blue: '34m', // blue
  LogColor.green: '32m', // green
  LogColor.red: '31m', // red
  LogColor.purple: '35m', // purple
  LogColor.cyan: '96m', // cyan
  LogColor.brightBlue: '94m', // bright blue
};

/// Colorizes the given [value] with the specified [color].
///
/// Example usage:
/// ```dart
/// String coloredValue = colorize('Hello', LogColor.red);
/// print(coloredValue); // Prints the value 'Hello' in red color.
/// ```
String _colorize(String value, LogColor color) => '\x1B[${_colors[color]}$value\x1B[0m';

/// Prints a log message with optional color, length limit, and name.
///
/// The [value] is the message to be logged.
/// The [color] parameter sets the color of the log message (default: yellow).
/// The [limit] parameter specifies the maximum length of the log message (default: 500).
/// The [name] parameter is an optional name to be displayed along with the log message.
/// The [nolimit] parameter, if set to true, disables the length limit of the log message.
///
/// Example usage:
/// ```dart
/// logg('lorem ipsum', color: LogColor.red, limit: 3000);
/// ```
void logg(dynamic value, {LogColor color = LogColor.yellow, int limit = 500, String? name, bool nolimit = false}) {
  // Get the string representation of the value
  String valueString = '$value';

  // Get a substring of the value based on the limit
  String subStr = '$value'.substring(
      0,
      nolimit
          ? 999999
          : valueString.length > limit
              ? limit
              : valueString.length);

  // Colorize the substring
  String message = _colorize(subStr, color);

  // Add ellipsis if the substring is shorter than the original value
  String logMessage = subStr.length < valueString.length ? '$message.....' : message;

  // Print the log message on the debug console
  log(logMessage, name: name ?? 'LOG');
}
