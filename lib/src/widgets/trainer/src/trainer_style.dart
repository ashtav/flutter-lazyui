import 'package:flutter/material.dart';

/// Style configuration for the [Trainer] widget.
class TrainerStyle {
  /// The label for the "Next" button.
  final String? nextLabel;

  /// The label for the "Finish" button.
  final String? finishLabel;

  /// The label for the "Skip" button.
  final String? skipLabel;

  /// The color of the shadow displayed around highlighted elements.
  final Color? shadowColor;

  /// The opacity of the shadow displayed around highlighted elements.
  final double? shadowOpacity;

  /// Whether to apply a blur effect to the background during the tour.
  final bool? backBlur;

  /// The maximum height of the tour dialog.
  final double? maxHeight;

  /// A function that builds the content of each step in the tour dialog.
  ///
  /// This function takes three parameters:
  /// - [icon]: The icon to be displayed for the step.
  /// - [title]: The title of the step.
  /// - [description]: The description of the step.
  ///
  /// It returns a widget representing the content of the step.
  final Widget Function(IconData icon, String title, String description)? content;

  /// A function that builds the control buttons for the tour dialog.
  ///
  /// This function takes three parameters:
  /// - [onNext]: A callback function to be invoked when the "Next" button is pressed.
  /// - [onSkip]: A callback function to be invoked when the "Skip" button is pressed.
  /// - [isLast]: A boolean value indicating whether the current step is the last step in the tour.
  ///
  /// It returns a widget representing the control buttons for the tour dialog.
  final Widget Function(Function() onNext, Function() onSkip, bool isLast)? control;

  /// Creates a [TrainerStyle] object.
  const TrainerStyle(
      {this.nextLabel,
      this.finishLabel,
      this.skipLabel,
      this.shadowColor,
      this.shadowOpacity,
      this.backBlur,
      this.maxHeight,
      this.content,
      this.control});
}
