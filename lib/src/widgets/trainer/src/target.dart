import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class Target {
  final GlobalKey key;
  final ContentAlign align;
  final List<Widget>? contents;
  final String? title;
  final String? description;
  final IconData? icon;
  final ShapeLightFocus? shape;
  final double? radius;
  final Color? backgroundColor, textColor;
  final Widget? child;
  final Function(TutorialCoachMarkController control)? onNext;

  const Target(
      {required this.key,
      this.align = ContentAlign.bottom,
      this.contents,
      this.title,
      this.description,
      this.icon,
      this.shape,
      this.radius,
      this.backgroundColor,
      this.textColor,
      this.child,
      this.onNext});
}
