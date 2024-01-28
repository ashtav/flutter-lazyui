class PickerStyle {
  final String? confirmText;
  final bool fullScreen;
  final bool withSearch;
  final double? height;
  final int maxLines;

  const PickerStyle(
      {this.confirmText, this.fullScreen = false, this.withSearch = false, this.height, this.maxLines = 1});
}
