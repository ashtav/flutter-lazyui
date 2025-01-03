import 'package:flutter/material.dart';

abstract class TutorialCoachMarkController {
  void next();
  void previous();
  void skip();
}

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
