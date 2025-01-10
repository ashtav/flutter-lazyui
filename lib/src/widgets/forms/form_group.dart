// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/config.dart';

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
  const FormGroup({super.key, this.children = const []});

  @override
  Widget build(BuildContext context) {
    final notifier = FormGroupNotifier();
    Color borderColor = context.isDarkMode ? Colors.black26.themeify : Colors.black45;

    List<Widget> modifiedChildren(List<Widget> children, bool invalid) {
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

    children.generate((child, i) {
      if (child is Input) {
        child.model?.notifier.groupNotifier = notifier;
      }
    });

    return notifier.watch((state) => Column(
          spacing: 7,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Br.all(color: state.invalid ? Colors.red : borderColor),
                  borderRadius: Br.radius(config.borderRadius)),
              child: Column(
                children: modifiedChildren(children, state.invalid),
              ).lz.clip(all: config.borderRadius),
            ),

            // error message
            SlideAnimate(show: state.invalid, child: Text(state.invalidMessage, style: Gfont.fs14.red))
          ],
        ).start);
  }
}
