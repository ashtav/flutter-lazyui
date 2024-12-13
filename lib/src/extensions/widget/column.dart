part of '../extension.dart';

/// Extension on [Column] providing custom methods.
extension CustomColumnExtension on Column {
  /// ``` dart
  /// // This extension is used to align the children of a column to the start.
  ///
  /// Column(
  ///   children: [ Text('Hello'), Text('World') ]
  /// ).start,
  /// ```

  Column get start => Column(
        key: key,
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
        key: key,
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
        key: key,
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
        key: key,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: children,
      );

  /// Returns a [Column] widget with center alignment and specified parameters.
  ///
  /// [mainAxisAlignment]: How the children should be placed along the main axis.
  /// [mainAxisSize]: How much space should be occupied in the main axis.
  /// [crossAxisAlignment]: How the children should be placed along the cross axis.
  /// [textDirection]: The reading order of the text.
  /// [verticalDirection]: The vertical direction in which children should be placed.
  /// [textBaseline]: A baseline that aligns the children vertically.
  /// [children]: The widgets to display in the column.
  ///
  /// Returns a [Column] widget with the specified parameters.
  Column get center => Column(
        key: key,
        mainAxisAlignment: Maa.center,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: children,
      );

  /// Adds spacing between children in a [Column] widget.
  ///
  /// [spacing]: The height of the space to add between children.
  ///
  /// Returns a [Column] widget with spacing added between its children.
  Column gap(double spacing, {List<int> except = const []}) {
    List<Widget> newChildren = [];

    for (int i = 0; i < children.length; i++) {
      newChildren.add(children[i]);
      if (i != children.length - 1) {
        if (!except.contains(i)) {
          newChildren.add(SizedBox(height: spacing));
        }
      }
    }

    return Column(
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: newChildren,
    );
  }

  /// Returns a new [Column] with children in reverse order.
  Column get reversed {
    return Column(
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: children.reversed.toList(),
    );
  }
}
