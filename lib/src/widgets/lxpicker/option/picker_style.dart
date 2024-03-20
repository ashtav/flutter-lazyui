/// Represents the style configuration for a picker.
class LxPickerStyle {
  /// The text to display on the confirm button.
  final String? confirmText;

  /// Determines whether the picker should occupy the full screen.
  final bool fullScreen;

  /// Determines whether a search feature should be included in the picker.
  final bool withSearch;

  /// The height of the picker.
  final double? height;

  /// The maximum number of lines to display.
  final int maxLines;

  /// Constructs a LxPickerStyle instance with the specified parameters.
  const LxPickerStyle({
    this.confirmText,
    this.fullScreen = false,
    this.withSearch = false,
    this.height,
    this.maxLines = 1,
  });
}
