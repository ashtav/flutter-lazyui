import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lazyui/lazyui.dart';

import 'elements/input.dart';
import 'form_model.dart';
import 'notifier.dart';

part 'extension.dart';

enum LzFormType { blank, topAligned, underlined, topInner }

class Foo {
  @protected
  final Map<String, FormModel> models;
  const Foo(this.models);

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
}

class LzForm {
  static generate() {}

  static Foo make(List<String> keys) {
    Map<String, FormNotifier> notifiers = {};

    for (var e in keys) {
      notifiers[e] = FormNotifier();
    }

    final mdoels =
        Map.fromIterables(keys, List.generate(keys.length, (i) => FormModel(notifiers[keys[i]]!, GlobalKey())));
    return Foo(mdoels);
  }

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
    IconData? suffix,

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
}

// LzForm.generate(models)
