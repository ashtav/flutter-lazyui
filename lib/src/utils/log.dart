import 'dart:developer';

enum LogColor { normal, yellow, blue, green, red, purple, cyan, brightBlue }

Map<LogColor, dynamic> _colors = {
  LogColor.normal: '0m', // normal
  LogColor.yellow: '93m', // yellow
  LogColor.blue: '34m', // blue
  LogColor.green: '32m', // green
  LogColor.red: '31m', // red
  LogColor.purple: '35m', // purple
  LogColor.cyan: '96m', // cyan
  LogColor.brightBlue: '94m', // bright blue
};

String colorize(String value, LogColor color) => '\x1B[${_colors[color]}$value\x1B[0m';

/// ```dart
/// // show on debug console with custom color and limit
/// logg('lorem ipsum', color: LogColor.red, limit: 3000);
/// ```
logg(dynamic value, {LogColor color = LogColor.yellow, int limit = 500, String? name, bool nolimit = false}) {
  // max length
  String valueString = '$value';
  String subStr = '$value'.substring(
      0,
      nolimit
          ? 999999
          : valueString.length > limit
              ? limit
              : valueString.length);

  // print on debug console
  String message = colorize(subStr, color);
  log(subStr.length < valueString.length ? '$message.....' : message, name: name ?? 'LOG');
}

logs(List values, {LogColor color = LogColor.yellow, int limit = 500, String? name}) {
  for (var value in values) {
    logg(value, color: color, limit: limit, name: name);
  }
}
