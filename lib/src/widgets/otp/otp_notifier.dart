import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

/// A notifier for managing the state of an OTP (One-Time Password) input.
///
/// This class extends [ChangeNotifier] and provides methods to handle OTP input,
/// manage a countdown timer, and notify listeners of changes in OTP state.
///
class OtpNotifier extends ChangeNotifier {
  /// The current length of the OTP input.
  int length = 6;

  /// The maximum number of characters allowed in the OTP input.
  int max = 6;

  /// The time remaining until the OTP expires, in seconds.
  int expired = 0;

  /// The remaining duration of the OTP validity.
  Duration? remainingDuration;

  /// The current value of the OTP input.
  List<String> otp = [];

  /// Indicates whether the OTP input is currently paused.
  bool isPaused = false;

  /// Handles input for the OTP.
  ///
  /// If the input is '<', it removes the last character of the OTP.
  /// Otherwise, it adds the character to the OTP if it's not full.
  /// Notifies listeners after updating the OTP.
  ///
  /// Returns `true` if the OTP is complete (reaches max length).
  bool onInput(String value) {
    if (value == '<' && otp.isNotEmpty) {
      otp.removeLast();
    } else {
      if (otp.length < max && value != '<') {
        otp.add(value);
      }
    }

    notifyListeners();

    return otp.length >= max;
  }

  /// Updates the remaining time until the OTP expires.
  ///
  /// Notifies listeners of the change.
  void onExpired(int value) {
    expired = value;
    notifyListeners();
  }

  /// Starts a countdown timer for the OTP.
  ///
  /// The timer updates the remaining time every second and notifies listeners.
  /// If a callback [onTimeout] is provided, it is called when the timer expires.
  Timer startTimer(Duration dur, {Function()? onTimeout}) {
    DateTime expired = DateTime.now().add(dur);
    Duration duration = expired.difference(DateTime.now());

    onExpired(duration.inSeconds);

    // start timer
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

  /// Resets the OTP input and notifies listeners.
  void reset() {
    otp = [];
    notifyListeners();
  }

  /// Sets the paused state of the OTP and notifies listeners.
  void setPaused(bool value) {
    isPaused = value;
    notifyListeners();
  }
}
