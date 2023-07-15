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

  /// ``` dart
  /// [{'id': 1, 'name': 'John Doe'}].updateWhere((e) => e.id == 1, (data, index) => data[index]['name'] = 'Jane Doe')
  /// ```
  void updateWhere(bool Function(T e) condition, Function(List<T> data, int index) onUpdate, {Function()? onFail}) {
    int i = indexWhere(condition);
    if (i >= 0) {
      onUpdate(this, i);
      return;
    }
    onFail?.call();
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
          value: values.length > i ? values[i] : null,
          icon: icons.length > i ? icons[i] : null,
          disabled: disabled,
          style: style));
    }
    return options;
  }

  /// Formats a date range with time.
  ///
  /// The `dateRangeFormat` method can be called on a `String` object representing a date range with time. The date range should consist of two elements separated by a space.
  ///
  /// Example:
  /// ```dart
  /// String range = '2023-07-01 10:00 2023-07-01 14:30';
  /// String formattedRange = range.dateRangeFormat();
  /// print(formattedRange); // Output: 2023-07-01, 10:00 - 14:30
  /// ```
  ///
  /// The method returns the formatted date range as a `String`.
  ///
  /// If the dates in the first and second elements are the same, the format will be `<date>, <time1> - <time2>`. For example: `2023-07-01, 10:00 - 14:30`.
  /// If the dates in the first and second elements are different, the format will be `<date1> <time1> - <date2> <time2>`. For example: `2023-07-01 10:00 - 2023-07-02 14:30`.

  String dateRangeFormat() {
    final map = this.map((e) {
      final split = e.split(' ');
      return {'date': split[0], 'time': split.length > 1 ? split[1] : '00:00'};
    }).toList();

    String date1 = map[0]['date']!, date2 = map[1]['date']!;
    String time1 = map[0]['time']!, time2 = map[1]['time']!;

    return date1 == date2 ? '$date1, $time1 - $time2' : '$date1 $time1 - $date2 $time2';
  }
}

extension RangeIteration on List<int> {
  /// ```dart
  /// [1, 5].iterate() // [1, 2, 3, 4, 5]
  /// [1, 5].iterate(reversed: true) // [5, 4, 3, 2, 1]
  /// ```
  List<int> iterate({bool reversed = false, int? fill}) {
    final start = this[0];
    final end = this[1];
    final result = <int>[];

    for (var i = start; i <= end; i++) {
      result.add(i);
    }

    if (fill != null) {
      result.map((e) => fill).toList();
    }

    return reversed ? result.reversed.toList() : result;
  }
}
