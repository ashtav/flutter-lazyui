import 'package:lazyui/lazyui.dart';

/// A class representing attributes for UI components.
class Attribute {
  /// The type of form.
  final FormType? type;

  /// The style of form.
  final FormStyle? style;

  /// The style of input.
  final InputStyle? inputStyle;

  /// The style of radio buttons.
  final RadioStyle? radioStyle;

  /// The style of checkboxes.
  final CheckboxStyle? checkboxStyle;

  /// The style of slides.
  final SlideStyle? slideStyle;

  /// Whether the UI component is wrapped.
  final bool isWrapped;

  /// Whether the UI component is grouped.
  final bool isGrouped;

  /// Constructs an [Attribute].
  ///
  /// [type] : The type of form.
  ///
  /// [style] : The style of form.
  ///
  /// [isWrapped] : Whether the UI component is wrapped. Defaults to false.
  ///
  /// [isGrouped] : Whether the UI component is grouped. Defaults to false.
  ///
  /// [inputStyle] : The style of input.
  ///
  /// [radioStyle] : The style of radio buttons.
  ///
  /// [checkboxStyle] : The style of checkboxes.
  ///
  /// [slideStyle] : The style of slides.
  const Attribute({
    this.type,
    this.style,
    this.isWrapped = false,
    this.isGrouped = false,
    this.inputStyle,
    this.radioStyle,
    this.checkboxStyle,
    this.slideStyle,
  });
}
