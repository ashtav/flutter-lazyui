import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'notifier.dart';
import 'pad_widget.dart';

class LzPad {
  static otp(BuildContext context, {int length = 6, Duration? expired}) {
    final notifier = PadNotifier();

    context.bottomSheet(PadWidget(notifier, length: length, expired: expired)).then((_) {
      notifier.dispose();
    });
  }

  static passcode() {}
}

/// Enumerates different visual styles for the keypad widget.
enum PadType {
  /// Pad with rounded borders.
  borderRounded,

  /// Pad with a bottom line separating the keys.
  bottomLine,

  /// Pad specifically designed for passcode input (might have visual cues for hiding characters).
  passcode,
}

/// Manages user input and state for the keypad widget.
///
/// This class provides methods to handle user interactions with the keypad,
/// update the current input value, and interact with the associated `PadNotifier`
/// to trigger UI updates.
class PadController {
  /// The build context of the widget using this controller.
  final BuildContext _context;

  /// The `PadNotifier` instance used for notifying the UI about changes.
  final PadNotifier _notifier;

  /// Optional timer object for handling timeouts or expiration (can be null).
  Timer? timer;

  /// The current value entered by the user.
  String value;

  /// Creates a new `PadController` instance.
  ///
  /// [context] and [notifier] are required parameters.
  /// [timer] and [value] are optional.
  PadController(this._context, this._notifier, {this.timer, this.value = ''});

  /// Pauses the keypad.
  PadController pause() {
    timer?.cancel();
    _notifier.isPaused = true;
    _notifier.setPaused(true);

    return this;
  }

  /// Resumes the keypad.
  PadController resume() {
    if (_notifier.remainingDuration != null) {
      _notifier.setPaused(false);
      timer = _notifier.startTimer(_notifier.remainingDuration!, onTimeout: () {
        _context.lz.pop();
      });
    }

    return this;
  }

  /// Resets the keypad.
  PadController reset() {
    _notifier.reset();
    return this;
  }

  /// Set message
  PadController setMessage(String value) {
    _notifier.setMessage(value);
    return this;
  }
}
