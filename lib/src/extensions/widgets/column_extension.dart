part of extension;

extension ColumnExtension on Column {
  /// ``` dart
  /// // This extension is used to align the children of a column to the start.
  ///
  /// Column(
  ///   children: [ Text('Hello'), Text('World') ]
  /// ).start,
  /// ```

  Column get start => Column(
        crossAxisAlignment: Caa.start,
        children: children,
      );

  /// ``` dart
  /// // This extension is used to align the children of a column to the end.
  ///
  /// Column(
  ///  children: [ Text('Hello'), Text('World') ]
  /// ).end,
  /// ```

  Column get end => Column(
        crossAxisAlignment: Caa.end,
        children: children,
      );
}
