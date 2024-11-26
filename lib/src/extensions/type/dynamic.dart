part of '../extension.dart';

/// Extension method to provide a fallback value if the object is null or meets certain conditions.
/// This extension can be applied to any data type.
extension LzDynamicExtension<T extends dynamic> on T? {
  /// Returns a fallback value if the object is null or meets certain conditions.
  ///
  /// The [defaultValue] parameter specifies the value to return if the object is null or meets the conditions.
  /// The [conditions] parameter is a list of values that the object is compared against.
  /// If the object matches any of the conditions or is null, the [defaultValue] is returned.
  /// If the object is not null and does not match any of the conditions, the object itself is returned.
  ///
  /// Example:
  /// ```dart
  /// String? nullableString = null;
  /// String result = nullableString.orElse('default'); // result will be 'default'
  /// ```
  T orElse([T? defaultValue, List<dynamic> conditions = const [null, '']]) {
    if (this == null || conditions.contains(this)) {
      bool isInt = T.toString().contains('int');
      bool isDouble = T.toString().contains('double');
      bool isString = T.toString().contains('String');
      bool isList = T.toString().contains('List');
      bool isMap = T.toString().contains('Map');
      bool isbool = T.toString().contains('bool');
      bool isWidget = T.toString().contains('Widget');

      if (isInt) {
        return (defaultValue ?? 0) as T;
      } else if (isDouble) {
        return (defaultValue ?? 0.0) as T;
      } else if (isString) {
        return (defaultValue ?? '') as T;
      } else if (isList) {
        return (defaultValue ?? []) as T;
      } else if (isMap) {
        return (defaultValue ?? {}) as T;
      } else if (isbool) {
        return (defaultValue ?? false) as T;
      } else if (isWidget) {
        return (defaultValue ?? Container()) as T;
      }

      return defaultValue as T;
    }
    return this!;
  }

  /// check null or empty
  bool get hasNullOrEmpty => this == null || toString().trim() == '';

  /// check null
  bool get hasNull => this == null;
}
