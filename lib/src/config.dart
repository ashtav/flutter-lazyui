import 'package:flutter/material.dart';
import 'package:mixins/mixins.dart';

Map _____config = {
  'radius': 2.0,
  'primary_color': '#212121',
  'widgets': {
    'confirm': {'cancel': 'Cancel', 'confirm': 'Yes'},
    'no_data': {'title': 'No Data', 'on_tap_message': 'Tap to refresh'},
  },
};

class LazyConfig {
  final double radius;
  final Color primaryColor;
  final Map widgets;
  LazyConfig({this.radius = 2, this.primaryColor = Colors.black87, this.widgets = const {}});

  // to map
  Map toMap() => {'radius': radius, 'primary_color': primaryColor, 'widgets': widgets};

  // getters
  static LazyConfig get getConfig {
    Map config = _____config;

    double radius = config['radius'] is double ? config['radius'] : double.parse(config['radius'].toString());
    Color primaryColor = config['primary_color'] is String ? Mixins.hex(config['primary_color']) : config['primary_color'];
    Map widgets = config['widgets'] is Map ? config['widgets'] : {};

    return LazyConfig(radius: radius, primaryColor: primaryColor, widgets: widgets);
  }

  // setters
  static void setConfig(LazyConfig config) => {_____config = config.toMap()};
}
