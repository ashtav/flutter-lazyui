import 'package:flutter/material.dart' hide Radio, Checkbox;
import 'package:flutter/services.dart';
import 'package:lazyui/lazyui.dart';

import 'elements/checkbox.dart';
import 'elements/input.dart';
import 'elements/number.dart';
import 'elements/radio.dart';
import 'form_model.dart';
import 'notifier.dart';

part 'extension.dart';

enum LzFormType { blank, topAligned, underlined, topInner }

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

    // ignore: invalid_use_of_protected_member
    return models[key]!.notifier.controller.text;
  }

  void set(String key, dynamic value) {
    // ignore: invalid_use_of_protected_member
    final notifier = models[key]!.notifier;
    notifier.controller.text = value.toString();
  }

  Map<String, dynamic> get value {
    final keys = models.keys.toList();
    // ignore: invalid_use_of_protected_member
    return Map.fromIterables(keys, List.generate(keys.length, (i) => models[keys[i]]!.notifier.controller.text));
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
    void Function(String value)? onChange,
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
}
