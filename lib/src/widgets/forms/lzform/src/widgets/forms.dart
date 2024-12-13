// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart' as m;
import 'package:flutter/material.dart' hide Radio, Checkbox, Switch, Slider;
import 'package:flutter/services.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/theme/colors.dart';

import '../models/checkbox_model.dart';
import '../models/checkbox_value.dart';
import '../models/form_error.dart';
import '../models/radio_model.dart';
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

/// Represents the outcome of an Lz form submission.
class LzForm {
  /// True if successful, false otherwise.
  final bool ok;

  /// Error details if submission failed.
  final FormError? error;

  /// Submitted form values.
  final Map<String, dynamic> value;

  /// Extra data associated with the submission.
  final Map<String, dynamic> extra;

  /// Creates a new `LzForm` instance.
  LzForm(
      {this.ok = false,
      this.error,
      this.value = const {},
      this.extra = const {}});

  /// Creates a mapping of form keys to `FormModel` instances.
  ///
  /// This function takes a list of strings (`keys`) and generates a map where
  /// each key is associated with a `FormModel` instance. For each key in the
  /// provided list, a new `TextEditingController` and `FormNotifier` are created.
  /// These are then used to construct `FormModel` instances.
  ///
  /// The function returns a `Map<String, FormModel>`, where each key from the
  /// input list is mapped to a corresponding `FormModel` object. This map is
  /// useful for managing multiple forms or form fields in a dynamic way, such as
  /// in a form builder context.
  ///
  /// The `FormModel` objects are initialized with the newly created
  /// `TextEditingController`, `FormNotifier`, and a unique `GlobalKey`.
  ///
  /// Example:
  /// ```dart
  /// var formKeys = ['name', 'email', 'password'];
  /// var formMap = FormModel.make(formKeys);
  /// ```
  ///
  /// [keys] List of strings representing the keys for the form fields.
  /// Returns a Map of string keys to `FormModel` instances.

  static Map<String, FormModel> make(List<String> keys) {
    Map<String, TextEditingController> forms = {};
    Map<String, FormNotifier> notifiers = {};

    for (var e in keys) {
      forms[e] = TextEditingController();
      notifiers[e] = FormNotifier();
    }

    return Map.fromIterables(
        keys,
        List.generate(
            keys.length,
            (i) =>
                FormModel(forms[keys[i]]!, notifiers[keys[i]]!, GlobalKey())));
  }

  /// Validates a map of form fields against user input.
  ///
  /// This static method takes a map of `FormModel` objects and performs validation
  /// based on various criteria, including required fields, minimum/maximum lengths,
  /// email format checking, and custom messages.
  ///
  /// ```dart
  /// // init models
  /// final forms = LzForm.make(['name', 'email', 'password']]);
  ///
  /// // use in widget
  /// LzForm.input(label: 'Name', hint: 'Enter your name', model: forms['name']);
  ///
  /// // validate
  /// final form = LzForm.validate(forms, required: ['*']);
  /// if(form.ok) // do something...
  ///
  /// // validate params
  /// required: ['*'] // required all
  /// required: ['address', 'phone'] // required only address and phone
  /// required: ['*', 'address', 'phone'] // required all except address and phone
  ///
  /// min: ['phone:10', 'address:5']
  /// max: ['phone:15', 'address:100']
  /// email: ['email']
  ///
  /// ```

  static LzForm validate(Map<String, FormModel> forms,
      {List<String> required = const [],
      List<String> min = const [],
      List<String> max = const [],
      List<String> email = const [],
      List<String> match = const [],
      FormMessage? messages,
      FormAlert alert = FormAlert.text,
      ToastPlacement? toastPlacement,
      bool singleNotifier = true}) {
    try {
      Map<String, TextEditingController> controllers =
          Map.fromIterables(forms.keys, forms.values.map((e) => e.controller));
      Map<String, FormNotifier> notifiers =
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

        /* ------------------------------------------------------------------------
        | Match
        | */

        for (var e in match) {
          List<String> split = e.split(':');
          if (controllers[key] != null && split.length == 2) {
            String k1 = split[0], k2 = split[1];

            if (controllers[k1]?.text != controllers[k2]?.text) {
              errorFields.add({
                'key': k2,
                'type': 'match',
                'message': 'The field $k2 does not match with the field $k1.'
              });
            }
          }
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

        return LzForm(
            ok: false,
            error: FormError(
                key: errorKey, type: errorType, message: errorMessage),
            value: controllers.toMap(),
            extra: extra);
      }
    } catch (e, s) {
      Utils.errorCatcher(e, s);
    }

    return LzForm(
        ok: true,
        value: Map.fromIterables(
                forms.keys, forms.values.map((e) => e.notifier.controller))
            .toMap());
  }

  /// input form-controls with statefull
  // static Input2 input2({String? label, String? hint, FormModel? model, bool? disabled}) =>
  //     Input2(label: label, hint: hint, model: model, disabled: disabled);

  /// input form-controls
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
          FormModel? model,
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

  /// radio form-controls
  static Radio radio({
    String? label,
    required List<String> options,
    List<dynamic>? values,
    dynamic initValue,
    FormModel? model,
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

  /// checkbox form-controls
  static Checkbox checkbox({
    String? label,
    required List<String> options,
    List<dynamic>? values,
    List<dynamic> initValue = const [],
    FormModel? model,
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

  /// switch form-controls
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

  /// select form-controls
  static Select select(
          {String? label,
          String? hint,
          List<Option> options = const [],
          FormType? type,
          FormStyle? style,
          PickerStyle? pickerStyle,
          bool disabled = false,
          Future Function()? onTap,
          Function(SelectValue value)? onChange,
          FormModel? model}) =>
      Select(
          label: label,
          hint: hint,
          options: options,
          type: type,
          style: style,
          pickerStyle: pickerStyle,
          disabled: disabled,
          onTap: onTap,
          onChange: onChange,
          model: model);

  /// number form-controls
  static Number number(
          {String? label,
          String? hint,
          FormType? type,
          FormStyle? style,
          bool disabled = false,
          bool autofocus = false,
          Function(String)? onChange,
          FormModel? model,
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

  /// slider form-controls
  static Slider slider({
    String? label,
    double? initValue,
    double min = 0,
    double max = 100,
    int? divisions,
    bool disabled = false,
    FormModel? model,
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
