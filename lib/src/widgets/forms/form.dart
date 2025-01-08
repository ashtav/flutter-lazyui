// ignore_for_file: invalid_use_of_protected_member

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

class Obsecure extends StatelessWidget {
  final IconData? hide;
  final IconData? show;

  const Obsecure({super.key, this.hide, this.show});

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

  void set(String key, dynamic value) {
    Bindings.onRendered(() {
      final notifier = models[key]!.notifier;
      final type = notifier.type;

      notifier.controller.text = value.toString();

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
        notifier.toggleInvalid(false);
      }

      if (value is List) {
        notifier.setOption(value.map((e) => e.toString()).toList());
        return;
      }

      if (value is OptionSet) {
        notifier.controller.clear(); // Clear text controller

        // Apply filter if provided
        final filteredData = value.filter == null
            ? value.data
            : value.data
                .where((item) =>
                    item.containsKey(value.filter!.keys.first) &&
                    item[value.filter!.keys.first] == value.filter!.values.first)
                .toList();

        // Extract options and values
        notifier.options = filteredData.extract<String>(value.labelKey);
        notifier.values = value.valueKey != null ? filteredData.extract(value.valueKey!) : [];
        notifier.enabled = notifier.options.isNotEmpty;

        notifier.notify(); // Notify listeners
        return;
      }
    });
  }

  void enable(String key, bool value) {
    Bindings.onRendered(() {
      final notifier = models[key]!.notifier;
      notifier.enabled = value;
      notifier.notify();
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

  FormValidation validate({
    List<String> required = const [],
    List<String> min = const [],
    List<String> max = const [],
    List<String> email = const [],
    List<String> match = const [],
  }) {
    final controllers = Map.fromIterables(models.keys, models.values.map((e) => e.notifier.controller));
    final notifiers = Map.fromIterables(models.keys, models.values.map((e) => e.notifier));
    final globalKeys = Map.fromIterables(models.keys, models.values.map((e) => e.key));

    bool isRequiredAll = required.length == 1 && required.contains('*');
    bool isRequiredAllExcept = required.length > 1 && required.contains('*');

    if (isRequiredAll) {
      required = controllers.keys.toList();
    } else if (isRequiredAllExcept) {
      required.remove('*');
      required = controllers.keys.toList()..removeWhere((e) => required.contains(e));
    }

    List<String> formKeys = controllers.keys.toList();
    List<Map<String, dynamic>> errorFields = [];

    // index 0 and 1 will always be there, if index 1 is not a number, it will be 0
    List splitter(String str) {
      List<String> split = str.split(':');
      return [split[0], split.length < 2 ? 0 : split[1].numeric];
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
          notifiers[key]!.invalidType = 'min';
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

      bool isEmail(String email) => RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email);

      if (controllers[key] != null && !(isEmail(controllers[key]!.text.trim().toString())) && email.contains(key)) {
        errorFields.add({'key': key, 'type': 'email', 'message': 'The field $key is not a valid email'});
      }

      /* ------------------------------------------------------------------------
        | Match
        | */

      for (var e in match) {
        List<String> split = e.split(':');
        if (controllers[key] != null && split.length == 2) {
          String k1 = split[0], k2 = split[1];

          if (controllers[k1]?.text != controllers[k2]?.text) {
            errorFields
                .add({'key': k2, 'type': 'match', 'message': 'The field $k2 does not match with the field $k1.'});
          }
        }
      }
    }

    if (errorFields.isNotEmpty) {
      String errorKey = errorFields.first['key'];
      String errorType = errorFields.first['type'];
      String errorMessage = errorFields.first['message'];

      // scroll to the error field
      GlobalKey? key = globalKeys[errorKey];
      if (key != null && key.currentContext != null) {
        Scrollable.ensureVisible(key.currentContext!, duration: const Duration(milliseconds: 300), alignment: .09);
      }

      for (var e in errorFields) {
        String key = e['key'];
        String message = e['message'];

        notifiers[key]!.invalidMessage = message;
        notifiers[key]!.toggleInvalid(true);
      }

      return FormValidation(false, error: FormError(errorKey, errorType, errorMessage));
    }

    return FormValidation(true);
  }
}

class LzForm {
  static generate() {}

  static FormManager make(List<String> keys) {
    Map<String, FormNotifier> notifiers = {};

    for (var e in keys) {
      notifiers[e] = FormNotifier();
    }

    final mdoels =
        Map.fromIterables(keys, List.generate(keys.length, (i) => FormModel(notifiers[keys[i]]!, GlobalKey())));
    return FormManager(mdoels);
  }

  /// Creates a customizable input field with optional label, hint, events,
  /// appearance, and control properties. Supports validation and formatting.
  static Input input({
    // Text properties
    String? label,
    String? hint,

    // Event handlers
    void Function()? onTap,
    void Function(String value)? onChange,
    void Function(String value)? onSubmit,
    void Function(bool value)? onFocus,

    // Appearance properties
    IconData? suffixIcon,
    Widget? suffix,
    IconData? prefixIcon,
    Widget? prefix,

    // Control properties
    bool enabled = true,
    bool autofocus = false,
    FormModel? model,

    // Input properties
    TextInputType? keyboard,
    List<TextInputFormatter> formatters = const [],
    int maxLength = 255,
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

  static Number number({
    // Text properties
    String? label,
    String? hint,

    // Event handlers
    void Function()? onTap,
    void Function(int value)? onChange,
    void Function(String value)? onSubmit,
    void Function(bool value)? onFocus,

    // Appearance properties
    IconData? prefixIcon,
    Widget? prefix,

    // Control properties
    bool enabled = true,
    bool autofocus = false,
    FormModel? model,

    // Input properties
    TextInputType? keyboard,
    List<TextInputFormatter> formatters = const [],
    int max = 255,
    int min = 1,
  }) {
    return Number(
      // Text properties
      label: label,
      hint: hint,

      // Event handlers
      onChange: onChange,
      onSubmit: onSubmit,
      onFocus: onFocus,

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
    );
  }

  static Radio radio({
    String? label,
    void Function(String value)? onChange,
    FormModel? model,
    List<String> options = const [],
  }) {
    return Radio(
      label: label,
      onChange: onChange,
      model: model,
      options: options,
    );
  }

  static Checkbox checkbox({
    String? label,
    void Function(String value)? onChange,
    FormModel? model,
    List<String> options = const [],
  }) {
    return Checkbox(
      label: label,
      onChange: onChange,
      model: model,
      options: options,
    );
  }

  static Select select(
      {
      // Text properties
      String? label,
      String? hint,

      // Event handlers
      void Function()? onTap,
      void Function(String value)? onChange,

      // Appearance properties
      IconData? suffixIcon,
      Widget? suffix,

      // Control properties
      bool enabled = true,
      FormModel? model,
      List<String> options = const [],
      List values = const []}) {
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
        options: options,
        values: values);
  }

  static Slider slider({
    String? label,
    double? initValue,
    double min = 0,
    double max = 100,
    int? divisions,
    bool enabled = true,
    FormModel? model,
    void Function(double value)? onChange,
  }) {
    return Slider(
      label: label,
      initValue: initValue,
      min: min,
      max: max,
      divisions: divisions,
      enabled: enabled,
      model: model,
      onChange: onChange,
    );
  }

  static Switches switches({
    Key? key,
    String? label,
    void Function(bool)? onChange,
    bool initValue = false,
    bool reversed = false,
  }) {
    return Switches(
      key: key,
      label: label,
      onChange: onChange,
      initValue: initValue,
      reversed: reversed,
    );
  }
}
