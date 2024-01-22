import 'package:lazyui/lazyui.dart';

import '../models/form_message.dart';

extension LxFormExtension on Map<String, FormModelx> {
  /// ``` dart
  /// final forms = LzForm.make(['name', 'email', 'password']]);
  /// forms.fill({'name': 'John Doe'});
  /// ```
  Map<String, FormModelx> fill(Map<String, dynamic> data, {List<String> except = const [], bool when = true}) {
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

  Map<String, FormModelx> reset({List<String> except = const [], List<String> only = const []}) {
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
      }
    }
  }

  LxForm validate(
      {List<String> required = const [],
      List<String> min = const [],
      List<String> max = const [],
      List<String> email = const [],
      FormMessage? messages,
      FormAlert alert = FormAlert.toast,
      Position? toastPosition,
      bool singleNotifier = true}) {
    return LxForm.validate(this,
        required: required,
        min: min,
        max: max,
        email: email,
        messages: messages,
        alert: alert,
        toastPosition: toastPosition,
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
      value[e] = this[e]!.controller.text;
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
  Map<String, FormModelx> enable(Object key, [bool value = true]) {
    List<String> keys = key is List<String> ? key : [key.toString()];

    for (var e in keys) {
      if (containsKey(e) && this[e] != null) {
        this[e]!.notifier.setDisabled(!value);
      }
    }

    return this;
  }

  Map<String, FormModelx> setText(Object key, String value) {
    List<String> keys = key is List<String> ? key : [key.toString()];

    for (var e in keys) {
      if (containsKey(e) && this[e] != null) {
        this[e]!.notifier.controller.text = value;
      }
    }

    return this;
  }
}
