import 'package:flutter/material.dart';

import 'values.dart';

extension ListenableExtension<T extends ChangeNotifier> on T {
  AnimatedBuilder watch(Widget Function(T) child) {
    return AnimatedBuilder(
      animation: this,
      builder: (context, _) => child(this),
    );
  }
}

extension FormModelExtension on Map<String, FormModel> {
  /// ``` dart
  /// final forms = LzForm.make(['name', 'email', 'password']]);
  /// forms.fill({'name': 'John Doe'});
  /// ```
  Map<String, FormModel> fill(Map<String, dynamic> data,
      {List<String> except = const []}) {
    for (var e in data.keys) {
      if (containsKey(e) && !except.contains(e)) {
        this[e]!.controller.text = data[e] == null ? '' : data[e].toString();
      }
    }

    return this;
  }

  /// ``` dart
  /// final forms = LzForm.make(['name', 'email', 'password']]);
  /// forms.get('name');
  /// ```
  String get(String key) {
    return this[key]!.controller.text;
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
