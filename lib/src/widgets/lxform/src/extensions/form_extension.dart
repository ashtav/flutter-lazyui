// ignore_for_file: invalid_use_of_protected_member

import 'dart:async';

import 'package:lazyui/src/extensions/extension.dart';
import 'package:lazyui/src/widgets/lxform/lxform.dart';

import '../../../../utils/utils.dart';
import '../../../lztoast/src/enum.dart';
import '../utils/form_control.dart';

extension LxFormExtension on Map<String, LxFormModel> {
  /// ``` dart
  /// final forms = LxForm.make(['name', 'email', 'password']]);
  /// forms.fill({'name': 'John Doe'});
  /// ```
  Map<String, LxFormModel> fill(Map<String, dynamic> data,
      {List<String> except = const [], bool when = true}) {
    if (when) {
      for (var e in data.keys) {
        if (containsKey(e) && !except.contains(e)) {
          final notifier = this[e]!.notifier;
          String value = data[e] == null ? '' : data[e].toString();

          notifier.controller.text = value;
          notifier.textLength = value.length;
          notifier.setState();
        }
      }
    }

    return this;
  }

  /// Resets the form by clearing the values of form fields.
  ///
  /// The [except] parameter specifies a list of keys for fields that should not be reset.
  /// The [only] parameter specifies a list of keys for fields that should be reset.
  /// If both [except] and [only] are provided, [except] takes precedence.
  ///
  /// Returns a map of the form model after resetting.
  Map<String, LxFormModel> reset(
      {List<String> except = const [], List<String> only = const []}) {
    for (var e in keys) {
      if (!except.contains(e) && (only.isEmpty || only.contains(e))) {
        final notifier = this[e]!.notifier;

        notifier.controller.text = '';
        notifier.extra = null;
        notifier.selectedRadio = null;
        notifier.textLength = 0;
      }
    }

    return this;
  }

  /// ``` dart
  /// final forms = LxForm.make(['name', 'email', 'password']]);
  /// forms.unfill(['name']);
  /// ```

  void unfill(List<String> keys) {
    for (var e in keys) {
      if (containsKey(e)) {
        this[e]!.controller.text = '';
        this[e]!.notifier.extra = null;
        this[e]!.notifier.selectedRadio = null;
        this[e]!.notifier.selectedCheckbox = [];
      }
    }
  }

  /// Validates the form fields based on specified validation rules.
  ///
  /// The [required] parameter specifies a list of keys for fields that are required.
  /// The [min] parameter specifies a list of keys for fields that have a minimum length requirement.
  /// The [max] parameter specifies a list of keys for fields that have a maximum length requirement.
  /// The [email] parameter specifies a list of keys for fields that should contain valid email addresses.
  /// The [messages] parameter allows customizing error messages for different validation rules.
  /// The [alert] parameter determines how validation errors are displayed.
  /// The [toastPlacement] parameter specifies the placement of toast notifications if [alert] is set to FormAlert.toast.
  /// The [singleNotifier] parameter specifies whether to use a single notifier for all fields or individual notifiers.
  ///
  /// Returns the LxForm instance after validation.
  LxForm validate(
      {List<String> required = const [],
      List<String> min = const [],
      List<String> max = const [],
      List<String> email = const [],
      FormMessage? messages,
      FormAlert alert = FormAlert.toast,
      ToastPlacement? toastPlacement,
      bool singleNotifier = true}) {
    return LxForm.validate(this,
        required: required,
        min: min,
        max: max,
        email: email,
        messages: messages,
        alert: alert,
        toastPlacement: toastPlacement,
        singleNotifier: singleNotifier);
  }

  /// ``` dart
  /// final forms = LxForm.make(['name', 'email', 'password']]);
  /// forms.get('name');
  /// ```
  dynamic get(String key, {bool extra = false}) {
    return extra ? this[key]!.notifier.extra : this[key]!.controller.text;
  }

  /// ``` dart
  /// final forms = LxForm.make(['name', 'email', 'password']]);
  /// forms.value; // {name: '', email: ''}
  /// ```
  Map<String, dynamic> get value {
    Map<String, dynamic> value = {};

    for (var e in keys) {
      value[e] = this[e]!.controller.text;
    }

    return value;
  }

  /// ``` dart
  /// final forms = LxForm.make(['name', 'email', 'password']]);
  /// forms.toMap(except: ['password']); // {name: '', email: ''}
  /// ```
  Map<String, dynamic> toMap({List<String> except = const []}) {
    final data = <String, dynamic>{};

    for (var e in keys) {
      if (!except.contains(e)) {
        data[e] = this[e]!.controller.text;
      }
    }

    return data;
  }

  /// Enables or disables form models based on the provided keys.
  ///
  /// This function takes either a single key or a list of keys, and a boolean value.
  /// It iterates through the keys and, if the key exists in the current object
  /// and the associated form model is not null, it sets the form model's disabled state.
  /// The disabled state is set to the opposite of the provided boolean value.
  ///
  /// If `value` is true (or omitted), the form models are enabled. If `value` is false,
  /// the form models are disabled.
  ///
  /// Example:
  /// ```
  /// forms.enable('email'); // Enables the 'email' form model
  /// forms.enable(['email', 'username'], false); // Disables both 'email' and 'username' form models
  /// ```
  ///
  /// Parameters:
  ///   - `key` : A single key (String) or a list of keys (List<String>) to be processed.
  ///   - `[value]` : Optional. A boolean value to determine the enabled state. Defaults to `true`.
  ///
  /// Returns:
  ///   - Returns the current object, allowing for method chaining.
  Map<String, LxFormModel> enable(Object key, [bool value = true]) {
    List<String> keys = key is List<String> ? key : [key.toString()];

    for (var e in keys) {
      if (containsKey(e) && this[e] != null) {
        this[e]!.notifier.setDisabled(!value);
      }
    }

    return this;
  }

  /// Focuses on the specified form field.
  ///
  /// The [key] parameter specifies the key of the form field to focus on.
  /// The optional [value] parameter determines whether to focus on the field (default is true).
  ///
  /// Returns the updated map of form models after focusing on the field.
  Map<String, LxFormModel> focus(String key, [bool value = true]) {
    if (containsKey(key) && this[key] != null) {
      final notifier = this[key]!.notifier;
      notifier.timer?.cancel();

      notifier.timer = Timer(50.ms, () {
        notifier.node.requestFocus();
        notifier.timer?.cancel();
      });
    }

    return this;
  }

  FormControl set(String key) {
    final notifier = this[key]!.notifier;
    return FormControl(notifier);
  }

  /// Sets the form control for the specified key.
  ///
  /// The [key] parameter specifies the key of the form field.
  ///
  /// Returns the form control for the specified key.
  Map<String, LxFormModel> setValue(Object key, dynamic value) {
    List<String> keys = key is List<String> ? key : [key.toString()];

    for (var e in keys) {
      if (containsKey(e) && this[e] != null) {
        final notifier = this[e]!.notifier;

        // check if value is List<String>
        bool isListString = value is List && value.every((e) => e is String);

        // if value is List<String>, join the values with comma
        notifier.controller.text =
            isListString ? value.join(', ') : value.toString();

        // hide error message
        if (!notifier.isValid) {
          notifier.setMessage('', true);
        }

        if (notifier.isRadio) {
          notifier.setOptionFindBy(value);
        } else if (notifier.isCheckbox) {
          if (value is List) {
            notifier.setCheckboxFindBy(value);
          } else {
            logg('Invalid value type for checkbox, expected List',
                name: 'LxForm');
          }
        }
      }
    }

    return this;
  }

  /// Sets an extra value for the specified form field keys.
  ///
  /// The [key] parameter specifies the key or keys of the form field(s).
  /// The [value] parameter is the extra value to set.
  ///
  /// Returns the modified map of form fields.
  Map<String, LxFormModel> setExtra(Object key, dynamic value) {
    List<String> keys = key is List<String> ? key : [key.toString()];

    for (var e in keys) {
      if (containsKey(e) && this[e] != null) {
        final notifier = this[e]!.notifier;
        notifier.extra = value;
      }
    }

    return this;
  }

  /// Retrieves the extra value associated with the specified form field key.
  ///
  /// The [key] parameter specifies the key of the form field.
  ///
  /// Returns the extra value associated with the specified form field key, or null if not found.
  dynamic getExtra(String key) {
    dynamic result;

    if (containsKey(key) && this[key] != null) {
      final notifier = this[key]!.notifier;
      result = notifier.extra;
    }

    return result;
  }

  /// Retrieves the selected value associated with the specified form field key.
  ///
  /// The [key] parameter specifies the key of the form field.
  ///
  /// Returns the selected value associated with the specified form field key, or null if not found or if the field is not a select field.
  dynamic getSelect(String key) {
    dynamic result;

    if (containsKey(key) && this[key] != null) {
      final notifier = this[key]!.notifier;

      if (notifier.isSelect) {
        result = notifier.getSelect;
      }
    }

    return result;
  }

  /// Sets the options for a select form field and optionally shows the dropdown.
  ///
  /// The [key] parameter specifies the key of the form field.
  /// The [options] parameter specifies the list of options for the select field.
  /// The optional [andShow] parameter specifies whether to immediately show the dropdown after setting the options (default is false).
  /// The optional [disabled] parameter specifies a list of values to be disabled in the dropdown (default is an empty list).
  /// The optional [onSelected] parameter specifies a callback function to be called when an option is selected.
  ///
  /// Returns the updated map of form models.
  Map<String, LxFormModel> setSelectOption(Object key, List<LxOption> options,
      {bool andShow = false,
      List<dynamic> disabled = const [],
      Function(LxOption value)? onSelected}) {
    List<String> keys = key is List<String> ? key : [key.toString()];

    for (var e in keys) {
      if (containsKey(e) && this[e] != null) {
        final notifier = this[e]!.notifier;

        if (notifier.isSelect) {
          // set disabled options if any
          final reArangeOptions = disabled.isEmpty
              ? options
              : options.map((e) {
                  final map = e.toMap();

                  if (disabled.contains(e.value ?? e.label)) {
                    map['disabled'] = true;
                  }

                  return LxOption.fromMap(map);
                }).toList();

          // set options
          notifier.setSelectOption(reArangeOptions);

          // show select picker
          if (andShow && !notifier.disabled && !notifier.isSelectShow) {
            notifier.onTapSelect?.call();
          }

          // set on selected
          if (onSelected != null) {
            notifier.onSelected = onSelected;
          }
        }
      }
    }

    return this;
  }

  /// Shows the select picker for the specified form field.
  ///
  /// The [key] parameter specifies the key of the form field.
  ///
  /// Returns the updated map of form models.
  Map<String, LxFormModel> showSelectPicker(Object key) {
    List<String> keys = key is List<String> ? key : [key.toString()];

    for (var e in keys) {
      if (containsKey(e) && this[e] != null) {
        final notifier = this[e]!.notifier;

        if (notifier.isSelect && !notifier.disabled && !notifier.isSelectShow) {
          notifier.onTapSelect?.call();
        }
      }
    }

    return this;
  }
}
