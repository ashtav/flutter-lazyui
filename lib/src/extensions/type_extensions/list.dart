part of '../extension.dart';

/// Extends the functionality of the [List<T>] class with additional methods and properties.
extension LzListExtension<T> on List<T> {
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
  /// [{'id': 1, 'name': 'John Doe'}].updateWhere((e) => e.id == 1, (data, index) => data[index]['name'] = 'Jane Doe')
  /// ```
  void updateWhere(bool Function(T e) condition, dynamic data,
      {Function()? onFail}) {
    int i = indexWhere(condition);
    if (i >= 0) {
      this[i] = data;
      return;
    }
    onFail?.call();
  }

  /// ```dart
  /// List<int> numbers = [1, 2, 3, 4, 5];
  /// numbers.generate((item, i) => Text(item.toString()));
  /// ```

  List<E> generate<E>(E Function(T item, int i) generator) {
    return List.generate(length, (i) => generator(this[i], i));
  }

  /// Splits the list into chunks based on the specified sizes.
  ///
  /// The `chunk` method divides the list into sublists, where each sublist’s length
  /// corresponds to the values provided in the [sizes] list. If a specified chunk
  /// size exceeds the remaining elements, the last chunk will include only the remaining items.
  ///
  /// Example:
  /// ```dart
  /// List<int> numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  /// List<List<int>> result = numbers.chunk([2, 4, 3]);
  /// // Output: [[0, 1], [2, 3, 4, 5], [6, 7, 8]]
  /// ```
  ///
  /// - [sizes]: A list of integers specifying the desired sizes for each chunk.
  /// - Returns: A list of lists where each sublist represents a chunk based on the specified sizes.
  List<List<T>> chunk(List<int> sizes) {
    List<List<T>> chunks = [];
    int currentIndex = 0;

    for (var size in sizes) {
      // Ensure we don't go out of bounds
      if (currentIndex + size > length) {
        chunks.add(sublist(currentIndex, length));
        break;
      } else {
        chunks.add(sublist(currentIndex, currentIndex + size));
        currentIndex += size;
      }
    }

    return chunks;
  }
}

/// Extends the functionality of the [List<num>] class with additional methods and properties.
extension ListNumExtension on List<num> {
  /// ```dart
  /// [10, 50].numInRange<double>() // 30.5
  /// ```
  T numInRange<T extends num>() {
    if (isEmpty) return 0 as T;
    num start = length == 1 ? 0 : this[0];
    num end = length > 1 ? this[1] : this[0];
    num range = start + (Random().nextDouble() * (end - start));

    if (T == int) {
      return range.round() as T;
    } else {
      return range as T;
    }
  }
}

/// Extends the functionality of the [List<Map>] class with additional methods and properties.
extension LzListMapExtension on List<Map> {
  /// ``` dart
  /// List<Map> group = data.groupBy('gender', wrapWith: (data){
  ///   return [...data.map((e) => YourModel.fromJson(e))];
  /// }, addKeys: ['gender']);
  /// ```

  List<Map<String, dynamic>> groupBy<T>(String key,
      {String? groupKey,
      List<T> Function(List<Map<String, dynamic>> value)? wrap}) {
    try {
      List<Map<String, dynamic>> result = [];
      List<String> values = [];

      // check if the key is available
      // also get value by key, and store it in values
      for (Map f in this) {
        if (!f.keys.toList().contains(key)) {
          return this as List<Map<String, dynamic>>;
        }

        values.add(f[key]);
      }

      // loop unique values and get data where key is equal to value
      for (var k in values.toSet()) {
        final data =
            List<Map<String, dynamic>>.from([...where((e) => e[key] == k)]);
        final wrapped = wrap?.call(data) ?? data as T;
        result.add({groupKey ?? 'group_by': k, k: wrapped});
      }

      return result;
    } catch (e, s) {
      Utils.errorCatcher(e, s, tracing: true);
      return [];
      // throw Exception('$e, $s');
    }
  }
}

/* --------------------------------------------------------------------------
| List<String> Extension
| */

/// Extends the functionality of the [List<String>] class with additional methods and properties.
extension LzListStringExtension on List<String> {
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

    return date1 == date2
        ? '$date1, $time1 - $time2'
        : '$date1 $time1 - $date2 $time2';
  }
}

/// Extends the functionality of the [List<int>] class with additional methods.
extension LzRangeIteration on List<int> {
  /// ```dart
  /// [1, 5].iterate() // [1, 2, 3, 4, 5]
  /// [1, 5].iterate(reversed: true) // [5, 4, 3, 2, 1]
  /// ```
  List<int> iterate({bool reversed = false, int? fill}) {
    final start = this[0];
    final end = length > 1 ? this[1] : this[0];
    List<int> result = <int>[];

    for (var i = start; i <= end; i++) {
      result.add(i);
    }

    if (fill != null) {
      result = result.map((e) => fill).toList();
    }

    return reversed ? result.reversed.toList() : result;
  }

  /// ```dart
  /// get random value from list
  /// [1, 5].randomize // it will return random value between 1 and 5
  /// [3].randomize // it will return random value between 1 and 3
  /// ```

  int get randomize {
    if (isEmpty) return 0;
    int start = this[0], end = length > 1 ? this[1] : start;
    List<int> numbers = length > 1
        ? List.generate(end, (i) => i + start)
        : List.generate(start, (i) => i + 1);
    return numbers.getRandom().first;
  }
}

/// Extension on [List<IconData>] providing convenience methods for generating icon buttons.
extension LzIconButtonExtension on List<IconData> {
  /// Generates a list of [IconButton] widgets based on the list of [IconData].
  ///
  /// [onTap]: Callback function triggered when an icon button is tapped. Receives the index of the tapped icon.
  List<Widget> iconButton(Function(int index) onTap) {
    return generate((icon, i) {
      return IconButton(
        onPressed: () => onTap.call(i),
        icon: Icon(icon),
      );
    });
  }
}
