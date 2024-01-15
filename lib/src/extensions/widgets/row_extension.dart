part of extension;

extension CustomRowExtension on Row {
  /// ``` dart
  /// // This extension is used to align the children of a Row to the end.
  ///
  /// Row(
  ///   children: [ Text('Hello'), Text('World') ]
  /// ).end,
  /// ```
  Row get end => Row(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: Maa.end,
        mainAxisSize: mainAxisSize,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: children,
      );

  /// ``` dart
  /// // This extension is used to align the children of a Row to the start.
  ///
  /// Row(
  ///   children: [ Text('Hello'), Text('World') ]
  /// ).start,
  /// ```
  Row get between => Row(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: Maa.spaceBetween,
        mainAxisSize: mainAxisSize,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: children,
      );

  /// ``` dart
  /// // This extension is used to align the children of a Row to the around.
  ///
  /// Row(
  ///   children: [ Text('Hello'), Text('World') ]
  /// ).around,
  /// ```
  Row get around => Row(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: Maa.spaceAround,
        mainAxisSize: mainAxisSize,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: children,
      );

  /// ``` dart
  /// // This extension is used to align the children of a Row to the evenly.
  ///
  /// Row(
  ///   children: [ Text('Hello'), Text('World') ]
  /// ).evenly,
  /// ```
  Row get evenly => Row(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: Maa.spaceEvenly,
        mainAxisSize: mainAxisSize,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: children,
      );

  /// ``` dart
  /// // This extension is used to align the children of a Row to the center.
  ///
  /// Row(
  ///   children: [ Text('Hello'), Text('World') ]
  /// ).center,
  /// ```
  Row get center => Row(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: Maa.center,
        mainAxisSize: mainAxisSize,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: children,
      );
}
