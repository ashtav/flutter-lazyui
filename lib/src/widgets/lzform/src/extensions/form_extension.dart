// ignore_for_file: invalid_use_of_protected_member

import 'dart:async';

import 'package:lazyui/lazyui.dart';

import '../utils/form_control.dart';

/// Extension on a map of `String` keys and `FormModel` values.
extension LzFormExtension on Map<String, FormModel> {
  /// ``` dart
  /// final forms = LzForm.make(['name', 'email', 'password']]);
  /// forms.fill({'name': 'John Doe'});
  /// ```
  Map<String, FormModel> fill(Map<String, dynamic> data,
      {List<String> except = const [], bool when = true}) {
    Bindings.onRendered(() {
      if (when) {
        for (var e in data.keys) {
          if (containsKey(e) && !except.contains(e)) {
            final notifier = this[e]!.notifier;
            dynamic value = data[e];

            if (notifier.isRadio) {
              notifier.setOptionFindBy(value);
            } else if (notifier.isSelect) {
              notifier.setSelect(
                  value is Option ? value : Option(value.toString()));
            } else if (notifier.isCheckbox) {
              if (value is List) {
                notifier.setCheckboxFindBy(value);
              }
            } else {
              notifier.controller.text = value.toString();
              notifier.textLength = value.toString().length;
              notifier.setState();
            }
          }
        }
      }
    });

    return this;
  }

  /// Resets the form by clearing the values of form fields.
  ///
  /// The [except] parameter specifies a list of keys for fields that should not be reset.
  /// The [only] parameter specifies a list of keys for fields that should be reset.
  /// If both [except] and [only] are provided, [except] takes precedence.
  ///
  /// Returns a map of the form model after resetting.
  Map<String, FormModel> reset(
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
  /// final forms = LzForm.make(['name', 'email', 'password']]);
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
  /// Returns the LzForm instance after validation.
  LzForm validate(
      {List<String> required = const [],
      List<String> min = const [],
      List<String> max = const [],
      List<String> email = const [],
      FormMessage? messages,
      FormAlert alert = FormAlert.toast,
      ToastPlacement? toastPlacement,
      bool singleNotifier = true}) {
    return LzForm.validate(this,
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
  /// final forms = LzForm.make(['name', 'email', 'password']]);
  /// forms.get('name');
  /// ```
  dynamic get(String key, {bool extra = false}) {
    return extra ? this[key]!.notifier.extra : this[key]!.controller.text;
  }

  /// ``` dart
  /// final forms = LzForm.make(['name', 'email', 'password']]);
  /// forms.value; // {name: '', email: ''}
  /// ```
  Map<String, dynamic> get value {
    Map<String, dynamic> value = {};

    for (var e in keys) {
      value[e] = this[e]!.notifier.controller.text;
    }

    return value;
  }

  /// ``` dart
  /// final forms = LzForm.make(['name', 'email', 'password']]);
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
  Map<String, FormModel> enable(Object key, [bool value = true]) {
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
  Map<String, FormModel> focus(String key, [bool value = true]) {
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

  /// Retrieves a `FormControl` for the specified key from the map.
  ///
  /// Returns a `FormControl` associated with the provided [key]. If the key is not found
  /// or the corresponding `FormModel` is `null`, this method will throw an exception.
  FormControl set(String key) {
    final notifier = this[key]!.notifier;
    return FormControl(notifier);
  }

  /// Sets a specified value for multiple keys in the map.
  ///
  /// This method iterates through a list of keys and sets the provided value
  /// for each key in the map. It uses the `setValue` method to update the value
  /// for each key. If a key does not exist in the map, it should be handled
  /// accordingly in the `setValue` method.
  ///
  /// - [keys]: A list of keys to be updated.
  /// - [value]: The value to set for each key.
  ///
  /// Returns the updated map.
  ///
  /// Example:
  /// ```dart
  /// Map<String, FormModel> formMap = {
  ///   'name': FormModel(),
  ///   'email': FormModel(),
  /// };
  ///
  /// formMap.setMany(['name', 'email'], 'new value');
  ///
  /// // After calling setMany, the formMap will have 'new value' set for 'name' and 'email'.
  /// ```
  ///
  /// Note: Ensure that the `setValue` method is defined to handle the value
  /// setting logic for the keys appropriately.
  Map<String, FormModel> setMany(List<String> keys, dynamic value) {
    for (var key in keys) {
      setValue(key, value);
    }

    return this;
  }

  /// Sets the form control for the specified key.
  ///
  /// The [key] parameter specifies the key of the form field.
  ///
  /// Returns the form control for the specified key.
  Map<String, FormModel> setValue(Object key, dynamic value) {
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
        } else if (notifier.isSelect) {
          notifier
              .setSelect(value is Option ? value : Option(value.toString()));
        } else if (notifier.isCheckbox) {
          if (value is List) {
            notifier.setCheckboxFindBy(value);
          } else {
            logg('Invalid value type for checkbox, expected List',
                name: 'LzForm');
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
  Map<String, FormModel> setExtra(Object key, dynamic value) {
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

  /// Updates the provided data map with extra values for specified keys.
  ///
  /// This method iterates through a list of keys and updates the corresponding
  /// values in the `data` map with the extra values associated with the keys in
  /// the current map. If a key exists in the current map and has an extra value,
  /// the value in the `data` map is updated; otherwise, it remains unchanged.
  ///
  /// - [data]: The map to be updated with extra values.
  /// - [keys]: The list of keys to check for extra values.
  ///
  /// Example:
  /// ```dart
  /// Map<String, dynamic> data = {'name': 'Alice', 'age': 25};
  /// List<String> keys = ['name', 'city'];
  ///
  /// setFromExtra(data, keys);
  ///
  /// // After calling setFromExtra, data might be updated to:
  /// // {'name': 'Alice', 'age': 25, 'city': 'New York'}
  /// // if 'city' has an extra value 'New York' associated with it.
  /// ```
  ///
  /// Note: This method assumes that the current map contains keys with associated
  /// notifiers that have an `extra` property. If a key does not exist in the current
  /// map or has no associated extra value, the value in the `data` map remains unchanged.
  void setFromExtra(Map<String, dynamic> data, List<String> keys) {
    for (String key in keys) {
      if (data.containsKey(key)) {
        data[key] = getExtra(key);
      }
    }
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
  Map<String, FormModel> setSelectOption(Object key, List<Option> options,
      {bool andShow = false,
      List<dynamic> disabled = const [],
      Function(Option value)? onSelected}) {
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

                  return Option.fromMap(map);
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
  Map<String, FormModel> showSelectPicker(Object key) {
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
