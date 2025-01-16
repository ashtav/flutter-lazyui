part of '../extension.dart';

extension CustomColumnExtension on Column {
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
      // spacing: spacing,
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
      spacing: spacing,
      children: children.reversed.toList(),
    );
  }

  Column get start => Column(
        key: key,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: Caa.start,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        spacing: spacing,
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
        spacing: spacing,
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
        spacing: spacing,
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
        spacing: spacing,
        children: children,
      );

  Center get centered => Center(
        child: Column(
          key: key,
          mainAxisAlignment: Maa.center,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          textBaseline: textBaseline,
          spacing: spacing,
          children: children,
        ),
      );
}
