import 'package:lazyui/src/widgets/lxform/src/models/radio_style.dart';

import '../constants/form_type.dart';
import 'form_style.dart';

class Attribute {
  final FormType? type;
  final FormStyle? style;
  final RadioStyle? radioStyle;
  final bool isWrapped, isGrouped;

  const Attribute({this.type, this.style, this.isWrapped = false, this.isGrouped = false, this.radioStyle});
}