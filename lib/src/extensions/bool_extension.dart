part of extension;

/// Extends the functionality of the [bool] class with additional methods.
extension LzDoubleExtension on bool {
  /// ``` dart
  /// // This extension is used to convert bool to int
  ///
  /// true.toNumber; // 1
  /// false.toNumber; // 0
  /// ```
  int get toInt => this ? 1 : 0;
}
