part of extension;

extension LzIntOrIfExtension on int? {
  int orIf([int defaultValue = 0, List<dynamic> conditions = const [null]]) {
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
