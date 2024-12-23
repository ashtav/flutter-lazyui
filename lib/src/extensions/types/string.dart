part of '../extension.dart';

extension CustomStringExtension on String {
  Color get hex {
    String color = replaceAll('#', '');
    if (color.length == 3) {
      color = color.split('').map((c) => '$c$c').join();
    }
    return Color(int.tryParse('0xff$color') ?? 0xff000000);
  }
}
