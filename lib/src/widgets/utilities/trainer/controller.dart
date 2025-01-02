abstract class TutorialCoachMarkController {
  void next();
  void previous();
  void skip();
}

class TrainerController {
  void Function([int? index])? showTrainer;

  void show([int? index]) {
    if (showTrainer != null) {
      showTrainer!(index);
    }
  }
}
