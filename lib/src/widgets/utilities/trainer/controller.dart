import 'package:flutter/material.dart';

/// An abstract controller interface for managing the flow of a tutorial coach mark.
///
/// Implement this interface to provide custom logic for navigating through
/// tutorial steps, including moving to the next or previous step, or skipping
/// the tutorial entirely.
abstract class TutorialCoachMarkController {
  void next();
  void previous();
  void skip();
}

/// A controller class for managing the state and logic related to the Trainer widget.
///
/// This class provides methods and properties to control the behavior and data flow
/// for trainer-related functionalities within the application.
class TrainerController {
  @protected
  void Function()? nextTarget;

  @protected
  void Function()? skipTarget;

  @protected
  void Function([int? index])? showTrainer;

  void show([int? from]) {
    if (showTrainer != null) {
      showTrainer!(from);
    }
  }

  void next() {
    if (nextTarget != null) {
      nextTarget!();
    }
  }

  void skip() {
    if (skipTarget != null) {
      skipTarget!();
    }
  }
}
