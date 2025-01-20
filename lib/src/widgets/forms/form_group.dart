// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/config.dart';
import 'package:lazyui/src/widgets/forms/elements/number.dart';
import 'package:lazyui/src/widgets/forms/elements/select.dart';

import 'elements/input.dart';
import 'notifier.dart';

mixin FormMixin {
  Attribute getAttribute<T>(BuildContext context) {
    final fa = context.findAncestorWidgetOfExactType<FormGroup>();

    return Attribute(isGrouped: fa != null);
  }
}

class FormGroup extends StatelessWidget {
  final List<Widget> children;
  final String? label;
  const FormGroup({super.key, this.children = const [], this.label});

  @override
  Widget build(BuildContext context) {
    Color borderColor =
        context.isDarkMode ? Colors.black26.themeify : Colors.black45;

    bool hasInvalidChild() {
      final allowedTypes = [Input, Number, Select];
      return children.any((child) => !allowedTypes.contains(child.runtimeType));
    }

    List<Widget> modifiedChildren(List<Widget> children, bool invalid) {
      if (hasInvalidChild()) {
        return children;
      }

      return [
        for (int i = 0; i < children.length; i++) ...[
          children[i],
          if (i % 1 == 0 && i != children.length - 1)
            Container(
              width: context.width,
              height: .3,
              color: invalid ? Colors.red : borderColor,
            )
        ]
      ];
    }

    final notifier = FormGroupNotifier(children);
    final types = [Input, Number, Select];

    children.generate((child, i) {
      if (types.any((type) => child.runtimeType == type)) {
        (child as dynamic).model?.notifier.groupNotifier = notifier;
      }
    });

    return notifier.watch((state) => Column(
          spacing: 10,
          children: [
            if (label != null) Text(label!, style: Gfont.fs14),
            Container(
              decoration: BoxDecoration(
                  border: hasInvalidChild()
                      ? null
                      : Br.all(color: state.invalid ? Colors.red : borderColor),
                  borderRadius: Br.radius(config.borderRadius)),
              child: Column(
                children: modifiedChildren(children, state.invalid),
              ).lz.clip(all: config.borderRadius),
            ),

            // error message
            AccordionAnimated(
                show: state.invalid,
                child: Text(state.message, style: Gfont.fs14.red))
          ],
        ).start);
  }
}
