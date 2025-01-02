import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class TargetPosition {
  final Size size;
  final Offset offset;

  TargetPosition(this.size, this.offset);

  Offset get center => Offset(
        offset.dx + size.width / 2,
        offset.dy + size.height / 2,
      );

  double getBiggerSpaceBorder(Size size) {
    double maxDistanceX = center.dx > size.width / 2 ? center.dx : size.width - center.dx;
    double maxDistanceY = center.dy > size.height / 2 ? center.dy : size.height - center.dy;
    return max(maxDistanceX, maxDistanceY);
  }
}

class TargetFocus {
  TargetFocus({this.identify, this.keyTarget, this.contents, this.shape}) : assert(keyTarget != null);

  final dynamic identify;
  final GlobalKey? keyTarget;
  final List<TargetContent>? contents;
  final ShapeLightFocus? shape;
}

class CustomTargetContentPosition {
  CustomTargetContentPosition({
    this.top,
    this.left,
    this.right,
    this.bottom,
  });

  final double? top, left, right, bottom;
}

class TargetContent {
  TargetContent({
    this.align = ContentAlign.bottom,
    this.padding = const EdgeInsets.all(20.0),
    required this.builder,
  });

  final ContentAlign align;
  final EdgeInsets padding;
  final Widget Function(BuildContext context, TutorialCoachMarkController controller) builder;
}

TargetPosition? getTargetCurrent(
  TargetFocus target, {
  bool rootOverlay = false,
}) {
  var key = target.keyTarget!;

  try {
    final RenderBox renderBoxRed = key.currentContext!.findRenderObject() as RenderBox;
    final size = renderBoxRed.size;

    BuildContext? context;
    if (rootOverlay) {
      context = key.currentContext!.findRootAncestorStateOfType<OverlayState>()?.context;
    } else {
      context = key.currentContext!.findAncestorStateOfType<NavigatorState>()?.context;
    }
    Offset offset;
    if (context != null) {
      offset = renderBoxRed.localToGlobal(
        Offset.zero,
        ancestor: context.findRenderObject(),
      );
    } else {
      offset = renderBoxRed.localToGlobal(Offset.zero);
    }

    return TargetPosition(size, offset);
  } catch (e) {
    throw NotFoundTargetException(target.identify);
  }
}

class NotFoundTargetException extends FormatException {
  NotFoundTargetException(identify) : super('It was not possible to obtain target position ($identify).');
}

class Target {
  final String? title;
  final String? description;
  final ContentAlign align;
  final EdgeInsets? padding;
  final ShapeLightFocus? shape;

  const Target({this.title, this.description, this.align = ContentAlign.bottom, this.padding, this.shape});
}
