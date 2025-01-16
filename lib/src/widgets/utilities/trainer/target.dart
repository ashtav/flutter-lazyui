import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'controller.dart';

/// A class that represents the position of a target element.
///
/// It calculates the center and the largest border space needed
/// for displaying focus animations.
class TargetPosition {
  /// The size of the target element.
  final Size size;

  /// The offset position of the target element.
  final Offset offset;

  TargetPosition(this.size, this.offset);

  /// Returns the center of the target element based on its [size] and [offset].
  Offset get center => Offset(
        offset.dx + size.width / 2,
        offset.dy + size.height / 2,
      );

  /// Calculates the larger border space needed based on the screen [size].
  double getBiggerSpaceBorder(Size size) {
    double maxDistanceX =
        center.dx > size.width / 2 ? center.dx : size.width - center.dx;
    double maxDistanceY =
        center.dy > size.height / 2 ? center.dy : size.height - center.dy;
    return max(maxDistanceX, maxDistanceY);
  }
}

/// A class that defines a focusable target with optional customizations.
class TargetFocus {
  /// Identifier for the target.
  final dynamic identify;

  /// The key associated with the target widget.
  final GlobalKey? keyTarget;

  /// Optional list of contents to display alongside the target.
  final List<TargetContent>? contents;

  /// Shape of the highlight around the target.
  final ShapeLightFocus? shape;

  TargetFocus({this.identify, this.keyTarget, this.contents, this.shape})
      : assert(keyTarget != null);
}

/// A class for defining custom positions for target content.
class CustomTargetContentPosition {
  final double? top, left, right, bottom;

  CustomTargetContentPosition({
    this.top,
    this.left,
    this.right,
    this.bottom,
  });
}

/// A class representing the content displayed alongside a target.
class TargetContent {
  /// Alignment of the content relative to the target.
  final ContentAlign align;

  /// Padding applied to the content.
  final EdgeInsets padding;

  /// Builder function for rendering the content.
  final Widget Function(
      BuildContext context, TutorialCoachMarkController controller) builder;

  TargetContent({
    this.align = ContentAlign.bottom,
    this.padding = const EdgeInsets.all(20.0),
    required this.builder,
  });
}

/// Retrieves the current position of a target.
///
/// Throws [NotFoundTargetException] if the target position cannot be determined.
TargetPosition? getTargetCurrent(
  TargetFocus target, {
  bool rootOverlay = false,
}) {
  var key = target.keyTarget!;

  try {
    final RenderBox renderBoxRed =
        key.currentContext!.findRenderObject() as RenderBox;
    final size = renderBoxRed.size;

    BuildContext? context;
    if (rootOverlay) {
      context = key.currentContext!
          .findRootAncestorStateOfType<OverlayState>()
          ?.context;
    } else {
      context = key.currentContext!
          .findAncestorStateOfType<NavigatorState>()
          ?.context;
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

/// Exception thrown when a target position cannot be determined.
class NotFoundTargetException extends FormatException {
  NotFoundTargetException(identify)
      : super('It was not possible to obtain target position ($identify).');
}

/// A class representing a target with content and optional customizations.
class Target {
  final String? content;
  final ContentAlign align;
  final EdgeInsets? padding;
  final ShapeLightFocus? shape;

  const Target({
    this.content,
    this.align = ContentAlign.bottom,
    this.padding,
    this.shape,
  });
}
