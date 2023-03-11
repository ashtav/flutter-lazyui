// LzForm.input()

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lazyui/lazyui.dart' hide FormMessages;

import 'constant.dart';
import 'input.dart';

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
  | LzForm Fill
  | */

  static Map<String, FormModel> fill(Map<String, FormModel> forms, Map<String, dynamic> data) {
    for (var e in data.keys) {
      if (forms.containsKey(e)) {
        forms[e]!.controller.text = data[e].toString();
      }
    }

    return forms;
  }

  /* ---------------------------------------------------------------
  | LzForm Input
  | */

  static Input input(
          {String? label,
          String? hint,
          FormModel? model,
          int maxLength = 50,
          int? maxLines,
          FocusNode? node,
          bool enabled = true,
          bool autofocus = false,
          bool obsecure = false,
          TextInputType? keyboard,
          List<TextInputFormatter> formatters = const [],
          bool obsecureToggle = false,
          bool indicator = false}) =>
      Input(
        label: label,
        hint: hint,
        model: model,
        maxLength: maxLength,
        maxLines: maxLines,
        node: node,
        enabled: enabled,
        autofocus: autofocus,
        obsecure: obsecure,
        keyboard: keyboard,
        formatters: formatters,
        obsecureToggle: obsecureToggle,
        indicator: indicator,
      );

  /* ---------------------------------------------------------------
  | LzForm Validation
  | */

  static LzForm validate(Map<String, FormModel> forms,
      {List<String> required = const [], FormMessages? messages, FormValidateNotifier notifierType = FormValidateNotifier.toast}) {
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

        if (notifierType == FormValidateNotifier.toast) {
          Fluttertoast.showToast(msg: errorMessage, gravity: ToastGravity.CENTER);
        } else if (notifierType == FormValidateNotifier.text) {
          notifiers[errorKey]?.setMessage(errorMessage, false);
        }

        return LzForm(ok: false);
      }
    } catch (e, s) {
      Errors.check(e, s);
    }

    return LzForm(ok: true);
  }
}
