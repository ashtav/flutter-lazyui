part of '../../widget.dart';

/// Returns a default [OutlineInputBorder] for text fields, styled based on the current theme
/// and whether the field is enabled or disabled.
///
/// - Automatically adapts the border color depending on the app’s dark or light mode.
/// - Slightly lightens or darkens the color when the field is disabled to give a visual cue.
/// - Uses a thin border width of `0.5` for a subtle look.
/// - Allows customizing the [borderRadius] via [radius], otherwise uses a default global radius.
OutlineInputBorder textFieldDefaultBorder(BuildContext context, bool enabled,
        {BorderRadius? radius}) =>
    OutlineInputBorder(
        borderRadius: radius ?? Br.radius(config.borderRadius),
        borderSide: BorderSide(
            color: context.isDarkMode
                ? Colors.black26.themeify.darken(enabled ? 0 : .7)
                : Colors.black45.lighten(enabled ? 0 : .7),
            width: .5));

/// A customizable text field widget.
///
/// Example usage:
/// ```dart
/// LzTextField(hint: 'Enter your text here', border: Ltf.border());
/// ```
class LzTextField extends StatelessWidget {
  /// Placeholder text to display when the field is empty.
  final String? hint;

  /// The type of keyboard to display for text input.
  final TextInputType? keyboard;

  /// The action that should be performed when the user submits the text input.
  final TextInputAction? inputAction;

  /// Callback function triggered when the user submits the text input.
  final void Function(String)? onSubmit;

  /// Callback function triggered when the text input changes.
  final void Function(String)? onChange;

  /// Callback function triggered when the text field gains or loses focus.
  final void Function(bool value)? onFocus;

  /// Whether the text field should have autofocus when rendered.
  final bool autofocus;

  /// Whether the text field is enabled for user interaction.
  final bool enabled;

  /// Whether the text field is read-only.
  final bool readOnly;

  /// Whether the text input should be obscured (e.g., for passwords).
  final bool obscure;

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

  /// Widget to display at the end (suffix) of the input field.
  ///
  /// You can use either [Suffix] or [SuffixBuilder] here depending on your needs:
  ///
  /// - Use [Suffix] for a static widget like an icon or button.
  /// - Use [SuffixBuilder] if you need the widget to react to the text input (e.g., show "clear" or "submit" based on input value).
  final Widget? suffixIcon;

  /// The color of the prefix icon.
  final Color? prefixIconColor;

  /// The color of the suffix icon.
  final Color? suffixIconColor;

  /// The background color of the input field.
  final Color? backgroundColor;

  /// The border of the input field.
  final InputBorder? border;

  /// The border radius of the input field.
  final BorderRadius? borderRadius;

  /// The cursor color of the input field
  final Color? cursorColor;

  /// Example usage:
  /// ```dart
  /// LzTextField(hint: 'Enter your text here', border: Ltf.border());
  /// ```
  const LzTextField(
      {super.key,
      this.hint,
      this.keyboard,
      this.inputAction,
      this.onSubmit,
      this.obscure = false,
      this.onChange,
      this.onFocus,
      this.autofocus = false,
      this.showMaxLength = false,
      this.node,
      this.controller,
      this.textAlign,
      this.enabled = true,
      this.readOnly = false,
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
      this.cursorColor});

  @override
  Widget build(BuildContext context) {
    final border = this.border ??
        textFieldDefaultBorder(context, enabled, radius: borderRadius);

    return Focus(
      onFocusChange: onFocus,
      child: TextField(
        style: textStyle ?? config.font,
        keyboardType: keyboard,
        textInputAction: inputAction,
        onSubmitted: onSubmit,
        onChanged: onChange,
        autofocus: autofocus,
        focusNode: node,
        obscureText: obscure,
        enabled: enabled && !readOnly,
        textAlign: textAlign ?? TextAlign.start,
        controller: controller,
        maxLines: maxLines ?? 1,
        minLines: 1,
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxLength < 1 ? 1 : maxLength),
          ...formatters
        ],
        selectionControls: selectionControls,
        cursorColor: cursorColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: backgroundColor ?? Colors.transparent,
          prefixIcon: prefixIcon,
          prefixIconColor: prefixIconColor ?? Colors.black38.themeify,
          suffixIcon: suffixIcon,
          suffixIconColor: suffixIconColor ?? Colors.black38.themeify,
          isDense: true,
          contentPadding: padding ?? Ei.sym(v: 13.5, h: 20),
          hintText: hint,
          hintStyle:
              hintStyle ?? config.font.copyWith(color: Colors.black38.themeify),
          border: border,
          focusedBorder: border,
          enabledBorder: border,
          errorBorder: InputBorder.none,
          disabledBorder: border,
        ),
      ),
    );
  }
}

/// A utility class for building commonly used [InputBorder] styles
/// in text fields and form inputs.
class Ltf {
  /// Returns a custom [OutlineInputBorder] with optional [color], [width], and [style].
  ///
  /// If no [color] is provided, defaults to [Colors.black12].
  /// If no [width] is provided, defaults to `0.5`.
  ///
  /// Example usage:
  /// ```dart
  /// TextField(
  ///   decoration: InputDecoration(
  ///     border: Ltf.border(color: Colors.blue, width: 1),
  ///   ),
  /// )
  /// ```
  static OutlineInputBorder border({
    Color? color,
    double? width,
    BorderStyle style = BorderStyle.solid,
  }) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color ?? Colors.black12,
        width: width ?? 0.5,
        style: style,
      ),
    );
  }

  /// Returns [InputBorder.none] to indicate no visible border.
  ///
  /// Example usage:
  /// ```dart
  /// TextField(
  ///   decoration: InputDecoration(
  ///     border: Ltf.none,
  ///   ),
  /// )
  /// ```
  static InputBorder get none => InputBorder.none;
}

/// A widget that rebuilds its child whenever the [TextEditingController]'s value changes.
///
/// Useful for building a dynamic suffix icon or action in a [TextField]
/// that responds in real-time to input text changes.
///
/// Example usage:
/// ```dart
/// TextField(
///   controller: myController,
///   suffixIcon: SuffixBuilder(
///     controller: myController,
///     builder: (text) {
///       return text.isEmpty ? Icon(Icons.clear) : Text('Submit');
///     },
///   ),
/// )
/// ```
class SuffixBuilder extends StatefulWidget {
  /// The [TextEditingController] to observe.
  final TextEditingController controller;

  /// The builder function that returns a widget based on the current text.
  final Widget Function(String value)? builder;

  const SuffixBuilder({
    super.key,
    required this.controller,
    this.builder,
  });

  @override
  State<SuffixBuilder> createState() => _SuffixBuilderState();
}

class _SuffixBuilderState extends State<SuffixBuilder> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _controller.addListener(_onTextChanged);
  }

  @override
  void didUpdateWidget(covariant SuffixBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_onTextChanged);
      _controller = widget.controller;
      _controller.addListener(_onTextChanged);
    }
  }

  void _onTextChanged() => setState(() {});

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder?.call(_controller.text) ?? const None();
  }
}
