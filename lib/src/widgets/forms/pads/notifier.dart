import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

/// This class serves as a notifier for a numeric keypad input.
class PadNotifier extends ChangeNotifier {
  /// The current length of the input.
  /// Defaults to 6.
  int length = 6;

  /// The maximum allowed length for the input.
  /// Used to validate the input length.
  int max = 6;

  /// The number of expired inputs.
  /// Tracks how many inputs have expired.
  int expired = 0;

  /// The remaining time until the input expires.
  /// This value is null if expiration is not set.
  Duration? remainingDuration;

  /// A list containing the input values.
  /// Represents the current input entered by the user.
  List<String> values = [];

  /// Indicates whether the input process is paused.
  /// If true, the input handling is temporarily stopped.
  bool isPaused = false;

  /// A message to display additional information or feedback.
  /// Defaults to an empty string.
  String message = '';

  /// A timer instance to handle expiration or time-based actions.
  /// This value is null if no timer is set.
  Timer? timer;

  /// Handles the input action.
  ///
  /// Returns `true` if the input length reaches the maximum allowed length.
  bool onInput(String value) {
    if (value == 'x') {
      values = [];
    } else {
      if (value == '<' && values.isNotEmpty) {
        values.removeLast();
      } else {
        if (values.length < max && value != '<') {
          values.add(value);
        }
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
  void startTimer(Duration dur, {void Function()? onTimeout}) {
    DateTime expired = DateTime.now().add(dur);
    Duration duration = expired.difference(DateTime.now());

    onExpired(duration.inSeconds);

    timer = Timer.periodic(1.s, (t) {
      Duration duration = expired.difference(DateTime.now());
      remainingDuration = duration;

      if (DateTime.now().isAfter(expired)) {
        timer?.cancel();
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
    timer?.cancel();
    notifyListeners();
  }

  /// Set message
  void setMessage(String value) {
    message = value;
    notifyListeners();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
