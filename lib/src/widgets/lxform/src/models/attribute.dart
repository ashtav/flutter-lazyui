import '../constants/form_type.dart';
import 'form_style.dart';

class Attribute {
  final FormType? type;
  final FormStyle? style;
  final bool isGrouped;

  const Attribute({this.type, this.style, this.isGrouped = false});
}