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
      spacing: spacing,
      children: newChildren,
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
