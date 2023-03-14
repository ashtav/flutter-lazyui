import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  /// ``` dart
  /// YourWidget().margin() // Only works on widget with no margin property
  /// ```
  Widget margin({double? t, double? b, double? l, double? r, double? v, double? h, double others = 0, double? all}) => Container(
        margin: all != null
            ? EdgeInsets.all(all)
            : EdgeInsets.only(bottom: v ?? b ?? others, top: v ?? t ?? others, left: h ?? l ?? others, right: h ?? r ?? others),
        child: this,
      );

  /// ``` dart
  /// YourWidget().padding() // Only works on widget with no padding property
  /// ```
  Widget padding({double? t, double? b, double? l, double? r, double? v, double? h, double others = 0}) => Padding(
        padding: EdgeInsets.only(bottom: v ?? b ?? others, top: v ?? t ?? others, left: h ?? l ?? others, right: h ?? r ?? others),
        child: this,
      );

  /// ``` dart
  /// YourWidget().clip() // Only works on widget with no clip property
  /// ```
  Widget clip({double? tl, double? tr, double? bl, double? br, double? tlr, double? blr}) => ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(tl ?? tlr ?? 0),
            topRight: Radius.circular(tr ?? tlr ?? 0),
            bottomLeft: Radius.circular(bl ?? blr ?? 0),
            bottomRight: Radius.circular(br ?? blr ?? 0)),
        child: this,
      );
}
