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

  /// ``` dart
  /// // This extension is used to set the main axis size of a Row to min.
  /// // This means that the Row will take up the minimum amount of space
  ///
  /// Row(
  ///  children: [ Text('Hello'), Text('World') ]
  /// ).min,

  Row get min => Row(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: children,
      );

  /// Adds spacing between children in a [Row] widget.
  ///
  /// [spacing]: The width of the space to add between children.
  ///
  /// Returns a [Row] widget with spacing added between its children.
  Row gap(double spacing) {
    List<Widget> newChildren = [];

    for (int i = 0; i < children.length; i++) {
      newChildren.add(children[i]);
      if (i != children.length - 1) {
        newChildren.add(SizedBox(width: spacing));
      }
    }

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: newChildren,
    );
  }
}
