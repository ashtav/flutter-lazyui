import 'package:flutter/material.dart';

import '../models/attribute.dart';
import '../widgets/forms_theme.dart';

mixin LxFormMixin {
  Attribute getAttribute<T>(BuildContext context) {
    // get ancestor widget name
    final fa = context.findAncestorWidgetOfExactType<LxFormTheme>();
    return Attribute(style: fa?.style, isGrouped: fa?.grouping ?? false, type: fa?.type);
  }
}
