// LzForm.input()

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'input.dart';

/* ---------------------------------------------------------------
| Form Notifier
| */

class FormNotifier extends ChangeNotifier {
  Map<String, dynamic> data = {'error': 'Lorem ipsum dolor sit amet', 'valid': true};

  String get errorMessage => data['error'];
  bool get isValid => data['valid'];

  void setMessage(String value, bool valid) {
    data['error'] = value;
    data['valid'] = valid;
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
| LzForm
| */

/// ```dart
/// LzForm.input(label: 'Name', hint: 'Enter your name', model: model);
/// ```

class LzForm {
  final bool ok;

  LzForm({this.ok = false});

  /* ---------------------------------------------------------------
  | LzForm Make Model
  | */

  static Map<String, FormModel> make(List<String> keys) {
    Map<String, TextEditingController> forms = {};
    Map<String, FormNotifier> notifiers = {};

    for (var e in keys) {
      forms[e] = TextEditingController();
      notifiers[e] = FormNotifier();
    }

    return Map.fromIterables(keys, List.generate(keys.length, (i) => FormModel(forms[keys[i]]!, notifiers[keys[i]]!)));
  }

  /* ---------------------------------------------------------------
  | LzForm Input
  | */

  static Input input({String? label, String? hint, FormModel? model}) => Input(
        label: label,
        hint: hint,
        model: model,
      );

  /* ---------------------------------------------------------------
  | LzForm Validation
  | */

  static LzForm validate(Map<String, FormModel> forms, {List<String> required = const [], FormMessages? messages}) {
    try {
      Map<String, TextEditingController> controllers = Map.fromIterables(forms.keys, forms.values.map((e) => e.controller));
      Map<String, FormNotifier> notifiers = Map.fromIterables(forms.keys, forms.values.map((e) => e.notifier));

      List<Map<String, dynamic>> errorFields = [];

      bool isRequiredAll = required.length == 1 && required.contains('*');
      bool isRequiredAllExcept = required.length > 1 && required.contains('*');

      /* ------------------------------------------------------------------------
      | Required Validation
      | */

      if (isRequiredAll) {
        required = controllers.keys.toList();
      } else if (isRequiredAllExcept) {
        required.remove('*');
        required = controllers.keys.toList()..removeWhere((e) => required.contains(e));
      }

      for (var e in required) {
        if (controllers[e] != null && controllers[e]!.text.trim().isEmpty) {
          errorFields.add({'key': e, 'type': 'required', 'message': '$e is required'});
        }
      }

      /* ------------------------------------------------------------------------
      | Conclusion
      | */

      // Get keys that are not contained in the errorFields
      List<String> keys = controllers.keys.toList()..removeWhere((e) => errorFields.map((e) => e['key']).contains(e));

      for (String k in keys) {
        notifiers[k]?.setMessage('', true);
      }

      if (errorFields.isNotEmpty) {
        String errorKey = errorFields.first['key'];
        String errorType = errorFields.first['type'];
        String errorMessage = errorFields.first['message'];

        if (messages != null) {
          errorMessage = messages.get(errorType, errorKey) ?? errorMessage;
        }

        notifiers[errorKey]?.setMessage(errorMessage, false);

        return LzForm(ok: false);
      }
    } catch (e, s) {
      Errors.check(e, s);
    }

    return LzForm(ok: true);
  }
}
