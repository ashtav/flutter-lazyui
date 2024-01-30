import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lazyui/lazyui.dart';

import 'dropdown.dart';
export 'dropdown_option.dart';
export 'dropdown_style.dart';
export 'dropdown_value.dart';

class LzDrop {
  static void show(GlobalKey key,
      {List<DropOption> options = const [], DropStyle? style, void Function(DropValue value)? onSelect}) {
    try {
      // only accept GlobalKey or BuildContext
      if ([BuildContext, GlobalKey].contains(key.runtimeType)) {
        return logg('Context is invalid!', name: 'LzDrop');
      } else if (key.currentContext == null) {
        return logg(
            'GlobalKey is not attached to any widget. Make sure you have added the GlobalKey to a widget that has been built.',
            name: 'LzDrop');
      }

      BuildContext context = key.currentContext!;

      // render box of the target
      final box = context.findRenderObject() as RenderBox?;
      final o = box?.localToGlobal(Offset.zero);
      Offset target = o ?? Offset.zero;

      // show dropdown
      context.dialog(Dropdown(target: target, box: box, options: options, style: style, onSelect: onSelect),
          barrierColor: style?.barrierColor);
    } catch (e, s) {
      Utils.errorCatcher(e, s);
    }
  }
}
