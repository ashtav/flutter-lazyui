import 'package:flutter/material.dart';

import 'utils/utils.dart';

Map _____config = {
  'radius': 2.0,
  'primary_color': '#212121',
  'text_style': const TextStyle(color: Colors.black87, fontSize: 16),
  'widgets': {
    'confirm': {'cancel': 'Cancel', 'confirm': 'Yes'},
    'no_data': {'message': 'No Data', 'on_tap_message': 'Tap to refresh'},
  },
};

class LazyConfig {
  final double radius;
  final Color primaryColor;
  final Map widgets;
  final TextStyle? textStyle;
  LazyConfig({this.radius = 2, this.primaryColor = Colors.black87, this.widgets = const {}, this.textStyle});

  // to map
  Map toMap() => {'radius': radius, 'primary_color': primaryColor, 'widgets': widgets};

  // getters
  static LazyConfig get getConfig {
    Map config = _____config;

    // Get radius
    double radius = config['radius'] is double ? config['radius'] : double.parse(config['radius'].toString());

    // Get primary color
    Color primaryColor = config['primary_color'] is String ? Utils.hex(config['primary_color']) : config['primary_color'];

    // Get widgets
    Map widgets = config['widgets'] is Map ? config['widgets'] : {};

    // Get text style
    TextStyle textStyle = config['text_style'] is TextStyle ? config['text_style'] : const TextStyle(color: Colors.black87, fontSize: 16);

    // Return config
    return LazyConfig(radius: radius, primaryColor: primaryColor, widgets: widgets, textStyle: textStyle);
  }

  // setters
  static void setConfig(LazyConfig config) => {_____config = config.toMap()};
}
