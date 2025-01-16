import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'notifier.dart';
import 'pad_widget.dart';

class LzPad {
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
