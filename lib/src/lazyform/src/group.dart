import 'package:flutter/material.dart' hide Radio, Checkbox;
import 'package:lazyui/lazyui.dart';

import 'checkbox.dart';
import 'input.dart';
import 'radio.dart';
import 'select.dart';
import 'switches.dart';

class LzFormGroup extends StatelessWidget {
  final String? label;
  final IconData? prefixIcon;
  final List<Widget> children;
  const LzFormGroup({super.key, this.label, this.prefixIcon, this.children = const []});

  @override
  Widget build(BuildContext context) {
    List allowed = [Input, Select, Radio, Checkbox, Switches];

    // remove all children that not allowed
    List<Widget> children = [...this.children];
    children.removeWhere((e) => !allowed.contains(e.runtimeType));

    // put warning if there is not allowed widget
    if (this.children.any((e) => !allowed.contains(e.runtimeType))) {
      children.add(const None());
    }

    // count not allowed widget
    int count = this.children.where((e) => !allowed.contains(e.runtimeType)).length;

    // get text style
    TextStyle? style = Theme.of(context).textTheme.bodyMedium;

    return Col(
      children: [
        if (label.isNotNull)
          Textr(
            label!,
            style: style?.copyWith(fontWeight: Fw.bold),
            icon: prefixIcon,
            margin: Ei.only(b: 8),
          ),
        Container(
          margin: Ei.only(b: 20),
          decoration: BoxDecoration(border: Br.all(), color: Colors.white, borderRadius: Br.radius(5)),
          child: ClipRRect(
            borderRadius: Br.radius(5),
            child: Col(
              children: List.generate(children.length, (i) {
                Widget child = children[i];

                if (allowed.contains(child.runtimeType)) {
                  return child;
                }

                return Textr(
                  'Found $count not allowed widget(s)',
                  style: style?.copyWith(fontSize: 14, color: Colors.redAccent),
                  border: Br.all(color: Colors.redAccent),
                  padding: Ei.sym(v: 10, h: 15),
                  margin: Ei.sym(h: 15, v: 15),
                  radius: Br.radius(5),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
