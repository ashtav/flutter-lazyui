// LzForm.input()

import 'package:flutter/material.dart' hide Radio, Checkbox;
import 'package:flutter/services.dart';
import 'package:lazyui/lazyui.dart';

import 'checkbox.dart';
import 'input.dart';
import 'radio.dart';
import 'select.dart';
import 'switches.dart';

/* ---------------------------------------------------------------
| LzForm
| */

/// ```dart
/// LzForm.input(label: 'Name', hint: 'Enter your name', model: model);
///
/// LzForm form = LzForm.validate(forms);
///
/// @params
/// required: ['*'] // required all
/// required: ['address', 'phone'] // required only address and phone
/// required: ['*', 'address', 'phone'] // required all except address and phone
///
/// min: ['phone:10', 'address:5']
/// max: ['phone:15', 'address:100']
/// email: ['email']
///
/// ```

class LzForm {
  final bool ok;
  final FormErrorInfo? error;
  final Map<String, dynamic> value;

  LzForm({this.ok = false, this.error, this.value = const {}});

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

    return Map.fromIterables(keys, List.generate(keys.length, (i) => FormModel(forms[keys[i]]!, notifiers[keys[i]]!, GlobalKey())));
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

  static Input input({
    String? label,
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
    bool indicator = false,
    Function(String value)? onChange,
    Function(String value)? onSubmit,
    Function(TextEditingController model)? onTap,
  }) =>
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
          onChange: onChange,
          onSubmit: onSubmit,
          onTap: onTap);

  /* ---------------------------------------------------------------
  | LzForm Select
  | */

  static Select select(
          {String? label,
          String? hint,
          List<Option> options = const [],
          Option? initValue,
          FormModel? model,
          bool enabled = true,
          Function(String value)? onChange,
          Future<dynamic>? Function(SelectController selector)? onTap,
          dynamic Function(SelectController selector)? onSelect}) =>
      Select(
          label: label,
          hint: hint,
          options: options,
          initValue: initValue,
          model: model,
          enabled: enabled,
          onChange: onChange,
          onTap: onTap,
          onSelect: onSelect);

  /* ---------------------------------------------------------------
  | LzForm Radio
  | */

  static Radio radio(
          {String? label,
          List<Option> options = const [],
          Option? initValue,
          FormModel? model,
          bool enabled = true,
          Color? activeColor,
          Function(Option value)? onChange}) =>
      Radio(
        label: label,
        options: options,
        initValue: initValue,
        model: model,
        enabled: enabled,
        activeColor: activeColor,
        onChange: onChange,
      );

  /* ---------------------------------------------------------------
  | LzForm Checkbox
  | */

  static Checkbox checkbox(
          {String? label,
          List<Option> options = const [],
          List<Option> initValue = const [],
          FormModel? model,
          bool enabled = true,
          Color? activeColor,
          Function(Option value)? onChange}) =>
      Checkbox(
        label: label,
        options: options,
        initValue: initValue,
        model: model,
        enabled: enabled,
        activeColor: activeColor,
        onChange: onChange,
      );

  /* ---------------------------------------------------------------
  | LzForm Switches
  | */

  /// ```dart
  /// LzForm.switches(
  ///   label: 'Available|Not Available',
  ///   onChange: (value) {},
  /// )
  /// ```

  static Switches switches({Key? key, required String label, bool initValue = false, Function(bool)? onChange, Color? activeColor}) =>
      Switches(label: label, initValue: initValue, onChange: onChange, activeColor: activeColor);

  /* ---------------------------------------------------------------
  | LzForm Validation
  | */

  static LzForm validate(Map<String, FormModel> forms,
      {List<String> required = const [],
      List<String> min = const [],
      List<String> max = const [],
      List<String> email = const [],
      FormMessages? messages,
      FormValidateNotifier notifierType = FormValidateNotifier.toast}) {
    try {
      Map<String, TextEditingController> controllers = Map.fromIterables(forms.keys, forms.values.map((e) => e.controller));
      Map<String, FormNotifier> notifiers = Map.fromIterables(forms.keys, forms.values.map((e) => e.notifier));
      Map<String, GlobalKey> globalKeys = Map.fromIterables(forms.keys, forms.values.map((e) => e.key));

      List<Map<String, dynamic>> errorFields = [];

      bool isRequiredAll = required.length == 1 && required.contains('*');
      bool isRequiredAllExcept = required.length > 1 && required.contains('*');

      if (isRequiredAll) {
        required = controllers.keys.toList();
      } else if (isRequiredAllExcept) {
        required.remove('*');
        required = controllers.keys.toList()..removeWhere((e) => required.contains(e));
      }

      List<String> formKeys = controllers.keys.toList();

      // index 0 and 1 will always be there, if index 1 is not a number, it will be 0
      List splitter(String str) {
        List<String> split = str.split(':');
        return [split[0], split.length < 2 ? 0 : split[1].getNumeric];
      }

      // Check keys (required, min, max, email) if they are in the forms
      for (String key in formKeys) {
        /* ------------------------------------------------------------------------
        | Required Validation
        | */

        if (controllers[key] != null && controllers[key]!.text.trim().isEmpty && required.contains(key)) {
          errorFields.add({'key': key, 'type': 'required', 'message': '$key is required'});
        }

        /* ------------------------------------------------------------------------
        | Minimum Length
        | */

        for (var e in min) {
          List split = splitter(e);
          if (controllers[key] != null && controllers[key]!.text.trim().length < split[1] && split[0] == key) {
            errorFields.add({'key': key, 'type': 'min', 'message': '$key must be at least ${split[1]} characters'});
          }
        }

        /* ------------------------------------------------------------------------
        | Maximum Length
        | */

        for (var e in max) {
          List split = splitter(e);
          if (controllers[key] != null && controllers[key]!.text.trim().length > split[1] && split[0] == key) {
            errorFields.add({'key': key, 'type': 'max', 'message': '$key must be at most ${split[1]} characters'});
          }
        }

        /* ------------------------------------------------------------------------
        | Email
        | */

        if (controllers[key] != null && !controllers[key]!.text.trim().toString().isEmail && email.contains(key)) {
          errorFields.add({'key': key, 'type': 'email', 'message': '$key is not a valid email'});
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

        // scroll to the error field
        GlobalKey? key = globalKeys[errorKey];
        if (key != null) {
          Scrollable.ensureVisible(key.currentContext!, duration: const Duration(milliseconds: 300), alignment: .09);
        }

        return LzForm(ok: false, error: FormErrorInfo(key: errorKey, type: errorType, message: errorMessage), value: controllers.toMap());
      }
    } catch (e, s) {
      Errors.check(e, s, disabledBot: true);
    }

    return LzForm(ok: true, value: Map.fromIterables(forms.keys, forms.values.map((e) => e.controller)).toMap());
  }
}
