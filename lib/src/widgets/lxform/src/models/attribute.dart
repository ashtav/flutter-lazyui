import 'package:lazyui/lazyui.dart';

class Attribute {
  final FormType? type;
  final FormStyle? style;
  final InputStyle? inputStyle;
  final RadioStyle? radioStyle;
  final CheckboxStyle? checkboxStyle;
  final SlideStyle? slideStyle;
  final bool isWrapped, isGrouped;

  const Attribute({this.type, this.style, this.isWrapped = false, this.isGrouped = false, this.inputStyle, this.radioStyle, this.checkboxStyle, this.slideStyle});
}