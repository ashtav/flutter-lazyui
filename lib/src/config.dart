import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazyui/lazyui.dart';

Map _____config = {
  'radius': 2.0,
  'spacing': 20.0,
  'primary_color': '#212121',
  'text_style': GoogleFonts.nunitoSans(fontSize: 16, color: LzColor.black),
  'widgets': {
    'confirm': {'cancel': 'Cancel', 'confirm': 'Yes'},
    'no_data': {'message': 'No Data', 'on_tap_message': 'Tap to refresh'},
  },
};

class LazyUiOptions {
  final double radius, spacing;
  final Color primaryColor;
  final Map widgets;
  final TextStyle? textStyle;

  LazyUiOptions({this.radius = 2, this.spacing = 20.0, this.primaryColor = Colors.black87, this.widgets = const {}, this.textStyle});

  Map toMap() => {'radius': radius, 'spacing': spacing, 'primary_color': primaryColor, 'widgets': widgets};
}

class LazyUi {
  final double radius, spacing;
  final Color primaryColor;
  final Map widgets;
  final TextStyle? textStyle;

  LazyUi({this.radius = 2, this.spacing = 20.0, this.primaryColor = Colors.black87, this.widgets = const {}, this.textStyle});

  /* ------------------------------------------------------------------
  | Get LazyUi Config
  | */

  static LazyUiOptions get getConfig {
    Map config = _____config;

    // Get radius
    double radius = config['radius'] is double ? config['radius'] : double.parse(config['radius'].toString());

    // Get spacing
    double spacing = config['spacing'] is double ? config['spacing'] : double.parse(config['spacing'].toString());

    // Get primary color
    Color primaryColor = config['primary_color'] is String ? Utils.hex(config['primary_color']) : config['primary_color'];

    // Get widgets
    Map widgets = config['widgets'] is Map ? config['widgets'] : {};

    // Get text style
    TextStyle textStyle = config['text_style'] is TextStyle ? config['text_style'] : GoogleFonts.nunitoSans(fontSize: 16, color: LzColor.black);

    // Return config
    return LazyUiOptions(radius: radius, spacing: spacing, primaryColor: primaryColor, widgets: widgets, textStyle: textStyle);
  }

  // setters
  static void config(LazyUiOptions config) => {_____config = config.toMap()};
}

class Lazy {
  static String assets(String value) => 'packages/lazyui/assets/images/$value';
  static TextStyle? textStyle(BuildContext context) => Theme.of(context).textTheme.bodyMedium;
}
