part of widget;

/// LzTextField is a customizable Flutter widget that simplifies the creation of text input fields with various features such as keyboard type, input actions, character limits, and more.
///
/// ```dart
/// LzTextField(
///   hint: 'Enter your text...',
///   onSubmit: (text) {
///     // Callback when the user submits the text.
///   }
/// )
/// ```

class LzTextField extends StatelessWidget {
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
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle, hintStyle;
  final TextSelectionControls? selectionControls;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;

  const LzTextField(
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
      this.padding,
      this.maxLines,
      this.textStyle,
      this.hintStyle,
      this.selectionControls,
      this.prefixIcon,
      this.prefixIconColor,
      this.border,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = LazyUi.radius;

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
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor ?? Colors.black38,
        isDense: true,
        contentPadding: padding ?? Ei.sym(v: 13.5, h: 20),
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

    return border == null
        ? textField
        : Container(
            decoration: BoxDecoration(
                border: border,
                borderRadius: borderRadius ?? BorderRadius.circular(radius)),
            child: textField,
          );
  }
}
