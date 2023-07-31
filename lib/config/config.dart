import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

double _defaultRadius = 5.0;
double _defaultSpacing = 20.0;
Color _defaultPrimaryColor = LzColors.hex('#212121');
TextStyle? _defaultTextStyle;

class LazyUi {
  static void config(
      {double radius = 5.0,
      double spacing = 20.0,
      Color? primaryColor,
      AppTheme theme = AppTheme.system,
      TextStyle? textStyle,
      Function()? widgets}) {
    _defaultRadius = radius;
    _defaultSpacing = spacing;
    _defaultPrimaryColor = primaryColor ?? LzColors.hex('#212121');
    _defaultTextStyle = textStyle;

    if (textStyle?.color == null) {
      _defaultTextStyle = textStyle?.copyWith(color: LzColors.black);
    }

    switch (theme) {
      case AppTheme.dark:
        Utils.setSystemUI(navBarColor: Colors.black);
        break;

      case AppTheme.light:
        Utils.setSystemUI(navBarColor: Colors.white);
        break;
      default:
        Utils.setSystemUI();
    }

    widgets?.call();
  }
}

class Lazy {
  static String assets(String value) => 'packages/lazyui/assets/images/$value';
  static TextStyle textStyle(BuildContext context) =>
      _defaultTextStyle ??
      Theme.of(context).textTheme.bodyMedium ??
      GoogleFonts.nunitoSans(fontSize: 15.5, color: LzColors.black);
  static double getRadius = _defaultRadius;
  static double getSpacing = _defaultSpacing;
  static Color getPrimaryColor = _defaultPrimaryColor;
  static TextStyle get font =>
      _defaultTextStyle ??
      GoogleFonts.nunitoSans(fontSize: 15.5, color: LzColors.black);
}

enum AppTheme { light, dark, system }
