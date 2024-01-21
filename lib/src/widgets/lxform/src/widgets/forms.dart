library forms;

import 'dart:math';

import 'package:flutter/material.dart' hide Radio, Checkbox, Switch;
import 'package:flutter/services.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/widgets/lxform/src/utils/attribute_extractor.dart';

import '../models/form_error.dart';
import '../models/form_message.dart';
import '../models/radio_model.dart';
import '../notifiers/form_notifier.dart';
import 'form_feedback.dart';

part 'form_controls/input.dart';
part 'form_controls/radio.dart';

class LxForm {
  final bool ok;
  final FormError? error;
  final Map<String, dynamic> value;
  final Map<String, dynamic> extra;

  LxForm({this.ok = false, this.error, this.value = const {}, this.extra = const {}});

  /// Creates a mapping of form keys to `FormModelx` instances.
  ///
  /// This function takes a list of strings (`keys`) and generates a map where
  /// each key is associated with a `FormModelx` instance. For each key in the
  /// provided list, a new `TextEditingController` and `FormNotifier` are created.
  /// These are then used to construct `FormModelx` instances.
  ///
  /// The function returns a `Map<String, FormModelx>`, where each key from the
  /// input list is mapped to a corresponding `FormModelx` object. This map is
  /// useful for managing multiple forms or form fields in a dynamic way, such as
  /// in a form builder context.
  ///
  /// The `FormModelx` objects are initialized with the newly created
  /// `TextEditingController`, `FormNotifier`, and a unique `GlobalKey`.
  ///
  /// Example:
  /// ```dart
  /// var formKeys = ['name', 'email', 'password'];
  /// var formMap = FormModelx.make(formKeys);
  /// ```
  ///
  /// [keys] List of strings representing the keys for the form fields.
  /// Returns a Map of string keys to `FormModelx` instances.

  static Map<String, FormModelx> make(List<String> keys) {
    Map<String, TextEditingController> forms = {};
    Map<String, FormNotifier> notifiers = {};

    for (var e in keys) {
      forms[e] = TextEditingController();
      notifiers[e] = FormNotifier();
    }

    return Map.fromIterables(
        keys, List.generate(keys.length, (i) => FormModelx(forms[keys[i]]!, notifiers[keys[i]]!, GlobalKey())));
  }

  /// Fills the provided form models with data.
  ///
  /// This static function takes a map of `FormModelx` objects and a data map, then
  /// populates the `TextEditingController` of each form model with the corresponding
  /// value from the data map. If a key in the data map matches a key in the form
  /// models map, and is not listed in the `except` list, its value will be used to
  /// set the text of the associated `TextEditingController`.
  ///
  /// This is useful for pre-filling form fields with existing data, such as when
  /// editing information that was previously saved.
  ///
  /// The function returns the updated map of `FormModelx` objects with their
  /// controllers' text set according to the provided data.
  ///
  /// Example:
  /// ```dart
  /// var formModels = {
  ///   'name': FormModelx(...),
  ///   'email': FormModelx(...),
  /// };
  /// var data = {'name': 'John Doe', 'email': 'johndoe@example.com'};
  /// formModels = FormModelx.fill(formModels, data);
  /// ```
  ///
  /// [forms] Map of `FormModelx` objects, keyed by string.
  /// [data] Map of data used to fill the form models, keyed by string.
  /// [except] Optional list of string keys to exclude from filling.
  /// Returns the updated map of `FormModelx` objects.

  static Map<String, FormModelx> fill(Map<String, FormModelx> forms, Map<String, dynamic> data,
      {List<String> except = const []}) {
    for (var e in data.keys) {
      if (forms.containsKey(e) && !except.contains(e)) {
        forms[e]!.controller.text = data[e] == null ? '' : data[e].toString();
      }
    }

    return forms;
  }

  /// Resets the text of form controllers in the provided map of `FormModel` objects.
  ///
  /// This static function allows for selectively resetting the text of form field
  /// controllers. It can reset all forms, only specific forms, or all forms except
  /// for a specified few, based on the `only` and `except` parameters.
  ///
  /// The function iterates over the keys in the provided `forms` map. If `only` is
  /// not empty, only the forms whose keys are in the `only` list are reset. If
  /// `except` is not empty, all forms except those whose keys are in the `except`
  /// list are reset. If both `only` and `except` are empty, all forms are reset.
  ///
  /// This is particularly useful in scenarios where you need to clear form fields,
  /// such as after submission or when initiating a new data entry process.
  ///
  /// Example:
  /// ```dart
  /// var formModels = {
  ///   'name': FormModel(...),
  ///   'email': FormModel(...),
  /// };
  /// // Reset only 'name' field
  /// FormModel.reset(formModels, only: ['name']);
  /// // Reset all except 'email'
  /// FormModel.reset(formModels, except: ['email']);
  /// // Reset all fields
  /// FormModel.reset(formModels);
  /// ```
  ///
  /// [forms] Map of `FormModel` objects, keyed by string.
  /// [only] Optional list of string keys to exclusively reset.
  /// [except] Optional list of string keys to exclude from resetting.

  static void reset(Map<String, FormModelx> forms, {List<String> only = const [], List<String> except = const []}) {
    for (var e in forms.keys) {
      if (only.isNotEmpty && only.contains(e)) {
        forms[e]!.controller.text = '';
      } else if (except.isNotEmpty && !except.contains(e)) {
        forms[e]!.controller.text = '';
      } else if (only.isEmpty && except.isEmpty) {
        forms[e]!.controller.text = '';
      }
    }
  }

  static LxForm validate(Map<String, FormModelx> forms,
      {List<String> required = const [],
      List<String> min = const [],
      List<String> max = const [],
      List<String> email = const [],
      FormMessage? messages,
      FormAlert alert = FormAlert.toast,
      Position? toastPosition,
      bool singleNotifier = true}) {
    try {
      Map<String, TextEditingController> controllers =
          Map.fromIterables(forms.keys, forms.values.map((e) => e.controller));
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

      // check keys (required, min, max, email) if they are in the forms
      for (String key in formKeys) {
        /* ------------------------------------------------------------------------
        | Required
        | */

        if (controllers[key] != null && controllers[key]!.text.trim().isEmpty && required.contains(key)) {
          errorFields.add({'key': key, 'type': 'required', 'message': 'The field $key is required'});
        }

        /* ------------------------------------------------------------------------
        | Minimum Length
        | */

        for (var e in min) {
          List split = splitter(e);
          if (controllers[key] != null && controllers[key]!.text.trim().length < split[1] && split[0] == key) {
            errorFields
                .add({'key': key, 'type': 'min', 'message': 'The field $key must be at least ${split[1]} characters'});
          }
        }

        /* ------------------------------------------------------------------------
        | Maximum Length
        | */

        for (var e in max) {
          List split = splitter(e);
          if (controllers[key] != null && controllers[key]!.text.trim().length > split[1] && split[0] == key) {
            errorFields
                .add({'key': key, 'type': 'max', 'message': 'The field $key must be at most ${split[1]} characters'});
          }
        }

        /* ------------------------------------------------------------------------
        | Email
        | */

        if (controllers[key] != null && !controllers[key]!.text.trim().toString().isEmail && email.contains(key)) {
          errorFields.add({'key': key, 'type': 'email', 'message': 'The field $key is not a valid email'});
        }
      }

      /* ------------------------------------------------------------------------
      | Conclusion
      | */

      // Get keys that are not contained in the errorFields
      List<String> keys = controllers.keys.toList()..removeWhere((e) => errorFields.map((e) => e['key']).contains(e));

      // Clear all notifiers
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

        if (alert == FormAlert.toast) {
          LzToast.show(errorMessage, position: toastPosition ?? LzToast.getConfig.position);
        } else if (alert == FormAlert.text) {
          if (singleNotifier) {
            notifiers[errorKey]?.setMessage(errorMessage, false);
          } else {
            final group = errorFields.groupBy('key', addKeys: ['key']);

            for (Map e in group) {
              Map map = (e[e['key']] as List).first;

              String key = map['key'];
              String type = map['type'];
              String message = map['message'] ?? 'Unknown error';

              if (messages != null) {
                message = messages.get(type, key) ?? message;
              }

              notifiers[key]?.setMessage(message, false);
            }
          }
        }

        // scroll to the error field
        GlobalKey? key = globalKeys[errorKey];
        if (key != null && key.currentContext != null) {
          Scrollable.ensureVisible(key.currentContext!, duration: const Duration(milliseconds: 300), alignment: .09);
        }

        return LxForm(
            ok: false,
            error: FormError(key: errorKey, type: errorType, message: errorMessage),
            value: controllers.toMap());
      }
    } catch (e, s) {
      Utils.errorCatcher(e, s);
    }

    return LxForm(ok: true, value: Map.fromIterables(forms.keys, forms.values.map((e) => e.controller)).toMap());
  }

  // input form-controls
  static Input2 input(
          {String? label,
          String? hint,
          FormType? type,
          FormStyle? style,
          bool indicator = false,
          bool obsecure = false,
          bool obsecureToggle = false,
          bool disabled = false,
          bool autofocus = false,
          TextInputType? keyboard,
          List<TextInputFormatter> formatters = const [],
          Function(TextEditingController control)? onTap,
          Function(String)? onChange,
          Function(String)? onSubmit,
          FormModelx? model,
          FocusNode? node,
          int maxLength = 255,
          int? maxLines}) =>
      Input2(
        label: label,
        hint: hint,
        type: type,
        style: style,
        indicator: indicator,
        obsecure: obsecure,
        obsecureToggle: obsecureToggle,
        disabled: disabled,
        autofocus: autofocus,
        keyboard: keyboard,
        formatters: formatters,
        onTap: onTap,
        onChange: onChange,
        onSubmit: onSubmit,
        model: model,
        node: node,
        maxLength: maxLength,
        maxLines: maxLines,
      );

  // radio form-controls
  static Radio2 radio({
    String? label,
    FormType? type,
    FormStyle? style,
    bool disabled = false,
    required List<String> options,
    Function(String value)? onChange,
    FormModelx? model,
  }) =>
      Radio2(
        label: label,
        options: options,
      );
}
