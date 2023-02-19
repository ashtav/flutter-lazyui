import 'dart:developer';

/// ```dart
/// logg('lorem ipsum', color: 'r');
/// // available colors: yellow (y), blue (b), green (g), red (r), purple (p), cyan (c) and bright blue (bb)
/// ```
logg(dynamic value, {String color = 'y', int limit = 500, String? name}) {
  Map<String, dynamic> colors = {
    'y': '93m', // yellow
    'b': '34m', // blue
    'g': '32m', // green
    'r': '31m', // red
    'p': '35m', // purple
    'c': '96m', // cyan
    'bb': '94m', // bright blue
  };

  // color
  String colorCode = colors[color] ?? '93m';

  // max length
  String valueString = '$value';
  String subStr = '$value'
      .substring(0, valueString.length > limit ? limit : valueString.length);

  // print on debug console
  String message = '\x1B[$colorCode$subStr\x1B[0m';
  log(subStr.length < valueString.length ? '$message.....' : message,
      name: name ?? 'LOG');
}
