import 'dart:developer';

/// ```dart
/// logg('lorem ipsum', color: 'r');
/// // available colors: yellow (y), blue (b), green (g), red (r), purple (p), cyan (c) and bright blue (bb)
/// ```

enum LogColor { normal, yellow, blue, green, red, purple, cyan, brightBlue }

Map<LogColor, dynamic> colors = {
  LogColor.normal: '0m', // normal
  LogColor.yellow: '93m', // yellow
  LogColor.blue: '34m', // blue
  LogColor.green: '32m', // green
  LogColor.red: '31m', // red
  LogColor.purple: '35m', // purple
  LogColor.cyan: '96m', // cyan
  LogColor.brightBlue: '94m', // bright blue
};

String colorize(String value, LogColor color) => '\x1B[${colors[color]}$value\x1B[0m';

void logg(dynamic value, {LogColor color = LogColor.yellow, int limit = 500, String? name}) {
  // max length
  String valueString = '$value';
  String subStr = '$value'.substring(0, valueString.length > limit ? limit : valueString.length);

  // print on debug console
  String message = colorize(subStr, colors[color]);
  log(subStr.length < valueString.length ? '$message.....' : message, name: name ?? 'LOG');
}
