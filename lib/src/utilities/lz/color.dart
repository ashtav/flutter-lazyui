import 'package:flutter/material.dart';
import 'package:lazyui/src/extensions/extension.dart';

class LzColor {
  Color get blue => '206bc4'.hex;
  Color get azure => '4299e1'.hex;
  Color get indigo => '4263eb'.hex;
  Color get purple => 'ae3ec9'.hex;
  Color get pink => 'd6336c'.hex;
  Color get red => 'd63939'.hex;
  Color get orange => 'f76707'.hex;
  Color get yellow => 'f59f00'.hex;
  Color get lime => '74b816'.hex;
  Color get green => '2fb344'.hex;
  Color get teal => '0ca678'.hex;
  Color get cyan => '17a2b8'.hex;

  Color hex(String code) {
    String color = code.replaceAll('#', '');
    if (color.length == 3) {
      color = color.split('').map((c) => '$c$c').join();
    }
    return Color(int.tryParse('0xff$color') ?? 0xff000000);
  }

  Color invert(Color color) {
    int invertedRed = (255 - (color.r * 255)).toInt();
    int invertedGreen = (255 - (color.g * 255)).toInt();
    int invertedBlue = (255 - (color.b * 255)).toInt();
    int alpha = (color.a * 255).toInt();
    return Color.fromARGB(alpha, invertedRed, invertedGreen, invertedBlue);
  }

  Color random(int index) {
    return Colors.primaries[index % Colors.primaries.length];
  }

  /// Converts the provided [color] into a new [Color] object by blending
  /// it with a white background, effectively removing the transparency.
  ///
  /// The resulting color will look like how the original [color] would appear
  /// on a white background, without any transparency.
  ///
  /// - [color]: The color to be converted, with its transparency blended out.
  ///
  /// Returns a [Color] that represents the original color blended with white.
  Color colorToHex(Color color) {
    double r = color.r * 255;
    double g = color.g * 255;
    double b = color.b * 255;
    double alpha = color.a * 255;

    // Blend with white background (255, 255, 255)
    int red = ((r * alpha) ~/ 255) + (255 * (255 - alpha) ~/ 255);
    int green = ((g * alpha) ~/ 255) + (255 * (255 - alpha) ~/ 255);
    int blue = ((b * alpha) ~/ 255) + (255 * (255 - alpha) ~/ 255);

    // Return the blended color as a fully opaque color
    return Color.fromARGB(255, red, green, blue);
  }
}
