import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class Attribute {
  final bool isGrouping,
      isTypeGrouped,
      isTypeTopAligned,
      isTopInner,
      isTypeUnderlined,
      isFirst,
      keepLabelOnGrouped;
  final LzFormGroup? formGroupAncestor;
  final LzFormList? formListAncestor;
  final FormType type;

  const Attribute(
      {this.isGrouping = false,
      this.isTypeGrouped = true,
      this.isTypeTopAligned = false,
      this.isTypeUnderlined = false,
      this.isTopInner = false,
      this.isFirst = false,
      this.formGroupAncestor,
      this.formListAncestor,
      this.type = FormType.grouped,
      this.keepLabelOnGrouped = false});
}

mixin FormWidgetMixin {
  Attribute getAttribute<T>(BuildContext context, bool Function(T) check) {
    // get ancestor widget name
    final formGroupAncestor =
        context.findAncestorWidgetOfExactType<LzFormGroup>();
    final formListAncestor =
        context.findAncestorWidgetOfExactType<LzFormList>();

    // check if input is grouping
    bool isGrouping = formGroupAncestor.runtimeType == LzFormGroup;

    // get form type
    FormType type = formGroupAncestor?.type ??
        formListAncestor?.style?.type ??
        FormType.grouped;

    bool isTypeUnderlined = type == FormType.underlined;
    bool isTypeTopAligned = type == FormType.topAligned;
    bool isTypeGrouped = type == FormType.grouped;
    bool isTopInner = type == FormType.topInner;

    // check first children of formGroupAncestor
    bool isFirst = false;

    // get first children of formGroupAncestor
    if (isGrouping && (formGroupAncestor?.children ?? []).isNotEmpty) {
      if (formGroupAncestor!.children[0] is T) {
        final firstChild = formGroupAncestor.children[0] as T;
        isFirst = check(firstChild);
      }
    }

    return Attribute(
        isGrouping: isGrouping,
        isTypeGrouped: isTypeGrouped,
        isTopInner: isTopInner,
        isTypeTopAligned: isTypeTopAligned,
        isTypeUnderlined: isTypeUnderlined,
        formGroupAncestor: formGroupAncestor,
        formListAncestor: formListAncestor,
        isFirst: isFirst,
        type: type,
        keepLabelOnGrouped: formGroupAncestor?.keepLabel ?? false);
  }
}
