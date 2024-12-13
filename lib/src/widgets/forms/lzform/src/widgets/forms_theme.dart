import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

/// Wrapper widget for encapsulating a form and managing its styling and behavior.
class LzFormWrap extends StatelessWidget {
  /// The label widget displayed above the form.
  final Widget? label;

  /// The description text displayed below the label.
  final String? description;

  /// The list of form field widgets.
  final List<Widget> children;

  /// The type of form layout.
  final FormType? type;

  /// The style applied to the form.
  final FormStyle? style;

  /// Determines if the form fields should be grouped together.
  final bool grouping;

  /// The spacing between form fields.
  final double? spacing;

  /// Constructs a LzFormWrap widget.
  const LzFormWrap(
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
    final font = Gfont.style(context);

    // get radius
    double radius = style?.radius ?? LazyUi.radius;

    // get border color
    Color borderColor = style?.borderColor ?? Colors.black12;

    Widget childrenWidget = Container(
      decoration: grouping
          ? BoxDecoration(
              border: Br.all(color: borderColor),
              borderRadius: Br.radius(radius))
          : null,
      child: Column(
        children: [
          ...children.generate((widget, i) {
            return grouping
                ? widget.lz
                    .border(Br.only(['t'], except: i == 0, color: borderColor))
                : widget;
          })
        ],
      ).lz.clip(all: radius),
    );

    return (label == null && description == null
            ? childrenWidget
            : Column(
                children: [
                  if (label != null)
                    label!.margin(b: description == null ? 8 : 0),
                  if (description != null)
                    Textml(description!, style: font.fsize(14).muted)
                        .margin(b: 15, t: 5),
                  childrenWidget,
                ],
              ).start)
        .margin(b: spacing ?? 0);
  }
}
