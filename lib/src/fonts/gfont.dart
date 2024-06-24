import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class Gfont {
  static TextStyle get bold => LazyUi.font.copyWith(fontWeight: Fw.bold);
  static TextStyle fsize(double value) => LazyUi.font.copyWith(fontSize: value);
}

extension TextStyleExtension on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get normal => copyWith(fontWeight: FontWeight.normal);

  TextStyle get muted => copyWith(color: color?.withOpacity(.6));

  TextStyle get white => copyWith(color: Colors.white);

  // TextStyle get black => copyWith(color: Tints.black);

  // TextStyle get red => copyWith(color: Tints.red);

  // TextStyle get orange => copyWith(color: Tints.orange);

  // TextStyle get blue => copyWith(color: Tints.blue);

  // TextStyle get green => copyWith(color: Tints.green);

  // TextStyle get grey => copyWith(color: Tints.grey);

  TextStyle fsize(double size) => copyWith(fontSize: size);

  TextStyle fcolor(Color color) => copyWith(color: color);

  TextStyle fopacity(double opacity) =>
      copyWith(color: color?.withOpacity(opacity));

  TextStyle fbold(bool value) =>
      copyWith(fontWeight: value ? FontWeight.bold : FontWeight.normal);

  TextStyle get fs10 => copyWith(fontSize: 10);
  TextStyle get fs11 => copyWith(fontSize: 11);
  TextStyle get fs12 => copyWith(fontSize: 12);
  TextStyle get fs13 => copyWith(fontSize: 13);
  TextStyle get fs14 => copyWith(fontSize: 14);
  TextStyle get fs15 => copyWith(fontSize: 15);
  TextStyle get fs16 => copyWith(fontSize: 16);
  TextStyle get fs17 => copyWith(fontSize: 17);
  TextStyle get fs18 => copyWith(fontSize: 18);
  TextStyle get fs19 => copyWith(fontSize: 19);
  TextStyle get fs20 => copyWith(fontSize: 20);
}
