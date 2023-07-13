part of extensions;

extension CustomDurationExtension on int {
  /// ``` dart
  /// Timer(3.s, () => print('3 seconds later')); // 3 seconds later
  /// ```
  Duration get s => Duration(seconds: this);

  /// milliseconds
  Duration get ms => Duration(milliseconds: this);

  /// minutes
  Duration get m => Duration(minutes: this);

  /// hours
  Duration get h => Duration(hours: this);

  /// days
  Duration get d => Duration(days: this);

  /// weeks
  Duration get w => Duration(days: this * 7);

  /// months
  Duration get M => Duration(days: (this * 365.25 / 12).round());

  /// years
  Duration get y => Duration(days: (this * 365.25).round());
}
