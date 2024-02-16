import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

/// This class serves as a notifier for a numeric keypad input.
class PadNotifier extends ChangeNotifier {
  /// The current length of the input.
  int length = 6;

  /// The maximum allowed length for the input.
  int max = 6;

  /// The number of expired inputs.
  int expired = 0;

  /// The remaining duration until expiration.
  Duration? remainingDuration;

  /// List of input values.
  List<String> values = [];

  /// Boolean flag indicating if the input is paused.
  bool isPaused = false;

  /// Handles the input action.
  ///
  /// Returns `true` if the input length reaches the maximum allowed length.
  bool onInput(String value) {
    if (value == '<' && values.isNotEmpty) {
      values.removeLast();
    } else {
      if (values.length < max && value != '<') {
        values.add(value);
      }
    }

    notifyListeners();

    return values.length >= max;
  }

  /// Handles the expiration event.
  void onExpired(int value) {
    expired = value;
    notifyListeners();
  }

  /// Starts a timer with the specified duration.
  ///
  /// The [onTimeout] function is called when the timer expires.
  Timer startTimer(Duration dur, {Function()? onTimeout}) {
    DateTime expired = DateTime.now().add(dur);
    Duration duration = expired.difference(DateTime.now());

    onExpired(duration.inSeconds);

    return Timer.periodic(1.s, (_) {
      Duration duration = expired.difference(DateTime.now());
      remainingDuration = duration;

      if (DateTime.now().isAfter(expired)) {
        _.cancel();
        onTimeout?.call();
      } else {
        onExpired(duration.inSeconds);
      }
    });
  }

  /// Resets the input values.
  void reset() {
    values = [];
    notifyListeners();
  }

  /// Sets the pause state of the input.
  void setPaused(bool value) {
    isPaused = value;
    notifyListeners();
  }
}
