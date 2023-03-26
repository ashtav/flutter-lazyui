import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

TextStyle gfont = LazyUi.getConfig.textStyle!;

class Gfont {
  // font color
  static final TextStyle black = gfont.copyWith(color: LzColor.black);
  static final TextStyle white = gfont.copyWith(color: Colors.white);
  static final TextStyle red = gfont.copyWith(color: Colors.redAccent);
  static final TextStyle orange = gfont.copyWith(color: LzColor.orange);
  static final TextStyle blue = gfont.copyWith(color: LzColor.blue);
  static final TextStyle green = gfont.copyWith(color: LzColor.green);
  static final TextStyle grey = gfont.copyWith(color: LzColor.grey);

  // font size
  static final TextStyle fs10 = gfont.copyWith(fontSize: 10);
  static final TextStyle fs11 = gfont.copyWith(fontSize: 11);
  static final TextStyle fs12 = gfont.copyWith(fontSize: 12);
  static final TextStyle fs13 = gfont.copyWith(fontSize: 13);
  static final TextStyle fs14 = gfont.copyWith(fontSize: 14);
  static final TextStyle fs15 = gfont.copyWith(fontSize: 15);
  static final TextStyle fs16 = gfont.copyWith(fontSize: 16);
  static final TextStyle fs17 = gfont.copyWith(fontSize: 17);
  static final TextStyle fs18 = gfont.copyWith(fontSize: 18);
  static final TextStyle fs19 = gfont.copyWith(fontSize: 19);
  static final TextStyle fs20 = gfont.copyWith(fontSize: 20);

  static final TextStyle bold = gfont.copyWith(fontWeight: FontWeight.bold);
  static final TextStyle normal = gfont.copyWith(fontWeight: FontWeight.normal);
  static final TextStyle muted = gfont.copyWith(fontWeight: FontWeight.normal, color: Colors.black54);

  static TextStyle fs(double size) => gfont.copyWith(fontSize: size);
  static TextStyle color(Color color) => gfont.copyWith(color: color);
}

extension TextStyleExtension on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get normal => copyWith(fontWeight: FontWeight.normal);
  TextStyle get muted => copyWith(fontWeight: FontWeight.normal, color: Colors.black54);
  TextStyle get white => copyWith(color: Colors.white);
  TextStyle get black => copyWith(color: LzColor.black);

  TextStyle fsize(double size) => copyWith(fontSize: size);
  TextStyle fcolor(Color color) => copyWith(color: color);
  TextStyle fopacity(double opacity) => copyWith(color: color?.withOpacity(opacity));
}
