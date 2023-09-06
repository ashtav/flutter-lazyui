import 'dart:ui';

import '../utils/utils.dart';

class LzColors {
  static Color get black => Utils.hex('#334155');
  static Color get blue => Utils.hex('#60a5fa');
  static Color get red => Utils.hex('#f87171');
  static Color get green => Utils.hex('#4ade80');
  static Color get orange => Utils.hex('#fb923c');
  static Color get dark => Utils.hex('#0f172a');
  static Color get grey => Utils.hex('#9ca3af');

  /// ```dart
  /// LzColors.lighten(Colors.orange);
  /// ```

  static Color lighten(Color color, {double mixFactor = .5}) {
    // make sure mixFactor is in the range 0.0 to 1.0
    mixFactor = mixFactor.clamp(0.0, 1.0);

    // use the calculated mix factor to create a thinned color
    int red = (color.red * mixFactor + 255 * (1 - mixFactor)).round();
    int green = (color.green * mixFactor + 255 * (1 - mixFactor)).round();
    int blue = (color.blue * mixFactor + 255 * (1 - mixFactor)).round();

    return Color.fromARGB(color.alpha, red, green, blue);
  }

  /// ```dart
  /// LzColors.darken(Colors.orange);
  /// ```

  static Color darken(Color color, {double mixFactor = .5}) {
    // make sure mixFactor is in the range 0.0 to 1.0
    mixFactor = mixFactor.clamp(0.0, 1.0);

    // use the calculated mix factor to create a darkened color
    int red = (color.red * (1 - mixFactor)).round();
    int green = (color.green * (1 - mixFactor)).round();
    int blue = (color.blue * (1 - mixFactor)).round();

    return Color.fromARGB(color.alpha, red, green, blue);
  }

  /// ```dart
  /// LzColors.inverse(Colors.black); // white
  /// ```

  static Color inverse(Color color) {
    int inverted = 0xFFFFFF ^ color.value;
    return Color(inverted).withAlpha(color.alpha);
  }

  /// ```dart
  /// LzColors.isDark(Colors.black); // true
  /// ```

  static bool isDark(Color color) {
    return color.computeLuminance() < 0.5;
  }

  /// ```dart
  /// LzColors.hex('fff'); // white
  /// ```

  static Color hex(String code) {
    return Utils.hex(code);
  }
}
