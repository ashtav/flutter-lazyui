part of extension;

/// Extends the functionality of the [int?] class with an additional method.
extension LzIntOrIfExtension on int? {
  /// A method to return the value of the [int?] if it's not null and not in specified conditions; otherwise, returns a default value.
  ///
  /// The [defaultValue] parameter sets the value to return if the [int?] object is null or matches any of the conditions specified in [conditions].
  /// The [conditions] parameter is a list of values that, if equal to the [int?], will trigger the use of [defaultValue].
  ///
  /// Example usage:
  /// ```dart
  /// int? number = 42;
  /// int result = number.orIf(0, [null, 42]);
  /// print(result); // 0 (because 42 is in the conditions)
  ///
  /// int? anotherNumber = 10;
  /// int anotherResult = anotherNumber.orIf(0, [null, 42]);
  /// print(anotherResult); // 10 (because it's not null and not in the conditions)
  /// ```
  int orIf([int defaultValue = 0, List<dynamic> conditions = const [null]]) {
    // Implementation details for checking conditions and returning the value.
    // ...
    // Return the value based on conditions and defaultValue.
    if (this == null || conditions.contains(this)) {
      return defaultValue;
    }
    return this!;
  }
}

extension LzDoubleOrIfExtension on double? {
  double orIf(
      [double defaultValue = 0, List<dynamic> conditions = const [null]]) {
    if (this == null || conditions.contains(this)) {
      return defaultValue;
    }
    return this!;
  }
}

extension LzBoolOrIfExtension on bool? {
  bool orIf(
      [bool defaultValue = false, List<dynamic> conditions = const [null]]) {
    if (this == null || conditions.contains(this)) {
      return defaultValue;
    }
    return this!;
  }
}

extension LzStringOrIfExtension on String? {
  /// Instead of
  /// ```dart
  /// String? name;
  /// String displayName = (name == null || name == '') ? '-' : name;
  /// ```
  ///
  /// You can write
  /// ```dart
  /// String displayName = name.orIf('-')
  /// name.orIf('-', [null, '-', 'null']) // to add custom conditions
  /// ```

  String orIf(
      [String defaultValue = '-',
      List<dynamic> conditions = const [null, '']]) {
    if (this == null || conditions.contains(this)) {
      return defaultValue;
    }
    return this!;
  }
}

extension LzDynamicExtension on dynamic {
  // check null or empty
  bool get hasNullOrEmpty => this == null || toString().trim() == '';

  // check null
  bool get hasNull => this == null;
}
