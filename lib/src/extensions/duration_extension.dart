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
}
