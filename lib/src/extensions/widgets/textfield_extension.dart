part of extension;

extension LzTextFieldExtension on LzTextField {
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
