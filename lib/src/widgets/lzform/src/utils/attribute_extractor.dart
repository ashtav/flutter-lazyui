import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../models/attribute.dart';

mixin LzFormMixin {
  Attribute getAttribute<T>(BuildContext context) {
    // get ancestor widget name
    final fa = context.findAncestorWidgetOfExactType<LzFormTheme>();
    return Attribute(style: fa?.style, isWrapped: fa != null, isGrouped: fa?.grouping ?? false, type: fa?.type);
  }

  // ignore: library_private_types_in_public_api
  _TopInnerLineLabel getTopInnerLineLabel({Color? color}) {
    return _TopInnerLineLabel(color: color);
  }
}

class _TopInnerLineLabel extends StatelessWidget {
  final Color? color;
  const _TopInnerLineLabel({this.color});

  @override
  Widget build(BuildContext context) {
    return Poslign(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 3,
        color: color ?? 'fafafa'.hex,
        width: context.width,
        margin: Ei.only(t: 1.5),
      ),
    );
  }
}
