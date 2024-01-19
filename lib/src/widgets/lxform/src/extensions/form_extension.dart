import 'package:lazyui/lazyui.dart';

import '../constants/form_alert.dart';
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
        notifier.option = null;
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
        this[e]!.notifier.option = null;
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
}
