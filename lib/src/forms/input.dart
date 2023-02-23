import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lazyui/lazyui.dart';

/* --------------------------------------------------------------------------
| TextInput
| -------------------------------------------------------- */

class Input extends StatelessWidget {
  final String label;
  final IconData? icon;
  final String? hint;
  final bool obsecure, obsecureToggle, autofocus, enabled, indicator;
  final Widget? suffixIcon;
  final TextInputType? keyboard;
  final int maxLength;
  final int? maxLines;
  final FocusNode? node;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final Function(String)? onSubmit, onChanged;
  final Function(bool)? onFocus;
  final TextEditingController? controller;
  final List<TextInputFormatter> formatters;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Function(TextEditingController?)? onTap;

  const Input(
      {Key? key,
      required this.label,
      this.icon,
      this.hint,
      this.obsecure = false,
      this.obsecureToggle = false,
      this.autofocus = false,
      this.suffixIcon,
      this.keyboard,
      this.maxLength = 50,
      this.maxLines,
      this.node,
      this.enabled = true,
      this.indicator = false,
      this.borderRadius,
      this.border,
      this.margin,
      this.onSubmit,
      this.onChanged,
      this.onFocus,
      this.controller,
      this.backgroundColor,
      this.textStyle,
      this.formatters = const [],
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      onFocus?.call(node?.hasFocus ?? false);
    });

    List<TextInputFormatter> formatters = [LengthLimitingTextInputFormatter(maxLength), ...this.formatters];

    if (keyboard == Tit.number) {
      formatters.add(InputFormat.numeric);
    }

    double configRadius = LazyConfig.getConfig.radius;

    return Container(
        margin: margin ?? Ei.only(b: 15),
        child: ClipRRect(
          borderRadius: borderRadius ?? Br.radius(configRadius),
          child: InkW(
            onTap: onTap == null ? null : () => onTap?.call(controller),
            padding: Ei.only(l: 15, r: obsecureToggle ? 0 : 15, t: 15, b: 10),
            border: border ?? Border.all(color: Colors.black12, width: .7),
            color: Colors.white,
            radius: borderRadius ?? Br.radius(configRadius),
            child: Col(children: [
              Container(
                margin: Ei.only(b: 2, l: 0),
                child: Row(
                  mainAxisAlignment: Maa.spaceBetween,
                  children: [
                    Text(label, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14)),
                    indicator ? TextInputBadgeLabel(controller: controller, maxLength: maxLength) : const None(),
                  ],
                ),
              ),
              InputField(
                label: label,
                icon: icon,
                hint: hint,
                obsecure: obsecure,
                obsecureToggle: obsecureToggle,
                autofocus: autofocus,
                suffixIcon: suffixIcon,
                keyboard: keyboard,
                maxLength: maxLength,
                maxLines: maxLines,
                node: node,
                enabled: onTap == null ? enabled : false,
                indicator: indicator,
                borderRadius: borderRadius,
                border: border,
                margin: margin,
                onSubmit: onSubmit,
                onChanged: onChanged,
                onFocus: onFocus,
                controller: controller,
                backgroundColor: backgroundColor,
                textStyle: textStyle,
                formatters: formatters,
                onTap: onTap,
              )
            ]),
          ),
        ));
  }

  Input copyWith({EdgeInsetsGeometry? margin, BoxBorder? border, BorderRadius? borderRadius, TextEditingController? controller}) {
    return Input(
        label: label,
        icon: icon,
        hint: hint,
        obsecure: obsecure,
        obsecureToggle: obsecureToggle,
        autofocus: autofocus,
        suffixIcon: suffixIcon,
        keyboard: keyboard,
        maxLength: maxLength,
        maxLines: maxLines,
        node: node,
        enabled: enabled,
        indicator: indicator,
        borderRadius: borderRadius,
        border: border,
        margin: margin,
        onSubmit: onSubmit,
        onChanged: onChanged,
        onFocus: onFocus,
        controller: controller,
        backgroundColor: backgroundColor,
        textStyle: textStyle,
        formatters: formatters,
        onTap: onTap);
  }
}

class TextInputBadgeLabel extends StatefulWidget {
  final TextEditingController? controller;
  final int maxLength;
  const TextInputBadgeLabel({Key? key, this.controller, this.maxLength = 0}) : super(key: key);

  @override
  State<TextInputBadgeLabel> createState() => _TextInputBadgeLabelState();
}

class _TextInputBadgeLabelState extends State<TextInputBadgeLabel> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (mounted) {
        widget.controller?.addListener(() {
          if (mounted) setState(() {});
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int maxLength = widget.maxLength;
    int text = (widget.controller?.text ?? '').length;
    return Text('$text/$maxLength', style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14));
  }
}

class InputField extends StatefulWidget {
  final String label;
  final IconData? icon;
  final String? hint;
  final bool obsecure, obsecureToggle, autofocus, enabled, indicator;
  final Widget? suffixIcon;
  final TextInputType? keyboard;
  final int maxLength;
  final int? maxLines;
  final FocusNode? node;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final Function(String)? onSubmit, onChanged;
  final Function(bool)? onFocus;
  final TextEditingController? controller;
  final List<TextInputFormatter> formatters;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Function(TextEditingController?)? onTap;

  const InputField(
      {Key? key,
      required this.label,
      this.icon,
      this.hint,
      this.obsecure = false,
      this.obsecureToggle = false,
      this.autofocus = false,
      this.suffixIcon,
      this.keyboard,
      this.maxLength = 50,
      this.maxLines,
      this.node,
      this.enabled = true,
      this.indicator = false,
      this.borderRadius,
      this.border,
      this.margin,
      this.onSubmit,
      this.onChanged,
      this.onFocus,
      this.controller,
      this.backgroundColor,
      this.textStyle,
      this.formatters = const [],
      this.onTap})
      : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool obsecure = false;

  @override
  void initState() {
    super.initState();
    obsecure = widget.obsecureToggle ? true : widget.obsecure;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(
      children: [
        Expanded(
          child: Row(children: [
            if (widget.icon != null) Iconr(widget.icon!, color: Colors.white38, margin: Ei.only(r: 15, b: 15)),
            Expanded(
                child: Focus(
              onFocusChange: widget.onFocus,
              child: TextInputTransparent(
                hint: widget.hint,
                keyboard: widget.keyboard ?? Tit.text,
                maxLength: widget.maxLength,
                node: widget.node,
                enabled: widget.enabled,
                obsecure: obsecure,
                autofocus: widget.autofocus,
                onSubmit: widget.onSubmit,
                onChanged: widget.onChanged,
                controller: widget.controller,
                formatters: widget.formatters,
                maxLines: widget.maxLines,
                hintStyle: const TextStyle(color: Colors.black45),
                textStyle: widget.textStyle,
                contentPadding: Ei.sym(v: 5),
              ),
            )),
          ]),
        ),
        widget.obsecureToggle
            ? Touch(
                onTap: () {
                  setState(() {
                    obsecure = !obsecure;
                  });
                },
                child: Iconr(
                  obsecure ? La.eye : La.eyeSlash,
                  padding: Ei.sym(v: 5, h: 15),
                ),
              )
            : widget.onTap == null
                ? widget.suffixIcon ?? const None()
                : widget.suffixIcon ?? const Icon(La.angleDown),
      ],
    ));
  }
}
