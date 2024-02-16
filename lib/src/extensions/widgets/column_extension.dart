part of extension;

extension CustomColumnExtension on Column {
  /// ``` dart
  /// // This extension is used to align the children of a column to the start.
  ///
  /// Column(
  ///   children: [ Text('Hello'), Text('World') ]
  /// ).start,
  /// ```

  Column get start => Column(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: Caa.start,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: children,
      );

  /// ``` dart
  /// // This extension is used to align the children of a column to the end.
  ///
  /// Column(
  ///   children: [ Text('Hello'), Text('World') ]
  /// ).end,
  /// ```

  Column get end => Column(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: Caa.end,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: children,
      );

  /// ``` dart
  /// // This extension is used to align the children of a column to the stretch.
  ///
  /// Column(
  ///   children: [ Text('Hello'), Text('World') ]
  /// ).stretch,
  /// ```

  Column get stretch => Column(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: Caa.stretch,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: children,
      );

  /// ``` dart
  /// // This extension is used to set column size to the minimum.
  ///
  /// Column(
  ///   children: [ Text('Hello'), Text('World') ]
  /// ).min,
  /// ```
  Column get min => Column(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: children,
      );

  Column get center => Column(
        mainAxisAlignment: Maa.center,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: children,
      );

  Column gap(double spacing) {
    List<Widget> newChildren = [];

    for (int i = 0; i < children.length; i++) {
      newChildren.add(children[i]);
      if (i != children.length - 1) {
        newChildren.add(SizedBox(height: spacing));
      }
    }

    return Column(
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
