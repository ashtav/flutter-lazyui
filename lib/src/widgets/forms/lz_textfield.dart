part of '../widget.dart';

/// A customizable text field widget.
class LzTextField extends StatelessWidget {
  /// Placeholder text to display when the field is empty.
  final String? hint;

  /// The type of keyboard to display for text input.
  final TextInputType? keyboard;

  /// The action that should be performed when the user submits the text input.
  final TextInputAction? inputAction;

  /// Callback function triggered when the user submits the text input.
  final Function(String)? onSubmit;

  /// Callback function triggered when the text input changes.
  final Function(String)? onChange;

  /// Callback function triggered when the text field gains or loses focus.
  final Function(bool value)? onFocus;

  /// Whether the text field should have autofocus when rendered.
  final bool autofocus;

  /// Whether the text field is enabled for user interaction.
  final bool enabled;

  /// Whether the text input should be obscured (e.g., for passwords).
  final bool obsecure;

  /// Whether to show the maximum length indicator for the text input.
  final bool showMaxLength;

  /// The focus node that should be used to manage focus for this text field.
  final FocusNode? node;

  /// The controller that manages the text being edited.
  final TextEditingController? controller;

  /// The horizontal alignment of the text within the input field.
  final TextAlign? textAlign;

  /// The maximum number of characters allowed in the input field.
  final int maxLength;

  /// The maximum number of lines to allow for text input.
  final int? maxLines;

  /// List of input formatters that modify the input text.
  final List<TextInputFormatter> formatters;

  /// The padding around the input field.
  final EdgeInsetsGeometry? padding;

  /// The style of the text being entered.
  final TextStyle? textStyle;

  /// The style of the placeholder text.
  final TextStyle? hintStyle;

  /// The custom text selection controls to use for this input field.
  final TextSelectionControls? selectionControls;

  /// Widget to display as a prefix to the input field.
  final Widget? prefixIcon;

  /// Widget to display as a suffix to the input field.
  final Widget? suffixIcon;

  /// The color of the prefix icon.
  final Color? prefixIconColor;

  /// The color of the suffix icon.
  final Color? suffixIconColor;

  /// The background color of the input field.
  final Color? backgroundColor;

  /// The border of the input field.
  final BoxBorder? border;

  /// The border radius of the input field.
  final BorderRadiusGeometry? borderRadius;

  /// Callback function triggered when the keyboard visibility changes.
  final Function(bool value)? listenKeyboard;

  /// Create widget
  const LzTextField(
      {super.key,
      this.hint,
      this.keyboard,
      this.inputAction,
      this.onSubmit,
      this.obsecure = false,
      this.onChange,
      this.onFocus,
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
      this.suffixIcon,
      this.suffixIconColor,
      this.backgroundColor,
      this.border,
      this.borderRadius,
      this.listenKeyboard});

  @override
  Widget build(BuildContext context) {
    double radius = LazyUi.radius;
    FocusNode localNode = node ?? FocusNode();

    if (onFocus != null) {
      localNode.addListener(() {
        onFocus?.call(localNode.hasFocus);
      });
    }

    if (listenKeyboard != null) {
      listenKeyboard!(MediaQuery.of(context).viewInsets.bottom > 0);
    }

    TextField textField = TextField(
      style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
      keyboardType: keyboard,
      textInputAction: inputAction,
      onSubmitted: onSubmit,
      onChanged: onChange,
      autofocus: autofocus,
      focusNode: localNode,
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
        prefixIconColor: prefixIconColor ?? Colors.black38.adaptWithTheme,
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor ?? Colors.black38.adaptWithTheme,
        isDense: true,
        contentPadding: padding ?? Ei.sym(v: 13.5, h: 20),
        hintText: hint,
        hintStyle: hintStyle ??
            Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.black38.adaptWithTheme),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );

    bool isBorderSide = !border.toString().contains('Border.all');

    return border == null && backgroundColor == null
        ? textField
        : Container(
            decoration: BoxDecoration(
                border: border,
                color: backgroundColor,
                borderRadius: isBorderSide
                    ? null
                    : borderRadius ?? BorderRadius.circular(radius)),
            child: textField,
          );
  }
}
