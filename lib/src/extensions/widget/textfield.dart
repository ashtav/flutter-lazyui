part of '../extension.dart';

/// Extension method on [LzTextField] to create a bordered version of the text field.
extension LzTextFieldExtension on LzTextField {
  /// Creates a bordered version of the text field with the provided parameters.
  ///
  /// [color]: The color of the border.
  /// [backgroundColor]: The background color of the text field.
  ///
  /// Returns a [LzTextField] widget with borders and specified background color.
  LzTextField bordered({Color? color, Color? backgroundColor}) {
    return LzTextField(
      key: key,
      hint: hint,
      keyboard: keyboard,
      inputAction: inputAction,
      onSubmit: onSubmit,
      obsecure: obsecure,
      onChange: onChange,
      onFocus: onFocus,
      autofocus: autofocus,
      showMaxLength: showMaxLength,
      node: node,
      controller: controller,
      textAlign: textAlign,
      enabled: enabled,
      maxLength: maxLength,
      formatters: formatters,
      padding: padding,
      maxLines: maxLines,
      textStyle: textStyle,
      hintStyle: hintStyle,
      selectionControls: selectionControls,
      prefixIcon: prefixIcon,
      prefixIconColor: prefixIconColor,
      suffixIcon: suffixIcon,
      suffixIconColor: suffixIconColor,
      backgroundColor: backgroundColor ?? Colors.white,
      border: Br.all(color: color),
      borderRadius: borderRadius,
      listenKeyboard: listenKeyboard,
    );
  }
}
