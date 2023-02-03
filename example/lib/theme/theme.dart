import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle gfont = GoogleFonts.nunitoSans(fontSize: 15.5, color: Colors.black87);

class Gfont {
  static final fs12 = gfont.copyWith(fontSize: 12);
  static final fs13 = gfont.copyWith(fontSize: 13);
  static final fs14 = gfont.copyWith(fontSize: 14);
  static final fs15 = gfont.copyWith(fontSize: 15);
  static final fs16 = gfont.copyWith(fontSize: 16);
  static final fs17 = gfont.copyWith(fontSize: 17);
  static final fs18 = gfont.copyWith(fontSize: 18);
  static final fs19 = gfont.copyWith(fontSize: 19);
  static final fs20 = gfont.copyWith(fontSize: 20);

  static TextStyle fs(double size) => gfont.copyWith(fontSize: size);
  static TextStyle boldWith([Color color = Colors.black87, double size = 15.5]) =>
      gfont.copyWith(fontWeight: FontWeight.bold, color: color, fontSize: size);
  static TextStyle color(Color color) => gfont.copyWith(color: color);
  static TextStyle bold = gfont.copyWith(fontWeight: FontWeight.bold, color: Colors.black87);
  static TextStyle normal = gfont.copyWith(fontWeight: FontWeight.normal, color: Colors.black87);
}

ThemeData appTheme = ThemeData(
  appBarTheme: AppBarTheme(
    centerTitle: false,
    backgroundColor: Colors.white,
    elevation: .5,
    titleTextStyle: Gfont.fs20,
    iconTheme: const IconThemeData(color: Colors.black87, size: 20),
  ),
  iconTheme: const IconThemeData(color: Colors.black87, size: 20),
  textTheme: TextTheme(
    bodyText1: gfont,
    bodyText2: gfont,
    subtitle1: gfont,
    subtitle2: gfont,
  ),
);
