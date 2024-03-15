import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

/// Defines the properties of a target for the tutorial.
class Target {
  /// The key of the target widget.
  final GlobalKey key;

  /// The alignment of the tutorial content relative to the target widget.
  final ContentAlign? align;

  /// The list of contents to display in the tutorial.
  final List<Widget>? contents;

  /// The title of the tutorial.
  final String? title;

  /// The description of the tutorial.
  final String? description;

  /// The icon to display in the tutorial.
  final IconData? icon;

  /// The shape and light focus effect of the tutorial.
  final ShapeLightFocus? shape;

  /// The radius of the target widget.
  final double? radius;

  /// The background color of the tutorial.
  final Color? backgroundColor;

  /// The text color of the tutorial.
  final Color? textColor;

  /// The child widget to display as the target.
  final Widget? child;

  /// The function called when the "Next" button is pressed.
  final Function(TutorialCoachMarkController control)? onNext;

  /// Creates a [Target] object.
  Target({
    required this.key,
    this.align,
    this.contents,
    this.title,
    this.description,
    this.icon,
    this.shape,
    this.radius,
    this.backgroundColor,
    this.textColor,
    this.child,
    this.onNext,
  });
}
