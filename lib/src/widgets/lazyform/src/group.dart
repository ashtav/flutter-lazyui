import 'package:flutter/material.dart' hide Checkbox, Radio;
import 'package:lazyui/lazyui.dart' hide Input, Number, Select, Checkbox, Radio;

import '../common/mixin.dart';
import 'checkbox.dart';
import 'input.dart';
import 'number.dart';
import 'radio.dart';
import 'select.dart';
import 'slider.dart';
import 'switches.dart';

/// A [LzFormGroup] widget to display form sections.
///
/// A form group widget that extends [StatelessWidget] and
/// mixes in [FormWidgetMixin]. This widget can be used to display
/// a label, optional sublabel, prefix icon and a list of child widgets
/// that represent the form fields.

class LzFormGroup extends StatelessWidget with FormWidgetMixin {
  /// The label that describes the form section.
  ///
  /// If set, this label will appear above the form fields.
  final String? label;

  /// The sublabel that provides additional information.
  ///
  /// This text will appear below the [label] and above the form fields,
  /// offering additional context or instructions.
  final String? sublabel;

  /// The icon to be displayed next to the [label].
  ///
  /// If set, this icon will appear at the beginning of the label.
  final IconData? prefixIcon;

  /// A list of child widgets to display within the form section.
  ///
  /// These widgets commonly include form fields, buttons, etc.
  final List<Widget> children;

  /// The space that separates the last child from the bottom of the form section.
  ///
  /// If set, this space is added below the last child.
  final double? bottomSpace;

  /// The style to apply to the [label].
  ///
  /// If set, this text style will be applied to the label.
  final TextStyle? labelStyle;

  /// The style to apply to the [sublabel].
  ///
  /// Default is [SublabelStyle.text].
  final SublabelStyle sublabelStyle;

  /// Determines the type of form.
  ///
  /// If set, this will determine how the form behaves.
  /// Only works if the type is 'grouped'.
  final FormType? type;

  /// Determines whether the [label] should be kept or not.
  ///
  /// Defaults to `false`. Only works if [type] is 'grouped'.
  final bool keepLabel;

  /// Creates a [LzFormGroup] widget.
  ///
  /// The [children] parameter defaults to an empty list.
  /// The [sublabelStyle] parameter defaults to [SublabelStyle.text].
  /// The [keepLabel] parameter defaults to `false`.

  const LzFormGroup(
      {super.key,
      this.label,
      this.sublabel,
      this.prefixIcon,
      this.children = const [],
      this.bottomSpace,
      this.labelStyle,
      this.sublabelStyle = SublabelStyle.text,
      this.type,

      /// only work if type is grouped
      this.keepLabel = false});

  @override
  Widget build(BuildContext context) {
    final attr = getAttribute<Input>(context, (e) => false);

    final formListAncestor =
        context.findAncestorWidgetOfExactType<LzFormList>();

    Color borderColor =
        (formListAncestor?.style?.inputBorderColor ?? Colors.black12);

    // allowed widget
    List allowed = [
      Input,
      Select,
      Radio,
      Checkbox,
      Number,
      Switches,
      SliderWidget
    ];

    // remove all children that not allowed
    List<Widget> children = [...this.children];
    List<String> unallowed = this
        .children
        .where((e) => !allowed.contains(e.runtimeType))
        .map((e) => e.runtimeType.toString())
        .toList();
    children.removeWhere((e) => !allowed.contains(e.runtimeType));

    // put warning if there is not allowed widget
    if (this.children.any((e) => !allowed.contains(e.runtimeType))) {
      children.add(const None());
    }

    // count not allowed widget
    // int count =
    //     this.children.where((e) => !allowed.contains(e.runtimeType)).length;

    // get text style
    TextStyle? style = Theme.of(context).textTheme.bodyMedium;

    // sublabel style
    bool isCardWarning = sublabelStyle == SublabelStyle.cardWarning;
    Color sublabelBorderColor =
        isCardWarning ? Colors.orange.withOpacity(.5) : Colors.black12;
    Color sublabelColor =
        isCardWarning ? Colors.orange.withOpacity(.09) : Colors.white;
    Color sublabelTextColor = isCardWarning ? Colors.orange : Colors.black;

    bool isTypeUnderlined =
        formListAncestor?.style?.type == FormType.underlined ||
            type == FormType.underlined;

    double configRadius = LazyUi.radius;

    return Column(
      crossAxisAlignment: Caa.start,
      mainAxisSize: Mas.min,
      children: [
        // Label
        if (label != null)
          Textr(
            label!,
            style: labelStyle ?? style?.copyWith(fontSize: 14),
            icon: prefixIcon,
            margin: Ei.only(b: 8, l: 0, t: 10),
          ),

        // Sublabel
        if (sublabel != null)
          sublabelStyle == SublabelStyle.text
              ? Textr(
                  sublabel!,
                  style: style?.copyWith(fontSize: 14),
                  margin: Ei.only(b: 15, l: 0),
                )
              : Textr(
                  sublabel!,
                  style:
                      style?.copyWith(fontSize: 14, color: sublabelTextColor),
                  margin: Ei.only(b: 15, l: 0),
                  border: Br.all(color: sublabelBorderColor),
                  padding: Ei.sym(v: 13, h: 15),
                  radius: Br.radius(5),
                  color: sublabelColor,
                ),

        // Fields
        Container(
          margin: Ei.only(b: bottomSpace ?? 20),
          decoration: BoxDecoration(
              border: isTypeUnderlined
                  ? Br.only(['b'], color: borderColor)
                  : Br.all(color: borderColor),
              color: formListAncestor?.style?.backgroundColor ??
                  (isTypeUnderlined || attr.isTopInner
                      ? Colors.transparent
                      : Colors.white),
              borderRadius: isTypeUnderlined ? null : Br.radius(configRadius)),
          child: ClipRRect(
            borderRadius: Br.radius(isTypeUnderlined ? 0 : configRadius),
            child: Column(
              crossAxisAlignment: Caa.start,
              mainAxisSize: Mas.min,
              children: List.generate(children.length, (i) {
                Widget child = children[i];

                if (allowed.contains(child.runtimeType)) {
                  return child;
                }

                String unallowedWidget = unallowed.toSet().join(', ');

                return Textr(
                  '$unallowedWidget ${unallowed.length > 1 ? 'are' : 'is'} not allowed in LzFormGroup.',
                  style: style?.copyWith(fontSize: 14, color: Colors.redAccent),
                  // border: Br.all(color: Colors.redAccent),
                  // padding: Ei.sym(v: 10, h: 15),
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
