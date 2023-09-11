import 'package:flutter/material.dart';

/// CustomRadius is a utility class for creating custom border radii for widgets in Flutter.
///
/// It allows you to define radii for each corner of a widget independently, or use common
/// radii for all corners. This class can be particularly useful when you need to create
/// custom shapes with rounded corners for widgets.
///
/// To convert a CustomRadius instance to a `BorderRadius`, you can use the `getRadius` method.
///
/// Example:
/// ```dart
/// // Creating a CustomRadius with different radii for each corner
/// CustomRadius myCustomRadius = CustomRadius(
///   tl: 10.0,
///   tr: 20.0,
///   bl: 30.0,
///   br: 40.0,
/// );
///
/// // Converting to BorderRadius
/// BorderRadius borderRadius = CustomRadius.getRadius(myCustomRadius);
///
/// // Using the BorderRadius in a BoxDecoration
/// BoxDecoration myBoxDecoration = BoxDecoration(
///   borderRadius: borderRadius,
///   color: Colors.blue,
/// );
/// ```

class CustomRadius {
  final double tl, tr, bl, br;
  final double? tlr, blr, ltb, rtb, others, all;

  CustomRadius(
      {this.tl = 0,
      this.tr = 0,
      this.bl = 0,
      this.br = 0,
      this.tlr,
      this.blr,
      this.ltb,
      this.rtb,
      this.others,
      this.all});

  // convert LzRadius to BorderRadius
  static BorderRadius getRadius(CustomRadius radius) {
    return BorderRadius.only(
      topLeft: Radius.circular(
          radius.all ?? radius.others ?? radius.tlr ?? radius.ltb ?? radius.tl),
      topRight: Radius.circular(
          radius.all ?? radius.others ?? radius.tlr ?? radius.rtb ?? radius.tr),
      bottomLeft: Radius.circular(
          radius.all ?? radius.others ?? radius.blr ?? radius.ltb ?? radius.bl),
      bottomRight: Radius.circular(
          radius.all ?? radius.others ?? radius.blr ?? radius.rtb ?? radius.br),
    );
  }
}
