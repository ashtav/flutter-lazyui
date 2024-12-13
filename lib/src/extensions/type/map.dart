part of '../extension.dart';

/// Extends the functionality of a map containing [TextEditingController] objects.
extension LzMapTextEditingControllerExtension
    on Map<String, TextEditingController> {
  /// ``` dart
  /// Map<String, dynamic> data = forms.toMap(manipulate: (map) {
  ///   return map.numberOnly(['price', 'stock']).ucwords(['name']);
  /// });
  /// ```
  Map<String, dynamic> toMap(
      {Map<String, dynamic> Function(Map<String, dynamic>)? manipulate}) {
    Map<String, dynamic> map =
        this.map((key, value) => MapEntry(key, value.text));

    return manipulate == null ? map : manipulate(map);
  }
}

/// Extends the functionality of a map with keys of type [String] and values of type [dynamic].
extension MapStringExtension on Map<String, dynamic> {
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
  /// Map<String, dynamic> data = {'name': 'John Doe'}.lowers(['name']); // {'name': 'john doe'}
  /// ```
  Map<String, dynamic> lowers([List<String> keys = const []]) {
    return map((key, value) {
      if (keys.contains(key)) {
        return MapEntry(key, value.toString().toLowerCase());
      } else {
        return MapEntry(key, value);
      }
    });
  }

  /// ``` dart
  /// Map<String, dynamic> data = {'name': 'John Doe'}.uppers(['name']); // {'name': 'JOHN DOE'}
  /// ```
  Map<String, dynamic> uppers([List<String> keys = const []]) {
    return map((key, value) {
      if (keys.contains(key)) {
        return MapEntry(key, value.toString().toUpperCase());
      } else {
        return MapEntry(key, value);
      }
    });
  }

  /// ``` dart
  /// Map<String, dynamic> data = {'price': 2500}.currency(['price']); // {'price': '2.500'}
  /// ```
  Map<String, dynamic> currency(
      [List<String> keys = const [],
      String prefix = '',
      String separator = ',']) {
    return map((key, value) {
      if (keys.contains(key)) {
        if (value.toString().isEmpty) {
          return MapEntry(key, value);
        }

        String result = NumberFormat.currency(
          locale: 'id_ID',
          decimalDigits: 0,
          symbol: prefix,
        ).format(int.parse(value.toString()));

        return MapEntry(key, result.replaceAll('.', separator));
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

  /// ``` dart
  /// Map<String, dynamic> data = {'no': 1, 'label': 'Apple'}.renameKeys({
  ///   'no': 'id', 'label': 'name'
  /// }); // {'id': 1, 'name': 'Apple'}
  /// ```

  Map<String, dynamic> renameKeys(Map<String, String> map) {
    return this.map((key, value) {
      if (map.containsKey(key)) {
        return MapEntry(map[key]!, value);
      } else {
        return MapEntry(key, value);
      }
    });
  }
}

/// An extension on `Map` that provides functionality to truncate string values.
///
/// The [MapGenericExtension] extension adds a `truncate` method to any map,
/// allowing truncation of `String` values based on a specified maximum length.
/// It applies truncation not only to top-level string values, but also
/// to strings inside lists or nested maps.
///
/// This is useful for ensuring that long string data in a map is shortened
/// for display or storage, with an ellipsis (`...`) added to truncated values.
///
/// Example usage:
/// ```dart
/// Map<String, dynamic> example = {
///   "title": "A Very Long Title That Needs Truncation",
///   "tags": ["example-tag", "a-very-long-tag-that-needs-to-be-shortened"],
///   "nested": {
///     "description": "This is a lengthy description that should be truncated."
///   }
/// };
///
/// Map<String, dynamic> truncatedExample = example.truncate(20);
/// print(truncatedExample);
/// // Output:
/// // {
/// //   "title": "A Very Long Title Tha...",
/// //   "tags": ["example-tag", "a-very-long-tag-tha..."],
/// //   "nested": {"description": "This is a lengthy de..."}
/// // }
/// ```
///
extension MapGenericExtension<K, V> on Map<K, V> {
  /// Truncates string values in the map to a specified [maxLength], defaulting to 30.
  ///
  /// - [maxLength]: The maximum length for each string. If a string exceeds
  ///   this length, it is truncated, and an ellipsis (`...`) is appended.
  ///   The default value is 30 characters.
  ///
  /// This method iterates through each entry in the map:
  /// - If the `value` is a `String` and exceeds [maxLength], it is truncated
  ///   to [maxLength] characters and `...` is added.
  /// - If the `value` is a `List<String>`, each string in the list is truncated
  ///   as described above.
  /// - If the `value` is another `Map`, the `truncate` method is applied
  ///   recursively to that nested map.
  /// - For other types, values are left unchanged.
  ///
  /// Returns a new `Map` with truncated values where applicable.
  Map<K, V> truncate([int maxLength = 30]) {
    return map((key, value) {
      if (value is String && value.length > maxLength) {
        // Truncate single string value and add ellipsis
        return MapEntry(key, '${value.substring(0, maxLength)}...' as V);
      } else if (value is List && value.isNotEmpty && value.first is String) {
        // Truncate each string in a list of strings
        List<String> truncatedList = value.map<String>((item) {
          return item.length > maxLength
              ? '${item.substring(0, maxLength)}...'
              : item;
        }).toList();
        return MapEntry(key, truncatedList as V);
      } else if (value is Map) {
        // Recursively apply truncation to nested maps
        return MapEntry(key, (value as Map).truncate(maxLength) as V);
      }
      // Return unchanged for non-string values
      return MapEntry(key, value);
    });
  }
}
