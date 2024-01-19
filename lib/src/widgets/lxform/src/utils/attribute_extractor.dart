import 'package:flutter/material.dart';

import '../models/attribute.dart';
import '../widgets/forms_theme.dart';

mixin Lx {
  Attribute getAttribute<T>(BuildContext context) {
    // get ancestor widget name
    final fa = context.findAncestorWidgetOfExactType<LxFormTheme>();

    // check first children of formGroupAncestor
    // bool isFirst = false;

    // // get first children of formGroupAncestor
    // if ((fa?.children ?? []).isNotEmpty) {
    //   if (fa!.children[0] is T) {
    //     final firstChild = fa.children[0] as T;
    //     isFirst = check(firstChild);
    //   }
    // }

    return Attribute(style: fa?.style, isGrouped: fa?.grouping ?? false, type: fa?.type);
  }
}
