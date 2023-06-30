part of extensions;

extension ListExtension<T> on List<T> {
  /// ```dart
  /// ['a', 'b', '4', 'e', '1'].getRandom() // ['e']
  /// ```
  List<T> getRandom([int length = 1]) {
    List<T> result = [];
    for (int i = 0; i < length; i++) {
      result.add(this[Random().nextInt(this.length)]);
    }
    return result;
  }

  /// ``` dart
  /// List<Option> options = ['A', 'B', 'C', 'D', 'E'].make((data, i) => Option(option: data))
  /// ```

  List<E> make<E>(E Function(T data, int i) callback) {
    List<E> list = [];
    for (int i = 0; i < length; i++) {
      list.add(callback(this[i], i));
    }
    return list;
  }
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
  List<Map<dynamic, dynamic>> groupBy(String key,
      {String? setKeyAs, Function(dynamic)? wrapWith, List<String> addKeys = const []}) {
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
  // convert list string to Option Widget
  List<Option> options(
      {List values = const [],
      List<IconData> icons = const [],
      List<int> disableds = const [],
      List<int> dangers = const [],
      Map<int, OptionStyle> Function(int index)? styles}) {
    List<Option> options = [];
    for (int i = 0; i < length; i++) {
      bool disabled = disableds.contains(i);
      OptionStyle? style = styles?.call(i)[i];

      if (dangers.contains(i)) {
        style = const OptionStyle(
          color: Colors.redAccent,
        );
      }

      options.add(Option(
          option: this[i],
          value: values.length > i ? values[i] : this[i],
          icon: icons.length > i ? icons[i] : null,
          disabled: disabled,
          style: style));
    }
    return options;
  }
}

extension RangeIteration on List<int> {
  List<int> iterate({bool reversed = false}) {
    final start = this[0];
    final end = this[1];
    final result = <int>[];

    for (var i = start; i <= end; i++) {
      result.add(i);
    }

    return reversed ? result.reversed.toList() : result;
  }
}
