import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shortcut.dart';

class TextInputTransparent extends StatelessWidget {
  final String? hint;
  final TextInputType? keyboard;
  final TextInputAction? inputAction;
  final Function(String)? onSubmit, onChange;
  final bool autofocus, enabled, obsecure, showMaxLength;
  final FocusNode? node;
  final TextEditingController? controller;
  final TextAlign? textAlign;
  final int maxLength;
  final int? maxLines;
  final List<TextInputFormatter> formatters;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? textStyle, hintStyle;
  final TextSelectionControls? selectionControls;

  const TextInputTransparent(
      {Key? key,
      this.hint,
      this.keyboard,
      this.inputAction,
      this.onSubmit,
      this.obsecure = false,
      this.onChange,
      this.autofocus = false,
      this.showMaxLength = false,
      this.node,
      this.controller,
      this.textAlign,
      this.enabled = true,
      this.maxLength = 255,
      this.formatters = const [],
      this.contentPadding,
      this.maxLines,
      this.textStyle,
      this.hintStyle,
      this.selectionControls})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextField textField = TextField(
      style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
      keyboardType: keyboard,
      textInputAction: inputAction,
      onSubmitted: onSubmit,
      onChanged: onChange,
      autofocus: autofocus,
      focusNode: node,
      obscureText: obsecure,
      enabled: enabled,
      textAlign: textAlign ?? TextAlign.start,
      controller: controller,
      maxLines: maxLines ?? 1,
      minLines: 1,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength < 1 ? 1 : maxLength),
        ...formatters
      ],
      selectionControls: selectionControls,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ?? Ei.sym(v: 13.5),
        hintText: hint,
        hintStyle: hintStyle ??
            Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.black38),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );

    return textField;
  }
}
