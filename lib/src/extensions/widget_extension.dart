import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  /// ``` dart
  /// YourWidget().margin() // Only works on widget with no margin property
  /// ```
  Widget margin({double? t, double? b, double? l, double? r, double? v, double? h, double others = 0}) => Container(
        margin: EdgeInsets.only(bottom: v ?? b ?? others, top: v ?? t ?? others, left: h ?? l ?? others, right: h ?? r ?? others),
        child: this,
      );

  /// ``` dart
  /// YourWidget().padding() // Only works on widget with no padding property
  /// ```
  Widget padding({double? t, double? b, double? l, double? r, double? v, double? h, double others = 0}) => Padding(
        padding: EdgeInsets.only(bottom: v ?? b ?? others, top: v ?? t ?? others, left: h ?? l ?? others, right: h ?? r ?? others),
        child: this,
      );
}
