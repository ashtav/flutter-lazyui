import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../config/config.dart';

class Gfont {
  static TextStyle get(BuildContext context) {
    TextStyle? style = Theme.of(context).textTheme.bodyMedium;
    return style!.copyWith(color: LzTheme.isDarkMode ? '888888'.hex : '404040'.hex);
  }

  // font color
  static final TextStyle black = config.font.copyWith(color: Lz.color.hex('1A1A1A'));
  static final TextStyle white = config.font.copyWith(color: Colors.white);
  static final TextStyle red = config.font.copyWith(color: Colors.redAccent);
  static final TextStyle orange = config.font.copyWith(color: Colors.orange);
  static final TextStyle green = config.font.copyWith(color: Colors.green);
  static final TextStyle muted = config.font.copyWith(color: '404040'.hex);
  static TextStyle color(Color color) => config.font.copyWith(color: color);

  // font size
  static final TextStyle fs10 = config.font.copyWith(fontSize: 10);
  static final TextStyle fs11 = config.font.copyWith(fontSize: 11);
  static final TextStyle fs12 = config.font.copyWith(fontSize: 12);
  static final TextStyle fs13 = config.font.copyWith(fontSize: 13);
  static final TextStyle fs14 = config.font.copyWith(fontSize: 14);
  static final TextStyle fs15 = config.font.copyWith(fontSize: 15);
  static final TextStyle fs16 = config.font.copyWith(fontSize: 16);
  static final TextStyle fs17 = config.font.copyWith(fontSize: 17);
  static final TextStyle fs18 = config.font.copyWith(fontSize: 18);
  static final TextStyle fs19 = config.font.copyWith(fontSize: 19);
  static final TextStyle fs20 = config.font.copyWith(fontSize: 20);
  static TextStyle fsize(double size) => config.font.copyWith(fontSize: size);

  // font style
  static final TextStyle bold = config.font.copyWith(fontWeight: Fw.bold);
  static final TextStyle italic = config.font.copyWith(fontStyle: FontStyle.italic);
  static final TextStyle underline = config.font.copyWith(decoration: TextDecoration.underline);
  static final TextStyle strike = config.font.copyWith(decoration: TextDecoration.lineThrough);
  static TextStyle fbold(bool value) => config.font.copyWith(fontWeight: value ? Fw.bold : Fw.normal);
}

extension CustomTextStyleExtension on TextStyle {
  // font color
  TextStyle get black => copyWith(color: Lz.color.hex('1A1A1A'));
  TextStyle get white => copyWith(color: Colors.white);
  TextStyle get red => copyWith(color: Colors.redAccent);
  TextStyle get orange => copyWith(color: Colors.orange);
  TextStyle get green => copyWith(color: Colors.green);
  TextStyle get muted => copyWith(color: '707070'.hex);
  TextStyle fcolor(Color color) => copyWith(color: color);

  // font size
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
  TextStyle fsize(double size) => copyWith(fontSize: size);

  // font style
  TextStyle get normal => copyWith(fontWeight: FontWeight.normal);
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
  TextStyle get strike => copyWith(decoration: TextDecoration.lineThrough);
  TextStyle fbold(bool value) => copyWith(fontWeight: value ? Fw.bold : Fw.normal);

  // set font color based on theme
  TextStyle theme(BuildContext context, Color color) {
    TextStyle style = Theme.of(context).textTheme.bodyMedium ?? config.font;
    return style.copyWith(color: LzTheme.isDarkMode ? color : this.color);
  }
}
