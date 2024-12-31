// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum ShapeLightFocus { Circle, RRect }

TargetPosition? getTargetCurrent(
  TargetFocus target, {
  bool rootOverlay = false,
}) {
  if (target.keyTarget != null) {
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
  } else {
    return target.targetPosition;
  }
}

abstract class TutorialCoachMarkController {
  void next();
  void previous();
  void skip();
}

extension StateExt on State {
  void safeSetState(VoidCallback call) {
    if (mounted) {
      // ignore: invalid_use_of_protected_member
      setState(call);
    }
  }
}

class NotFoundTargetException extends FormatException {
  NotFoundTargetException(identify)
      : super('It was not possible to obtain target position ($identify).');
}

void postFrame(VoidCallback callback) {
  Future.delayed(Duration.zero, callback);
}

extension NullableExt<T> on T? {
  void let(Function(T it) callback) {
    if (this != null) {
      callback(this as T);
    }
  }
}

class TargetPosition {
  final Size size;
  final Offset offset;

  TargetPosition(this.size, this.offset);

  Offset get center => Offset(
        offset.dx + size.width / 2,
        offset.dy + size.height / 2,
      );

  double getBiggerSpaceBorder(Size size) {
    double maxDistanceX =
        center.dx > size.width / 2 ? center.dx : size.width - center.dx;
    double maxDistanceY =
        center.dy > size.height / 2 ? center.dy : size.height - center.dy;
    return max(maxDistanceX, maxDistanceY);
  }
}

class TargetFocus {
  TargetFocus({
    this.identify,
    this.keyTarget,
    this.targetPosition,
    this.contents,
    this.shape,
    this.radius,
    this.borderSide,
    this.color,
    this.enableOverlayTab = false,
    this.enableTargetTab = true,
    this.alignSkip,
    this.paddingFocus,
    this.focusAnimationDuration,
    this.unFocusAnimationDuration,
    this.pulseVariation,
  }) : assert(keyTarget != null || targetPosition != null);

  final dynamic identify;
  final GlobalKey? keyTarget;
  final TargetPosition? targetPosition;
  final List<TargetContent>? contents;
  final ShapeLightFocus? shape;
  final double? radius;
  final BorderSide? borderSide;
  final bool enableOverlayTab;
  final bool enableTargetTab;
  final Color? color;
  final AlignmentGeometry? alignSkip;
  final double? paddingFocus;
  final Duration? focusAnimationDuration;
  final Duration? unFocusAnimationDuration;
  final Tween<double>? pulseVariation;

  @override
  String toString() {
    return 'TargetFocus{identify: $identify, keyTarget: $keyTarget, targetPosition: $targetPosition, contents: $contents, shape: $shape}';
  }
}

class CustomTargetContentPosition {
  CustomTargetContentPosition({
    this.top,
    this.left,
    this.right,
    this.bottom,
  });

  final double? top, left, right, bottom;

  @override
  String toString() {
    return 'CustomTargetPosition{top: $top, left: $left, right: $right, bottom: $bottom}';
  }
}

enum ContentAlign { top, bottom, left, right, custom }

typedef TargetContentBuilder = Widget Function(
  BuildContext context,
  TutorialCoachMarkController controller,
);

class TargetContent {
  TargetContent({
    this.align = ContentAlign.bottom,
    this.padding = const EdgeInsets.all(20.0),
    this.child,
    this.customPosition,
    this.builder,
  }) : assert(!(align == ContentAlign.custom && customPosition == null));

  final ContentAlign align;
  final EdgeInsets padding;
  final CustomTargetContentPosition? customPosition;
  final Widget? child;
  final TargetContentBuilder? builder;

  @override
  String toString() {
    return 'ContentTarget{align: $align, child: $child}';
  }
}

class LightPaintRect extends CustomPainter {
  final double progress;
  final TargetPosition target;
  final Color colorShadow;
  final double opacityShadow;
  final double offset;
  final double radius;
  final BorderSide? borderSide;

  LightPaintRect({
    required this.progress,
    required this.target,
    this.colorShadow = Colors.black,
    this.opacityShadow = 0.8,
    this.offset = 10,
    this.radius = 10,
    this.borderSide,
  }) : assert(opacityShadow >= 0 && opacityShadow <= 1);

  static Path _drawJustHole(
    Size canvasSize,
    double x,
    double y,
    double w,
    double h,
  ) {
    return Path()
      ..moveTo(x + w, y)
      ..lineTo(x + w, y + h)
      ..lineTo(x, y + h)
      ..lineTo(x, y)
      ..close();
  }

  static Path _drawJustRHole(
    Size canvasSize,
    double x,
    double y,
    double w,
    double h,
    double radius,
  ) {
    double diameter = radius * 2;

    return Path()
      ..moveTo(x, y + radius)
      ..arcTo(
        Rect.fromLTWH(x, y, diameter, diameter),
        pi,
        pi / 2,
        false,
      )
      ..arcTo(
        Rect.fromLTWH(x + w - diameter, y, diameter, diameter),
        3 * pi / 2,
        pi / 2,
        false,
      )
      ..arcTo(
        Rect.fromLTWH(x + w - diameter, y + h - diameter, diameter, diameter),
        0,
        pi / 2,
        false,
      )
      ..arcTo(
        Rect.fromLTWH(x, y + h - diameter, diameter, diameter),
        pi / 2,
        pi / 2,
        false,
      )
      ..lineTo(x, y + radius)
      ..close();
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (target.offset == Offset.zero) return;

    var maxSize = max(size.width, size.height) +
        max(target.size.width, target.size.height) +
        target.getBiggerSpaceBorder(size);

    double x = -maxSize / 2 * (1 - progress) + target.offset.dx - offset / 2;

    double y = -maxSize / 2 * (1 - progress) + target.offset.dy - offset / 2;

    double w = maxSize * (1 - progress) + target.size.width + offset;

    double h = maxSize * (1 - progress) + target.size.height + offset;

    canvas.drawPath(
      radius > 0
          ? RectClipper.rRectHolePath(size, x, y, w, h, radius)
          : RectClipper.rectHolePath(size, x, y, w, h),
      Paint()
        ..style = PaintingStyle.fill
        ..color = colorShadow.withOpacity(opacityShadow)
        ..strokeWidth = 4,
    );
    if (borderSide != null && borderSide?.style != BorderStyle.none) {
      canvas.drawPath(
        radius > 0
            ? _drawJustRHole(size, x, y, w, h, radius)
            : _drawJustHole(size, x, y, w, h),
        Paint()
          ..style = PaintingStyle.stroke
          ..color = borderSide!.color
          ..strokeWidth = borderSide!.width,
      );
    }
  }

  @override
  bool shouldRepaint(LightPaintRect oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class LightPaint extends CustomPainter {
  final double progress;
  final Offset positioned;
  final double sizeCircle;
  final Color colorShadow;
  final double opacityShadow;
  final BorderSide? borderSide;

  LightPaint(
    this.progress,
    this.positioned,
    this.sizeCircle, {
    this.colorShadow = Colors.black,
    this.opacityShadow = 0.8,
    this.borderSide,
  }) : assert(opacityShadow >= 0 && opacityShadow <= 1);

  @override
  void paint(Canvas canvas, Size size) {
    if (positioned == Offset.zero) return;
    var maxSize = max(size.width, size.height);

    double radius = maxSize * (1 - progress) + sizeCircle;

    final circleHole = CircleClipper.circleHolePath(size, positioned, radius);

    final justCircleHole = Path()
      ..moveTo(positioned.dx - radius, positioned.dy)
      ..arcTo(
        Rect.fromCircle(center: positioned, radius: radius),
        pi,
        pi,
        false,
      )
      ..arcTo(
        Rect.fromCircle(center: positioned, radius: radius),
        0,
        pi,
        false,
      )
      ..close();

    canvas.drawPath(
      circleHole,
      Paint()
        ..style = PaintingStyle.fill
        ..color = colorShadow.withOpacity(opacityShadow),
    );
    if (borderSide != null && borderSide?.style != BorderStyle.none) {
      canvas.drawPath(
          justCircleHole,
          Paint()
            ..style = PaintingStyle.stroke
            ..color = borderSide!.color
            ..strokeWidth = borderSide!.width);
    }
  }

  @override
  bool shouldRepaint(LightPaint oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class CircleClipper extends CustomClipper<Path> {
  final double progress;
  final Offset positioned;
  final double sizeCircle;
  final BorderSide? borderSide;

  CircleClipper(
    this.progress,
    this.positioned,
    this.sizeCircle,
    this.borderSide,
  );

  @override
  Path getClip(Size size) {
    if (positioned == Offset.zero) return Path();
    var maxSize = max(size.width, size.height);

    double radius = maxSize * (1 - progress) + sizeCircle;

    return circleHolePath(size, positioned, radius);
  }

  // There is some weirdness here.  On mobile, using arcTo with `sweepAngle: 2 * pi`
  // gives the equivalent of `sweepAngle: 0`.  I couldn't find any documentation
  // of the expected behavior here, so instead I just call arcTo twice (two
  // semi-circles) to outline the full hole.
  static Path circleHolePath(
    Size size,
    Offset positioned,
    double radius,
  ) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(0, positioned.dy)
      ..arcTo(
        Rect.fromCircle(center: positioned, radius: radius),
        pi,
        pi,
        false,
      )
      ..arcTo(
        Rect.fromCircle(center: positioned, radius: radius),
        0,
        pi,
        false,
      )
      ..lineTo(0, positioned.dy)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CircleClipper oldClipper) {
    return progress != oldClipper.progress;
  }
}

class RectClipper extends CustomClipper<Path> {
  final double progress;
  final TargetPosition target;
  final double offset;
  final double radius;
  final BorderSide? borderSide;

  RectClipper({
    required this.progress,
    required this.target,
    required this.offset,
    required this.radius,
    this.borderSide,
  });

  @override
  Path getClip(Size size) {
    if (target.offset == Offset.zero) return Path();

    var maxSize = max(size.width, size.height) +
        max(target.size.width, target.size.height) +
        target.getBiggerSpaceBorder(size);

    double x = -maxSize / 2 * (1 - progress) + target.offset.dx - offset / 2;
    double y = -maxSize / 2 * (1 - progress) + target.offset.dy - offset / 2;
    double w = maxSize * (1 - progress) + target.size.width + offset;
    double h = maxSize * (1 - progress) + target.size.height + offset;

    return radius > 0
        ? rRectHolePath(size, x, y, w, h, radius)
        : rectHolePath(size, x, y, w, h);
  }

  @override
  bool shouldReclip(covariant RectClipper oldClipper) {
    return progress != oldClipper.progress;
  }

  static Path rectHolePath(
    Size canvasSize,
    double x,
    double y,
    double w,
    double h,
  ) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(0, y)
      ..lineTo(x + w, y)
      ..lineTo(x + w, y + h)
      ..lineTo(x, y + h)
      ..lineTo(x, y)
      ..lineTo(0, y)
      ..lineTo(0, canvasSize.height)
      ..lineTo(canvasSize.width, canvasSize.height)
      ..lineTo(canvasSize.width, 0)
      ..close();
  }

  static Path rRectHolePath(
    Size canvasSize,
    double x,
    double y,
    double w,
    double h,
    double radius,
  ) {
    double diameter = radius * 2;

    return Path()
      ..moveTo(0, 0)
      ..lineTo(0, y + radius)
      ..arcTo(
        Rect.fromLTWH(x, y, diameter, diameter),
        pi,
        pi / 2,
        false,
      )
      ..arcTo(
        Rect.fromLTWH(x + w - diameter, y, diameter, diameter),
        3 * pi / 2,
        pi / 2,
        false,
      )
      ..arcTo(
        Rect.fromLTWH(x + w - diameter, y + h - diameter, diameter, diameter),
        0,
        pi / 2,
        false,
      )
      ..arcTo(
        Rect.fromLTWH(x, y + h - diameter, diameter, diameter),
        pi / 2,
        pi / 2,
        false,
      )
      ..lineTo(x, y + radius)
      ..lineTo(0, y + radius)
      ..lineTo(0, canvasSize.height)
      ..lineTo(canvasSize.width, canvasSize.height)
      ..lineTo(canvasSize.width, 0)
      ..close();
  }
}