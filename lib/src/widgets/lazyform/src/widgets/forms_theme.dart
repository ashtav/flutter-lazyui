import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class LzFormTheme extends StatelessWidget {
  final Widget? label;
  final String? description;
  final List<Widget> children;
  final FormType? type;
  final FormStyle? style;
  final bool grouping;
  final double? spacing;
  const LzFormTheme(
      {super.key,
      this.label,
      this.description,
      this.children = const [],
      this.type,
      this.style,
      this.grouping = false,
      this.spacing});

  @override
  Widget build(BuildContext context) {
    // get radius
    double radius = style?.radius ?? LazyUi.radius;

    // get border color
    Color borderColor = style?.borderColor ?? Colors.black12;

    Widget childrenWidget = Container(
      decoration: grouping ? BoxDecoration(border: Br.all(color: borderColor), borderRadius: Br.radius(radius)) : null,
      child: Column(
        children: [
          ...children.generate((widget, i) {
            return grouping ? widget.lz.border(Br.only(['t'], except: i == 0, color: borderColor)) : widget;
          })
        ],
      ).lz.clip(all: radius),
    );

    return (label == null && description == null
            ? childrenWidget
            : Column(
                children: [
                  if (label != null) label!.margin(b: description == null ? 8 : 0),
                  if (description != null) Textml(description!, style: Gfont.fs14).margin(b: 15, t: 5),
                  childrenWidget,
                ],
              ).start)
        .margin(b: spacing ?? 16);
  }
}
