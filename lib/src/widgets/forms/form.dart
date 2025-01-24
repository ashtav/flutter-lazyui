// ignore_for_file: invalid_use_of_protected_member

import 'dart:async';

import 'package:flutter/material.dart' hide Radio, Checkbox, Slider;
import 'package:flutter/services.dart';
import 'package:lazyui/lazyui.dart';

import 'elements/checkbox.dart';
import 'elements/input.dart';
import 'elements/number.dart';
import 'elements/radio.dart';
import 'elements/select.dart';
import 'elements/slider.dart';
import 'elements/switches.dart';
import 'form_model.dart';
import 'notifier.dart';

export 'form_group.dart';
export 'form_model.dart' hide FormModel;

part 'extension.dart';

enum LzFormType { blank, topAligned, underlined, topInner }

class OptionSet {
  final List<Map<String, dynamic>> data;
  final String labelKey;
  final String? valueKey;
  final Map<String, dynamic>? filter;

  /// A utility class to define and manage selectable options for dropdowns or other selection-based widgets.
  ///
  /// The [OptionSet] class allows you to define a set of options based on a list of maps,
  /// specifying which keys in the map represent the labels and values for the options.
  /// You can also provide an optional filter to narrow down the available options.
  ///
  /// - [data] is the list of map objects containing the options.
  /// - [labelKey] specifies the key in each map that represents the label of the option.
  /// - [valueKey] optionally specifies the key in each map that represents the value of the option.
  /// - [filter] optionally provides a map to filter the options based on specific criteria.
  ///
  /// ### Example:
  /// ```dart
  /// final provinces = [
  ///   {'id': 1, 'name': 'Bali'},
  ///   {'id': 2, 'name': 'Jakarta'}
  /// ];
  ///
  /// final cities = [
  ///   {'id': 1, 'province_id': 1, 'name': 'Denpasar'},
  ///   {'id': 2, 'province_id': 1, 'name': 'Ubud'},
  ///   {'id': 3, 'province_id': 2, 'name': 'Central Jakarta'},
  ///   {'id': 4, 'province_id': 2, 'name': 'South Jakarta'}
  /// ];
  ///
  /// OptionSet(provinces, 'name', 'id');
  /// // Output: ['Bali', 'Jakarta']
  /// // 'id' provides values for the options, Output: [1, 2]
  ///
  /// OptionSet(cities, 'name', 'id', {'province_id': 2});
  /// // Output: ['Central Jakarta', 'South Jakarta']
  /// // 'id' provides values for the options, Output: [3, 4]
  /// ```
  const OptionSet(this.data, this.labelKey, [this.valueKey, this.filter]);
}

class Obscure extends StatelessWidget {
  final IconData? hide;
  final IconData? show;

  const Obscure({super.key, this.hide, this.show});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class FormManager {
  @protected
  final Map<String, FormModel> models;
  const FormManager(this.models);

  FormModel key(String key) {
    return models[key] ?? FormModel(FormNotifier(), GlobalKey());
  }

  dynamic get(String key) {
    if (!models.containsKey(key)) {
      return null;
    }

    return models[key]!.notifier.controller.text;
  }

  FormControl set(String key, [dynamic value]) {
    if (models[key] == null) {
      Print.error('Form key $key not found!');
      return FormControl(FormNotifier());
    }

    final notifier = models[key]!.notifier;

    if (value != null) {
      Bindings.onRendered(() {
        final type = notifier.type;

        if (!['select'].contains(type)) {
          notifier.controller.text = value.toString();
        }

        if (type == 'checkbox') {
          List<String> options = value.toString().replaceAll(', ', ',').split(',');
          notifier.setSelectedBox(options);
        }

        // radio input
        else if (['radio', 'slider'].contains(type)) {
          notifier.notify();
        }

        // select input
        else if (type == 'select' && value is Option) {
          notifier.controller.text = value.label;
          notifier.extra = value.value;
        }

        // input (with onTap is not null)
        else if (type == 'input-2' && value.toString().trim().isNotEmpty) {
          notifier.validate();
        }

        if (value is List) {
          notifier.setOption(value.map((e) => e.toString()).toList());
          return FormControl(notifier);
        }
      });
    }

    return FormControl(notifier);
  }

  void enable(String key, bool value) {
    Bindings.onRendered(() {
      final notifier = models[key]!.notifier;
      notifier.enabled = value;
      notifier.notify();
    });
  }

  void checkbox(String key, {List<String> disabled = const []}) {
    Bindings.onRendered(() {
      final notifier = models[key]!.notifier;
      if (notifier.type == 'checkbox') {
        notifier.disabled = disabled;
        notifier.notify();
      }
    });
  }

  void radio(String key, {List<String> disabled = const []}) {
    Bindings.onRendered(() {
      final notifier = models[key]!.notifier;
      if (notifier.type == 'radio') {
        notifier.disabled = disabled;
        notifier.notify();
      }
    });
  }

  Map<String, dynamic> get value {
    final keys = models.keys.toList();
    return Map.fromIterables(keys, List.generate(keys.length, (i) => models[keys[i]]!.notifier.controller.text));
  }

  dynamic extra(String key) {
    final notifier = models[key]!.notifier;
    return notifier.extra;
  }

  void fill(Map<String, dynamic> data) {
    Bindings.onRendered(() {
      List<String> keys = data.keys.toList();

      for (String key in keys) {
        set(key, data[key] ?? '');
      }
    });
  }

  void reset({List<String> except = const []}) {
    Bindings.onRendered(() {
      List<String> keys = models.keys.toList();

      for (String key in keys) {
        if (!except.contains(key)) {
          set(key, '');
        }
      }
    });
  }

  /// Validates the form fields based on specified validation rules.
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
  /// match: ['password:confirm_password']
  ///
  /// ```
  FormValidation validate(
      {List<String> required = const [],
      List<String> min = const [],
      List<String> max = const [],
      List<String> email = const [],
      List<String> match = const [],
      Map<String, String>? message,
      FormFeedback feedback = FormFeedback.text}) {
    final controllers = Map.fromIterables(models.keys, models.values.map((e) => e.notifier.controller));
    final notifiers = Map.fromIterables(models.keys, models.values.map((e) {
      e.notifier.rules = [];
      e.notifier.feedback = feedback;
      e.notifier.groupNotifier?.clear();

      return e.notifier;
    }));

    bool isRequiredAll = required.length == 1 && required.contains('*');
    bool isRequiredAllExcept = required.length > 1 && required.contains('*');

    if (isRequiredAll) {
      required = controllers.keys.toList();
    } else if (isRequiredAllExcept) {
      required = controllers.keys.toList()..removeWhere((e) => required.contains(e));
    }

    bool exist(String key) => controllers[key] != null;

    // check required for all input value
    for (var key in required) {
      if (exist(key)) {
        String value = controllers[key]!.text;

        final error = {
          'key': key,
          'type': 'required',
          'value': value,
          'message': message?[key] ?? 'The field $key is required'
        };
        notifiers[key]!.rules.add(error);
      }
    }

    // min
    for (var key in min) {
      List<String> split = key.split(':');

      if (split.length > 1) {
        key = split[0];

        if (exist(key)) {
          int min = split[1].numeric;

          final error = {
            'key': key,
            'type': 'min',
            'value': min,
            'message': message?['$key:min'] ?? 'The field $key must be at least ${split[1]} characters'
          };

          notifiers[key]!.rules.add(error);
        }
      }
    }

    // max
    for (var key in max) {
      List<String> split = key.split(':');

      if (split.length > 1) {
        key = split[0];

        if (exist(key)) {
          int max = split[1].numeric;

          final error = {
            'key': key,
            'type': 'max',
            'value': max,
            'message': message?['$key:max'] ?? 'The field $key must be at most ${split[1]} characters'
          };

          notifiers[key]!.rules.add(error);
        }
      }
    }

    // email
    for (var key in email) {
      if (exist(key)) {
        final error = {
          'key': key,
          'type': 'email',
          'message': message?['$key:email'] ?? 'The field $key is not a valid email'
        };
        notifiers[key]!.rules.add(error);
      }
    }

    // match
    for (var key in match) {
      List<String> split = key.split(':');

      if (split.length >= 2) {
        String k1 = split[0], k2 = split[1];

        if (exist(k1) && exist(k2)) {
          final error = {
            'key': key,
            'type': 'match',
            'value': notifiers[k1],
            'message': message?['$key:match'] ?? 'The field $k2 does not match with the field $k1.'
          };

          notifiers[k2]!.rules.add(error);
        }
      }
    }

    // validate
    for (var key in models.keys) {
      final notifier = notifiers[key];

      if (notifier != null) {
        notifier.validate();
      }
    }

    List<Map<String, dynamic>> errors = [];

    for (var key in models.keys) {
      if (exist(key)) {
        final notifier = notifiers[key]!;

        for (var rule in notifier.rules) {
          if (rule['invalid'] == true) {
            String message = rule['message'];
            errors.add({'key': key, 'message': message});
          }
        }
      }
    }

    if (errors.isNotEmpty) {
      final map = errors.first;
      final globalKeys = Map.fromIterables(models.keys, models.values.map((e) => e.key));

      String key = map['key'];
      String message = map['message'];

      // scroll to input position
      GlobalKey? gkey = globalKeys[key];
      if (gkey != null && gkey.currentContext != null) {
        Scrollable.ensureVisible(gkey.currentContext!, duration: const Duration(milliseconds: 300), alignment: .09);
      }

      if (feedback == FormFeedback.toast) {
        LzToast.show(message);
      }

      return FormValidation(false, error: FormError(key, message));
    }

    return FormValidation(true, value: models.value);
  }
}

class LzForm {
  static generate() {}

  static FormManager make(List<String> keys) {
    Map<String, FormNotifier> notifiers = {};

    for (var e in keys) {
      notifiers[e] = FormNotifier();
      notifiers[e]?.key = e;
    }

    final mdoels =
        Map.fromIterables(keys, List.generate(keys.length, (i) => FormModel(notifiers[keys[i]]!, GlobalKey())));
    return FormManager(mdoels);
  }

  /// Creates a customizable input field with support for labels, hints, events,
  /// appearance customization, and control options. Includes validation and formatting.
  static Input input({
    /// The label text displayed above the input field.
    String? label,

    /// The hint text displayed inside the input field when it is empty.
    String? hint,

    /// Called when the input field is tapped.
    void Function()? onTap,

    /// Called when the value of the input field changes.
    void Function(String value)? onChange,

    /// Called when the user submits the input value (e.g., by pressing "Enter").
    void Function(String value)? onSubmit,

    /// Called when the focus state of the input field changes.
    void Function(bool value)? onFocus,

    /// The icon displayed at the end of the input field.
    IconData? suffixIcon,

    /// A custom widget displayed at the end of the input field.
    Widget? suffix,

    /// The icon displayed at the beginning of the input field.
    IconData? prefixIcon,

    /// A custom widget displayed at the beginning of the input field.
    Widget? prefix,

    /// Whether the input field is enabled or disabled.
    bool enabled = true,

    /// Whether the input field should gain focus automatically when the widget is built.
    bool autofocus = false,

    /// A form model for managing input values and validation.
    FormModel? model,

    /// The type of keyboard to use for the input field.
    TextInputType? keyboard,

    /// A list of input formatters to apply to the input field.
    List<TextInputFormatter> formatters = const [],

    /// The maximum number of characters allowed in the input field.
    int maxLength = 255,

    /// The maximum number of lines allowed in the input field.
    int? maxLines,
  }) {
    return Input(
      // Text properties
      label: label,
      hint: hint,

      // Event handlers
      onTap: onTap,
      onChange: onChange,
      onSubmit: onSubmit,
      onFocus: onFocus,

      // Appearance properties
      suffixIcon: suffixIcon,
      suffix: suffix,
      prefixIcon: prefixIcon,
      prefix: prefix,

      // Control properties
      enabled: enabled,
      autofocus: autofocus,
      model: model,

      // Input properties
      keyboard: keyboard,
      formatters: formatters,
      maxLength: maxLength,
      maxLines: maxLines,
    );
  }

  /// Creates a customizable number input field with optional label, hint, events,
  /// appearance, and control properties. Supports validation and formatting.
  static Number number({
    /// The label displayed above the input field.
    String? label,

    /// The hint text displayed inside the input field when it's empty.
    String? hint,

    // Event Handlers
    /// Callback when the input value changes.
    void Function(int value)? onChange,

    /// Callback when the input is submitted.
    void Function(String value)? onSubmit,

    /// Callback when the input gains or loses focus.
    void Function(bool value)? onFocus,

    // Appearance Properties
    /// The icon displayed before the input field.
    IconData? prefixIcon,

    /// Custom widget displayed before the input field.
    Widget? prefix,

    // Control Properties
    /// Determines if the input is enabled or disabled.
    bool enabled = true,

    /// If true, the input gains focus automatically when the widget is built.
    bool autofocus = false,

    /// The model that controls form validation and submission.
    FormModel? model,

    // Input Properties
    /// Defines the keyboard type for the input field.
    TextInputType? keyboard,

    /// List of input formatters to modify the input value.
    List<TextInputFormatter> formatters = const [],

    /// The maximum value allowed for the input.
    int max = 255,

    /// The minimum value allowed for the input.
    int min = 1,
  }) {
    return Number(
      // Text properties
      label: label,
      hint: hint,

      // Appearance properties
      prefixIcon: prefixIcon,
      prefix: prefix,

      // Control properties
      enabled: enabled,
      autofocus: autofocus,
      model: model,

      // Input properties
      formatters: formatters,
      max: max,
      min: min,

      // Event handlers
      onChange: onChange,
      onSubmit: onSubmit,
      onFocus: onFocus,
    );
  }

  /// Creates a customizable radio button group with optional label, events,
  /// and control properties.
  static Radio radio({
    /// The label displayed above the radio group.
    String? label,

    /// Callback when a radio button value changes.
    void Function(String value)? onChange,

    /// The model that controls form validation and submission.
    FormModel? model,

    /// List of options available for the radio buttons.
    List<String> options = const [],
  }) {
    return Radio(
      // Event handlers
      onChange: onChange,

      // Control properties
      model: model,

      // Input properties
      options: options,

      // Text properties
      label: label,
    );
  }

  /// Creates a customizable checkbox group with optional label, events,
  /// and control properties.
  static Checkbox checkbox({
    /// The label displayed above the checkbox group.
    String? label,

    /// Callback when a checkbox value changes.
    void Function(String value)? onChange,

    /// The model that controls form validation and submission.
    FormModel? model,

    /// List of options available for the checkboxes.
    List<String> options = const [],
  }) {
    return Checkbox(
      // Event handlers
      onChange: onChange,

      // Control properties
      model: model,

      // Input properties
      options: options,

      // Text properties
      label: label,
    );
  }

  /// Creates a customizable select dropdown with optional label, hint, events,
  /// appearance, and control properties.
  static Select select({
    /// The label displayed above the select dropdown.
    String? label,

    /// The hint text displayed inside the select dropdown when empty.
    String? hint,

    /// Callback when the select dropdown is tapped.
    Future Function()? onTap,

    /// Callback when a value is selected.
    void Function(String value)? onChange,

    /// Icon displayed at the end of the input field.
    IconData? suffixIcon,

    /// Custom widget displayed at the end of the input field.
    Widget? suffix,

    /// Whether the select dropdown is enabled or not.
    bool enabled = true,

    /// The model that controls form validation and submission.
    FormModel? model,

    /// List of options available in the dropdown.
    List<String> options = const [],

    /// List of selected values.
    List values = const [],
  }) {
    return Select(
      // Text properties
      label: label,
      hint: hint,

      // Event handlers
      onTap: onTap,
      onChange: onChange,

      // Appearance properties
      suffixIcon: suffixIcon,
      suffix: suffix,

      // Control properties
      enabled: enabled,
      model: model,

      // Input properties
      options: options,
      values: values,
    );
  }

  /// Creates a customizable slider with optional label, initial value,
  /// min/max range, and event handling properties.
  static Slider slider({
    /// The label displayed above the slider.
    String? label,

    /// The initial value of the slider.
    double? initValue,

    /// The minimum value of the slider.
    double min = 0,

    /// The maximum value of the slider.
    double max = 100,

    /// The number of discrete divisions for the slider.
    int? divisions,

    /// Whether the slider is enabled or not.
    bool enabled = true,

    /// The model that controls form validation and submission.
    FormModel? model,

    /// Callback when the slider value changes.
    void Function(double value)? onChange,
  }) {
    return Slider(
      // Text properties
      label: label,

      // Input properties
      initValue: initValue,
      min: min,
      max: max,
      divisions: divisions,

      // Control properties
      enabled: enabled,
      model: model,

      // Event handlers
      onChange: onChange,
    );
  }

  /// Creates a customizable switch with optional label, initial value,
  /// event handling, and reversed appearance properties.
  static Switches switches({
    /// The key for the widget, useful for managing widget state.
    Key? key,

    /// The label displayed next to the switch.
    String? label,

    /// Callback when the switch value changes.
    void Function(bool)? onChange,

    /// The initial value of the switch (on or off).
    bool initValue = false,

    /// Whether the switch's appearance is reversed (i.e., on/off labels).
    bool reversed = false,
  }) {
    return Switches(
      // Widget properties
      key: key,

      // Text properties
      label: label,

      // Event handlers
      onChange: onChange,

      // Control properties
      initValue: initValue,
      reversed: reversed,
    );
  }
}

/// Represents a control for managing form fields.
class FormControl {
  /// The form notifier instance associated with this control.
  @protected
  final FormNotifier notifier;

  /// Constructs a [FormControl] with the specified notifier.
  FormControl(this.notifier);

  /// Enables or disables the form control.
  ///
  /// Returns this form control after enabling or disabling it.
  FormControl enable([bool value = true]) {
    notifier.enabled = value;
    notifier.notify();
    return this;
  }

  /// Sets extra data associated with the form control.
  ///
  /// Returns this form control after setting the extra data.
  FormControl extra(dynamic value) {
    notifier.extra = value;
    return this;
  }

  /// Focuses on the form control.
  ///
  /// Returns this form control after focusing on it.
  FormControl focus() {
    notifier.timer?.cancel();
    notifier.timer = Timer(50.ms, () {
      notifier.focusNode.requestFocus();
      notifier.timer?.cancel();
    });
    return this;
  }

  /// Sets the maximum length for input validation in the associated [FormNotifier].
  ///
  /// Returns this [FormControl] instance after setting the maximum length.
  FormControl maxLength(int value) {
    notifier.maxLength = value;
    notifier.notify();
    return this;
  }

  FormControl options(List<Map<String, dynamic>> data) {
    notifier.options = data.extract<String>('label');
    notifier.values = data.extract<dynamic>('value');
    notifier.notify(); // Notify listeners

    return this;
  }
}
