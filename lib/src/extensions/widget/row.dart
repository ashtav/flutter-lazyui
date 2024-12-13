part of '../extension.dart';

/// Extension on [Row] providing custom methods.
extension CustomRowExtension on Row {
  /// ``` dart
  /// // This extension is used to align the children of a Row to the end.
  ///
  /// Row(
  ///   children: [ Text('Hello'), Text('World') ]
  /// ).end,
  /// ```
  Row get end => Row(
        key: key,
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
        key: key,
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
        key: key,
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
        key: key,
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
        key: key,
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
        key: key,
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
  Row gap(double spacing, {List<int> except = const []}) {
    List<Widget> newChildren = [];

    for (int i = 0; i < children.length; i++) {
      newChildren.add(children[i]);
      if (i != children.length - 1) {
        if (!except.contains(i)) {
          newChildren.add(SizedBox(width: spacing));
        }
      }
    }

    return Row(
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

  /// An extension on [Row] to reverse the order of its children.
  ///
  /// This extension provides a `reversed` getter, which returns a new [Row]
  /// with the same properties as the original, but with its children in reverse order.
  ///
  /// Usage:
  /// ```dart
  /// Row(
  ///   children: [Text('One'), Text('Two'), Text('Three')],
  /// ).reversed
  /// ```
  ///
  /// This will display the children in reverse order: 'Three', 'Two', 'One'.
  Row get reversed {
    return Row(
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
