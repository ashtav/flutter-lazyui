// ignore_for_file: invalid_use_of_protected_member

library forms;

import 'package:flutter/material.dart' as m;
import 'package:flutter/material.dart' hide Radio, Checkbox, Switch, Slider;
import 'package:flutter/services.dart';
import 'package:lazyui/lazyui.dart';

import '../models/checkbox_model.dart';
import '../models/checkbox_value.dart';
import '../models/form_error.dart';
import '../models/radio_model.dart';
import '../models/select_value.dart';
import '../notifiers/form_notifier.dart';
import '../utils/attribute_extractor.dart';
import 'form_controls/switches.dart';
import 'form_feedback.dart';

part 'form_controls/checkbox.dart';
part 'form_controls/input.dart';
part 'form_controls/number.dart';
part 'form_controls/radio.dart';
part 'form_controls/select.dart';
part 'form_controls/slider.dart';

class LxForm {
  final bool ok;
  final FormError? error;
  final Map<String, dynamic> value;
  final Map<String, dynamic> extra;

  LxForm(
      {this.ok = false,
      this.error,
      this.value = const {},
      this.extra = const {}});

  /// Creates a mapping of form keys to `LxFormModel` instances.
  ///
  /// This function takes a list of strings (`keys`) and generates a map where
  /// each key is associated with a `LxFormModel` instance. For each key in the
  /// provided list, a new `TextEditingController` and `LxFormTheme` are created.
  /// These are then used to construct `LxFormModel` instances.
  ///
  /// The function returns a `Map<String, LxFormModel>`, where each key from the
  /// input list is mapped to a corresponding `LxFormModel` object. This map is
  /// useful for managing multiple forms or form fields in a dynamic way, such as
  /// in a form builder context.
  ///
  /// The `LxFormModel` objects are initialized with the newly created
  /// `TextEditingController`, `LxFormTheme`, and a unique `GlobalKey`.
  ///
  /// Example:
  /// ```dart
  /// var formKeys = ['name', 'email', 'password'];
  /// var formMap = LxFormModel.make(formKeys);
  /// ```
  ///
  /// [keys] List of strings representing the keys for the form fields.
  /// Returns a Map of string keys to `LxFormModel` instances.

  static Map<String, LxFormModel> make(List<String> keys) {
    Map<String, TextEditingController> forms = {};
    Map<String, LxFormNotifier> notifiers = {};

    for (var e in keys) {
      forms[e] = TextEditingController();
      notifiers[e] = LxFormNotifier();
    }

    return Map.fromIterables(
        keys,
        List.generate(
            keys.length,
            (i) =>
                LxFormModel(forms[keys[i]]!, notifiers[keys[i]]!, GlobalKey())));
  }

  /// Fills the provided form models with data.
  ///
  /// This static function takes a map of `LxFormModel` objects and a data map, then
  /// populates the `TextEditingController` of each form model with the corresponding
  /// value from the data map. If a key in the data map matches a key in the form
  /// models map, and is not listed in the `except` list, its value will be used to
  /// set the text of the associated `TextEditingController`.
  ///
  /// This is useful for pre-filling form fields with existing data, such as when
  /// editing information that was previously saved.
  ///
  /// The function returns the updated map of `LxFormModel` objects with their
  /// controllers' text set according to the provided data.
  ///
  /// Example:
  /// ```dart
  /// var formModels = {
  ///   'name': LxFormModel(...),
  ///   'email': LxFormModel(...),
  /// };
  /// var data = {'name': 'John Doe', 'email': 'johndoe@example.com'};
  /// formModels = LxFormModel.fill(formModels, data);
  /// ```
  ///
  /// [forms] Map of `LxFormModel` objects, keyed by string.
  /// [data] Map of data used to fill the form models, keyed by string.
  /// [except] Optional list of string keys to exclude from filling.
  /// Returns the updated map of `LxFormModel` objects.

  static Map<String, LxFormModel> fill(
      Map<String, LxFormModel> forms, Map<String, dynamic> data,
      {List<String> except = const []}) {
    for (var e in data.keys) {
      if (forms.containsKey(e) && !except.contains(e)) {
        forms[e]!.controller.text = data[e] == null ? '' : data[e].toString();
      }
    }

    return forms;
  }

  /// Resets the text of form controllers in the provided map of `LxFormModel` objects.
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
  ///   'name': LxFormModel(...),
  ///   'email': LxFormModel(...),
  /// };
  /// // Reset only 'name' field
  /// LxFormModel.reset(formModels, only: ['name']);
  /// // Reset all except 'email'
  /// LxFormModel.reset(formModels, except: ['email']);
  /// // Reset all fields
  /// LxFormModel.reset(formModels);
  /// ```
  ///
  /// [forms] Map of `LxFormModel` objects, keyed by string.
  /// [only] Optional list of string keys to exclusively reset.
  /// [except] Optional list of string keys to exclude from resetting.

  static void reset(Map<String, LxFormModel> forms,
      {List<String> only = const [], List<String> except = const []}) {
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

  static LxForm validate(Map<String, LxFormModel> forms,
      {List<String> required = const [],
      List<String> min = const [],
      List<String> max = const [],
      List<String> email = const [],
      FormMessage? messages,
      FormAlert alert = FormAlert.toast,
      ToastPlacement? toastPlacement,
      bool singleNotifier = true}) {
    try {
      Map<String, TextEditingController> controllers =
          Map.fromIterables(forms.keys, forms.values.map((e) => e.controller));
      Map<String, LxFormNotifier> notifiers =
          Map.fromIterables(forms.keys, forms.values.map((e) => e.notifier));
      Map<String, GlobalKey> globalKeys =
          Map.fromIterables(forms.keys, forms.values.map((e) => e.key));
      Map<String, dynamic> extra = {};

      List<Map<String, dynamic>> errorFields = [];

      bool isRequiredAll = required.length == 1 && required.contains('*');
      bool isRequiredAllExcept = required.length > 1 && required.contains('*');

      if (isRequiredAll) {
        required = controllers.keys.toList();
      } else if (isRequiredAllExcept) {
        required.remove('*');
        required = controllers.keys.toList()
          ..removeWhere((e) => required.contains(e));
      }

      List<String> formKeys = controllers.keys.toList();

      // index 0 and 1 will always be there, if index 1 is not a number, it will be 0
      List splitter(String str) {
        List<String> split = str.split(':');
        return [split[0], split.length < 2 ? 0 : split[1].getNumeric];
      }

      // check keys (required, min, max, email) if they are in the forms
      for (String key in formKeys) {
        // set extra
        if (notifiers[key]?.extra != null) {
          extra[key] = notifiers[key]?.extra;
        }

        /* ------------------------------------------------------------------------
        | Required
        | */

        if (controllers[key] != null &&
            controllers[key]!.text.trim().isEmpty &&
            required.contains(key)) {
          errorFields.add({
            'key': key,
            'type': 'required',
            'message': 'The field $key is required'
          });
        }

        /* ------------------------------------------------------------------------
        | Minimum Length
        | */

        for (var e in min) {
          List split = splitter(e);
          if (controllers[key] != null &&
              controllers[key]!.text.trim().length < split[1] &&
              split[0] == key) {
            errorFields.add({
              'key': key,
              'type': 'min',
              'message':
                  'The field $key must be at least ${split[1]} characters'
            });
          }
        }

        /* ------------------------------------------------------------------------
        | Maximum Length
        | */

        for (var e in max) {
          List split = splitter(e);
          if (controllers[key] != null &&
              controllers[key]!.text.trim().length > split[1] &&
              split[0] == key) {
            errorFields.add({
              'key': key,
              'type': 'max',
              'message': 'The field $key must be at most ${split[1]} characters'
            });
          }
        }

        /* ------------------------------------------------------------------------
        | Email
        | */

        if (controllers[key] != null &&
            !controllers[key]!.text.trim().toString().isEmail &&
            email.contains(key)) {
          errorFields.add({
            'key': key,
            'type': 'email',
            'message': 'The field $key is not a valid email'
          });
        }
      }

      /* ------------------------------------------------------------------------
      | Conclusion
      | */

      // Get keys that are not contained in the errorFields
      List<String> keys = controllers.keys.toList()
        ..removeWhere((e) => errorFields.map((e) => e['key']).contains(e));

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
          LzToast.show(errorMessage,
              placement: toastPlacement ?? LzToast.config.placement);
        } else if (alert == FormAlert.text) {
          if (singleNotifier) {
            notifiers[errorKey]?.setMessage(errorMessage, false);
          } else {
            final group = errorFields.groupBy('key', groupKey: 'key');

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
          Scrollable.ensureVisible(key.currentContext!,
              duration: const Duration(milliseconds: 300), alignment: .09);
        }

        return LxForm(
            ok: false,
            error: FormError(
                key: errorKey, type: errorType, message: errorMessage),
            value: controllers.toMap(),
            extra: extra);
      }
    } catch (e, s) {
      Utils.errorCatcher(e, s);
    }

    return LxForm(
        ok: true,
        value:
            Map.fromIterables(forms.keys, forms.values.map((e) => e.controller))
                .toMap());
  }

  // input form-controls
  static Input input(
          {String? label,
          String? hint,
          FormType? type,
          InputStyle? style,
          bool indicator = false,
          bool obsecure = false,
          bool obsecureToggle = false,
          bool disabled = false,
          bool autofocus = false,
          TextInputType? keyboard,
          List<TextInputFormatter> formatters = const [],
          Function(String text)? onTap,
          Function(String)? onChange,
          Function(String)? onSubmit,
          LxFormModel? model,
          FocusNode? node,
          int maxLength = 255,
          int? maxLines}) =>
      Input(
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
  static Radio radio({
    String? label,
    required List<String> options,
    List<dynamic>? values,
    dynamic initValue,
    LxFormModel? model,
    List<dynamic> disabled = const [],
    FormType? type,
    RadioStyle? style,
    Function(RadioValue value)? onChange,
  }) =>
      Radio(
        label: label,
        options: options,
        values: values ?? [],
        initValue: initValue,
        model: model,
        disabled: disabled,
        type: type,
        style: style,
        onChange: onChange,
      );

  // checkbox form-controls
  static Checkbox checkbox({
    String? label,
    required List<String> options,
    List<dynamic>? values,
    List<dynamic> initValue = const [],
    LxFormModel? model,
    List<dynamic> disabled = const [],
    FormType? type,
    CheckboxStyle? style,
    Function(List<CheckboxValue> value)? onChange,
  }) =>
      Checkbox(
        label: label,
        options: options,
        values: values ?? [],
        initValue: initValue,
        model: model,
        disabled: disabled,
        type: type,
        style: style,
        onChange: onChange,
      );

  // switch form-controls
  static Switches switches(
          {String? label,
          SwitchStyle? style,
          dynamic Function(bool)? onChange,
          bool initValue = false,
          bool reversed = false}) =>
      Switches(
          label: label,
          style: style,
          onChange: onChange,
          initValue: initValue,
          reversed: reversed);

  // select form-controls
  static Select select({
    String? label,
    String? hint,
    List<LxOption> options = const [],
    FormType? type,
    FormStyle? style,
    bool disabled = false,
    Future Function()? onTap,
    Function(SelectValue value)? onChange,
    LxFormModel? model,
  }) =>
      Select(
        label: label,
        hint: hint,
        options: options,
        type: type,
        style: style,
        disabled: disabled,
        onTap: onTap,
        onChange: onChange,
        model: model,
      );

  // number form-controls
  static Number number(
          {String? label,
          String? hint,
          FormType? type,
          FormStyle? style,
          bool disabled = false,
          bool autofocus = false,
          Function(String)? onChange,
          LxFormModel? model,
          FocusNode? node,
          int min = 0,
          int max = 100,
          int step = 1,
          bool controls = true,
          List<IconData>? iconControls}) =>
      Number(
        label: label,
        hint: hint,
        type: type,
        style: style,
        disabled: disabled,
        autofocus: autofocus,
        onChange: onChange,
        model: model,
        node: node,
        min: min,
        max: max,
        step: step,
        controls: controls,
        iconControls: iconControls,
      );

  // slider form-controls
  static Slider slider({
    String? label,
    double? initValue,
    double min = 0,
    double max = 100,
    int? divisions,
    bool disabled = false,
    LxFormModel? model,
    Function(double value)? onChange,
    SlideStyle? style,
    Widget Function(double value)? indicator,
  }) =>
      Slider(
        label: label,
        initValue: initValue,
        min: min,
        max: max,
        divisions: divisions,
        disabled: disabled,
        model: model,
        onChange: onChange,
        style: style,
        indicator: indicator,
      );
}
