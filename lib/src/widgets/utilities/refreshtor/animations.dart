import 'package:flutter/material.dart';

/// Clamps the value of a parent animation within a specified range.
class ClampedAnimation extends Animation<double>
    with AnimationWithParentMixin<double> {
  const ClampedAnimation({
    required this.parent,
    required this.min,
    required this.max,
  }) : assert(min < max);

  @override
  final Animation<double> parent;
  final double min, max;

  @override
  double get value => parent.value.clamp(min, max);

  @override
  String toString() => '$parent(min: $min, max: $max)';
}

/// Transforms the value of a parent animation from one range to another.
class TransformedAnimation extends Animation<double>
    with AnimationWithParentMixin<double> {
  const TransformedAnimation({
    required this.parent,
    required this.fromMin,
    required this.fromMax,
    required this.toMin,
    required this.toMax,
  })  : assert(fromMin < fromMax),
        assert(toMin < toMax);

  @override
  final Animation<double> parent;
  final double fromMin, fromMax, toMin, toMax;

  @override
  double get value {
    return (parent.value - fromMin) / (fromMax - fromMin) * (toMax - toMin) +
        toMin;
  }

  @override
  String toString() => 'TransformedAnimation(min: $toMin, max: $toMax)';
}
