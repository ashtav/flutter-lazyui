import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

Map _config = {
  'radius': 5.0,
  'spacing': 20.0,
  'primary_color': '#212121',
  'text_style': GoogleFonts.nunitoSans(fontSize: 15.5, color: LzColors.black),
};

class LazyUiOptions {
  final double radius, spacing;
  final Color primaryColor;
  final TextStyle? textStyle;

  LazyUiOptions(
      {this.radius = 2,
      this.spacing = 20.0,
      this.primaryColor = Colors.black87,
      this.textStyle});

  Map toMap() => {
        'radius': radius,
        'spacing': spacing,
        'primary_color': primaryColor,
        'text_style': textStyle
      };
}

class LazyUi {
  final double radius, spacing;
  final Color primaryColor;
  final TextStyle? textStyle;

  LazyUi(
      {this.radius = 2,
      this.spacing = 20.0,
      this.primaryColor = Colors.black87,
      this.textStyle});

  /* ------------------------------------------------------------------
  | Get LazyUi Config
  | */

  static LazyUiOptions get getConfig {
    Map config = _config;

    // Get radius
    double radius = config['radius'] is double
        ? config['radius']
        : double.parse(config['radius'].toString());

    // Get spacing
    double spacing = config['spacing'] is double
        ? config['spacing']
        : double.parse(config['spacing'].toString());

    // Get primary color
    Color primaryColor = config['primary_color'] is String
        ? Utils.hex(config['primary_color'])
        : config['primary_color'];

    // Get text style
    TextStyle textStyle = config['text_style'] is TextStyle
        ? config['text_style']
        : GoogleFonts.nunitoSans(fontSize: 16, color: LzColors.black);

    // Return config
    return LazyUiOptions(
        radius: radius,
        spacing: spacing,
        primaryColor: primaryColor,
        textStyle: textStyle);
  }

  // setters
  static void config(
      {double radius = 5.0,
      double spacing = 20.0,
      Color? primaryColor,
      AppTheme theme = AppTheme.system,
      Function()? widgets}) {
    _config['radius'] = radius;
    _config['spacing'] = spacing;
    _config['primary_color'] = primaryColor;

    // set theme
    if (theme == AppTheme.dark) {
      Utils.setSystemUI(navBarColor: Colors.black);
    } else if (theme == AppTheme.light) {
      Utils.setSystemUI(navBarColor: Colors.white);
    } else {
      Utils.setSystemUI();
    }

    widgets?.call();
  }
}

class Lazy {
  static String assets(String value) => 'packages/lazyui/assets/images/$value';
  static TextStyle? textStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium;
}

enum AppTheme { light, dark, system }
