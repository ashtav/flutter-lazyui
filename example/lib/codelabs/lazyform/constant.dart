import 'package:flutter/material.dart';

extension ListenableExtension on Listenable {
  AnimatedBuilder watch(Widget Function() child) {
    return AnimatedBuilder(
      animation: this,
      builder: (context, _) => child(),
    );
  }
}

extension FormModelExtension on Map<String, FormModel> {
  Map<String, FormModel> fill(Map<String, dynamic> data) {
    for (var e in data.keys) {
      if (containsKey(e)) {
        this[e]!.controller.text = data[e].toString();
      }
    }

    return this;
  }
}

/* ---------------------------------------------------------------
| Form Notifier
| */

class FormNotifier extends ChangeNotifier {
  TextEditingController controller = TextEditingController();
  Map<String, dynamic> data = {'error': '', 'valid': true, 'text_length': 0};
  bool obsecure = false;

  String get errorMessage => data['error'];
  bool get isValid => data['valid'];
  int get textLength => data['text_length'];

  void setMessage(String value, bool valid) {
    data['error'] = value;
    data['valid'] = valid;
    notifyListeners();
  }

  void setObsecure(bool value) {
    obsecure = value;
    notifyListeners();
  }

  void setTextLength(int value) {
    data['text_length'] = value;
    notifyListeners();
  }
}

/* ---------------------------------------------------------------
| Form Model
| */

class FormModel {
  final TextEditingController controller;
  final FormNotifier notifier;

  FormModel(this.controller, this.notifier);
}

/* ---------------------------------------------------------------
| Form Messages
| */

class FormMessages {
  final Map<String, dynamic>? required, min, max, email;
  FormMessages({this.required, this.min, this.max, this.email});

  String? get(String type, String key) {
    switch (type) {
      case 'required':
        return required?[key];
      case 'min':
        return min?[key];
      case 'max':
        return max?[key];
      case 'email':
        return email?[key];
      default:
        return null;
    }
  }
}

/* ---------------------------------------------------------------
| Form Validate Notifier
| */

enum FormValidateNotifier { none, toast, text }
