import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class Attribute {
  final bool isGrouping,
      isTypeGrouped,
      isTypeTopAligned,
      isTypeUnderlined,
      isFirst;
  final LzFormGroup? formGroupAncestor;
  final LzFormList? formListAncestor;
  final FormType type;

  const Attribute({
    this.isGrouping = false,
    this.isTypeGrouped = true,
    this.isTypeTopAligned = false,
    this.isTypeUnderlined = false,
    this.isFirst = false,
    this.formGroupAncestor,
    this.formListAncestor,
    this.type = FormType.grouped,
  });
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
      isTypeTopAligned: isTypeTopAligned,
      isTypeUnderlined: isTypeUnderlined,
      formGroupAncestor: formGroupAncestor,
      formListAncestor: formListAncestor,
      isFirst: isFirst,
      type: type,
    );
  }
}
