import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lazyui/src/utils/log.dart';

import '../widgets/select_picker.dart';

extension ListExtension on List {
  /// ```dart
  /// ['a', 'b', '4', 'e', '1'].getRandom() // ['e']
  /// ```
  List getRandom([int length = 1]) {
    List result = [];
    for (int i = 0; i < length; i++) {
      result.add(this[Random().nextInt(this.length)]);
    }
    return result;
  }

  /// ``` dart
  /// List<Option> options = ['A', 'B', 'C', 'D', 'E'].make((data, i) => Option(option: data[i]))
  /// ```

  List<T> make<T>(T Function(List data, int i) callback) {
    List<T> list = [];
    for (int i = 0; i < length; i++) {
      list.add(callback(this, i));
    }
    return list;
  }

  /// ``` dart
  /// ['A', 'B', 'C', 'D', 'E'].logs; // A, B, C, D, E
  /// ```
  void get logs => forEach((e) => logg(e));
}

extension ListNumExtension on List<num> {
  /// ```dart
  /// [10, 50].numInRange() // 30.5
  /// ```
  numInRange([Type type = double]) {
    if (isEmpty) return 0;
    num start = this[0], end = length > 1 ? this[1] : this[0];
    num result = start + (Random().nextDouble() * (end - start));
    return result = type == int ? result.round() : result;
  }
}

extension ListMapExtension on List<Map> {
  /// ``` dart
  /// List<Map> group = data.groupBy('gender', wrapWith: (data){
  ///   return [...data.map((e) => YourModel.fromJson(e))];
  /// }, addKeys: ['gender']);
  /// ```
  List<Map<dynamic, dynamic>> groupBy(String key, {String? setKeyAs, Function(dynamic)? wrapWith, List<String> addKeys = const []}) {
    try {
      List<Map<dynamic, dynamic>> result = [];
      List keys = [];

      for (Map f in this) {
        keys.add(f[key]);

        if (!f.keys.toList().contains(key)) {
          return this;
        }
      }

      for (var k in [...keys.toSet()]) {
        List data = [...where((e) => e[key] == k)];
        Map map = {};

        if (addKeys.isNotEmpty) {
          for (var k in addKeys) {
            map[k] = data.first[k];
          }
        }

        if (wrapWith != null) {
          data = wrapWith(data);
        }

        if (setKeyAs != null) map['group_by'] = k;

        //remove key (group_by)
        //data.forEach((w) => w.removeWhere((k, v) => k == key));
        map[setKeyAs ?? k] = data;

        result.add(map);
      }

      return result;
    } catch (e) {
      throw Exception('$e');
    }
  }
}

/* --------------------------------------------------------------------------
| List<String> Extension
| */

extension ListStringExtension on List<String> {
  List<Option> makeOptions({List values = const [], List<IconData> icons = const [], List<int> disableds = const []}) {
    List<Option> options = [];
    for (int i = 0; i < length; i++) {
      bool disabled = disableds.contains(i);

      options
          .add(Option(option: this[i], value: values.length > i ? values[i] : this[i], icon: icons.length > i ? icons[i] : null, disabled: disabled));
    }
    return options;
  }
}
