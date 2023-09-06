part of extension;

extension LzDoubleExtension on bool {
  /// ``` dart
  /// // This extension is used to convert bool to int
  ///
  /// true.toNumber; // 1
  /// false.toNumber; // 0
  /// ```
  int get toInt => this ? 1 : 0;
}
