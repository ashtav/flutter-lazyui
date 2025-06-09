import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'notifier.dart';
import 'pad_widget.dart';

/// A class representing a customizable pad widget for form inputs.
///
/// The [LzPad] class provides functionality to create and manage
/// pad-style input fields, which can be used for entering PINs,
/// passwords, or other segmented input data in forms.
///
/// Customize the appearance and behavior of the pad as needed
/// for your application's requirements.
class LzPad {
  /// Displays an OTP (One-Time Password) input form.
  ///
  /// This static method creates and returns a widget for OTP input, typically used for authentication flows.
  ///
  /// [context] - The build context in which the OTP form is displayed.
  static otp(BuildContext context,
      {int length = 6,
      Duration? expired,
      String? title,
      String? message,
      void Function(PadController controller)? onCompleted}) {
    final notifier = PadNotifier();

    context
        .bottomSheet(PadWidget(notifier,
            length: length,
            expired: expired,
            title: title,
            message: message,
            onCompleted: onCompleted))
        .then((_) {
      notifier.dispose();
    });
  }

  /// Displays a passcode input dialog or widget.
  ///
  /// [context] is the build context in which the passcode input is shown.
  static passcode(BuildContext context,
      {int length = 6,
      String? title,
      String? message,
      void Function(PadController controller)? onCompleted}) {
    final notifier = PadNotifier();

    context
        .bottomSheet(PadWidget(notifier,
            length: length,
            title: title,
            message: message,
            onCompleted: onCompleted,
            passcode: true))
        .then((_) {
      notifier.dispose();
    });
  }
}

/// A controller class for managing the state and behavior of a Pad widget.
///
/// Use this controller to interact with and manipulate the Pad widget programmatically.
/// It provides methods and properties to control the Pad's value, validation, and other
/// functionalities as needed within forms or custom input scenarios.
class PadController {
  final BuildContext _context;
  final PadNotifier _notifier;

  PadController(this._context, this._notifier);

  String get value => _notifier.values.join();

  PadController pause() {
    _notifier.isPaused = true;
    _notifier.setPaused(true);

    return this;
  }

  PadController resume() {
    if (_notifier.remainingDuration != null) {
      _notifier.setPaused(false);
      _notifier.startTimer(_notifier.remainingDuration!, onTimeout: () {
        _context.lz.pop();
      });
    }

    return this;
  }

  PadController reset() {
    _notifier.reset();
    return this;
  }

  PadController setMessage(String value) {
    _notifier.setMessage(value);
    return this;
  }
}
