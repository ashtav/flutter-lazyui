import 'package:flutter/material.dart';

/// Notifier class for managing state related to button actions.
class ButtonNotifier extends ChangeNotifier {
  /// Original text value before any changes.
  String textOrigin = '';

  /// Current text value of the button.
  String text = '';

  /// Indicates whether a button action is in progress.
  bool isSubmit = false;

  /// Indicates whether the button is disabled.
  bool disabled = false;

  /// Sets the state to indicate that a button action is in progress.
  void onSubmit() {
    isSubmit = true;
    disabled = true;
    notifyListeners();
  }

  /// Resets the state after aborting a button action.
  void onAbort() {
    isSubmit = false;
    disabled = false;

    text = textOrigin;
    notifyListeners();
  }

  /// Sets the text value of the button.
  ///
  /// [text]: The new text value for the button.
  void onSetText(String text) {
    this.text = text;
    notifyListeners();
  }
}
