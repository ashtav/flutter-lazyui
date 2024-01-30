import 'package:flutter/material.dart';

class ButtonNotifier extends ChangeNotifier {
  String textOrigin = '';
  String text = '';

  bool isSubmit = false;
  bool disabled = false;

  void onSubmit() {
    isSubmit = true;
    disabled = true;
    notifyListeners();
  }

  void onAbort() {
    isSubmit = false;
    disabled = false;

    text = textOrigin;
    notifyListeners();
  }

  void onSetText(String text) {
    this.text = text;
    notifyListeners();
  }
}
