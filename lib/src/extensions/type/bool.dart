part of '../extension.dart';

/// Extends the functionality of the [bool] class with additional methods.
extension LzBoolExtension on bool {
  /// ``` dart
  /// // This extension is used to convert bool to int
  ///
  /// true.toInt(); // 1
  /// false.toInt(); // 0
  /// ```
  int toInt() => this ? 1 : 0;
}
