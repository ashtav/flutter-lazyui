import 'package:flutter/material.dart';

import './dynamic_extension.dart';
import './string_extension.dart';

extension MapTECExtension on Map<String, TextEditingController> {
  /// ``` dart
  /// Map<String, dynamic> data = forms.toMap(manipulate: (map) {
  ///   return map.numberOnly(['price', 'stock']).ucwords(['name']);
  /// });
  /// ```
  Map<String, dynamic> toMap({Map<String, dynamic> Function(Map<String, dynamic>)? manipulate}) {
    Map<String, dynamic> map = this.map((key, value) => MapEntry(key, value.text));

    return manipulate == null ? map : manipulate(map);
  }
}

extension MapExtension on Map<String, dynamic> {
  /// ``` dart
  /// Map<String, dynamic> data = {'name': 'John'}.add({'id': 1}); // {'name': 'John', 'id': 1}
  /// ```
  Map<String, dynamic> add(Map<String, dynamic> map) {
    return {...this, ...map};
  }

  /// ``` dart
  /// Map<String, dynamic> data = {'price': 'IDR 250'}.numeric(['price']); // {'price': 250}
  /// ```
  Map<String, dynamic> numeric([List<String> keys = const []]) {
    return map((key, value) {
      if (keys.contains(key)) {
        return MapEntry(key, value.toString().getNumeric);
      } else {
        return MapEntry(key, value);
      }
    });
  }

  /// ``` dart
  /// Map<String, dynamic> data = {'name': 'john doe'}.ucfirst(['name']); // {'name': 'John doe'}
  /// ```
  Map<String, dynamic> ucfirst([List<String> keys = const []]) {
    return map((key, value) {
      if (keys.contains(key)) {
        return MapEntry(key, value.toString().ucfirst);
      } else {
        return MapEntry(key, value);
      }
    });
  }

  /// ``` dart
  /// Map<String, dynamic> data = {'name': 'john doe'}.ucwords(['name']); // {'name': 'John Doe'}
  /// ```
  Map<String, dynamic> ucwords([List<String> keys = const []]) {
    return map((key, value) {
      if (keys.contains(key)) {
        return MapEntry(key, value.toString().ucwords);
      } else {
        return MapEntry(key, value);
      }
    });
  }

  /// ``` dart
  /// Map<String, dynamic> data = {'price': 2500}.currency(['price']); // {'price': '2.500'}
  /// ```
  Map<String, dynamic> currency([List<String> keys = const [], String prefix = '']) {
    return map((key, value) {
      if (keys.contains(key)) {
        return MapEntry(key, value.toString().idr(symbol: prefix));
      } else {
        return MapEntry(key, value);
      }
    });
  }

  /// ``` dart
  /// Map<String, dynamic> data = {'id': 1, 'name': 'Apple', 'price': 2500}.removes(['id','name']); // {'price': 2500}
  /// ```

  Map<String, dynamic> removes([List<String> keys = const []]) {
    return this..removeWhere((key, value) => keys.contains(key));
  }

  /// ``` dart
  /// Map<String, dynamic> data = {'id': 1, 'name': 'Apple', 'price': 2500}.get(['name']); // {'name': 'Apple'}
  /// ```

  Map<String, dynamic> get([List<String> keys = const []]) {
    return this..removeWhere((key, value) => !keys.contains(key));
  }
}
