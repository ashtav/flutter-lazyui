// ignore_for_file: invalid_use_of_protected_member

part of '../forms.dart';

/// A text input widget for capturing user input.
class Input extends StatelessWidget with LzFormMixin {
  /// The label displayed above the input field.
  final String? label;

  /// The hint text displayed inside the input field.
  final String? hint;

  /// The form type configuration.
  final FormType? type;

  /// The style configuration for the input field.
  final InputStyle? style;

  /// Whether to show an input indicator.
  final bool indicator;

  /// Whether the input text is obscured.
  final bool obsecure;

  /// Whether to show a toggle button for obscuring text.
  final bool obsecureToggle;

  /// Whether the input field is disabled.
  final bool disabled;

  /// Whether the input field should have autofocus.
  final bool autofocus;

  /// The type of keyboard to display.
  final TextInputType? keyboard;

  /// List of input formatters to modify input text.
  final List<TextInputFormatter> formatters;

  /// Callback function invoked when the input is tapped.
  final Function(String text)? onTap;

  /// Callback function invoked when the input text changes.
  final Function(String value)? onChange;

  /// Callback function invoked when the input is submitted.
  final Function(String value)? onSubmit;

  /// The form model associated with the input field.
  final FormModel? model;

  /// The focus node that controls the focus state of the input field.
  final FocusNode? node;

  /// The maximum length of input allowed.
  final int maxLength;

  /// The maximum number of lines for multiline input.
  final int? maxLines;

  /// Create widget
  const Input(
      {super.key,
      this.label,
      this.hint,
      this.type,
      this.style,
      this.indicator = false,
      this.obsecure = false,
      this.obsecureToggle = false,
      this.disabled = false,
      this.autofocus = false,
      this.keyboard,
      this.formatters = const [],
      this.onTap,
      this.onChange,
      this.onSubmit,
      this.model,
      this.node,
      this.maxLength = 255,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    final font = Gfont.style(context);

    final attr = getAttribute(context);
    InputStyle? style = attr.inputStyle ?? this.style;

    // form notifier
    final notifier = model?.notifier ?? FormNotifier();
    notifier.controller = model?.controller ?? TextEditingController();
    notifier.label = label ?? hint;

    FocusNode focusNode = node ?? notifier.node;
    List<TextInputFormatter> formatters = [
      LengthLimitingTextInputFormatter(maxLength < 1 ? 1 : maxLength),
      ...this.formatters
    ];

    // set enabled or disabled
    if (!notifier.hasInit) {
      notifier.disabled = disabled;
      notifier.hasInit = true;
    }

    notifier.setMaxLength(maxLength);

    // set obsecure
    if (onTap == null) {
      notifier.setObsecure(obsecureToggle ? true : obsecure);
    }

    // set formatters, if keyboard is number add numeric formatter
    if (keyboard == Tit.number) {
      formatters.add(Formatter.numeric);
    }

    Bindings.onRendered(() {
      // listen to controller
      if (indicator) {
        notifier.controller.addListener(() {
          String text = notifier.controller.text;
          notifier.setLength(text.length);

          // hide error message when user typing
          if (!notifier.isValid && text.trim().isNotEmpty) {
            notifier.setMessage('', true);
          }
        });
      }
    });

    // get form type
    FormType formType = attr.type ?? (type ?? FormType.topAligned);
    bool isGrouped = formType == FormType.grouped;
    bool isTopAligned = formType == FormType.topAligned;
    bool isUnderlined = formType == FormType.underlined;
    bool isTopInner = formType == FormType.topInner;

    // get icon (tabler or line awesome)
    bool isTabler = LazyUi.iconType == IconType.tabler;
    bool isHugeIcon = LazyUi.iconType == IconType.huge;

    // get radius
    double radius = style?.radius ?? LazyUi.radius;

    // get border color
    Color borderColor = style?.borderColor ?? Colors.black12.adaptWithTheme;

    // get text color
    Color textColor = style?.textColor ?? Colors.black87.adaptWithTheme;

    // check if label is available
    bool hasLabel = label != null && !attr.isGrouped;
    bool hasOnTap = onTap != null;
    bool hasPrefix = style?.prefix != null;

    // create label widget
    Widget labelWidget = hasLabel
        ? Text(label!, style: font.fs14.fcolor(textColor))
        : const None();

    // create indicator widget
    Widget indicatorWidget = indicator && !attr.isGrouped
        ? notifier.watch((state) => Text('${state.textLength}/$maxLength',
            style: font.fs14.fcolor(textColor)))
        : const None();

    // create grouped label widget
    Widget groupedLabelWidget = Positioned(
        top: 12,
        child: Container(
          padding: Ei.sym(h: 16),
          width: context.width,
          child: Row(
            children: [
              labelWidget,
              if (indicator) indicatorWidget.margin(r: 39),
            ],
          ).between,
        ));

    // create top inner label widget
    Widget topInnerLabelWidget = Positioned(
        left: 12,
        top: 0,
        child: Stack(
          children: [
            getTopInnerLineLabel(color: 'fafafa'.hex),
            labelWidget.padding(h: 5),
          ],
        ));

    // create top inner indicator
    Widget topInnerIndicatorWidget = Positioned(
        right: 12,
        top: 0,
        child: Stack(
          children: [
            getTopInnerLineLabel(color: 'fafafa'.hex),
            indicatorWidget.padding(h: 5),
          ],
        ));

    // create has label and grouped padding
    final labelAndGroupedPadding = Ei.only(h: 16, t: 35, b: 12);

    // create prefix & suffix icon widget
    Widget? prefixIconWidget =
        hasOnTap || style?.prefixIcon == null && style?.prefix == null
            ? null
            : hasPrefix
                ? Center(widthFactor: 1, child: style?.prefix).padding(h: 16)
                : Icon(style?.prefixIcon, color: style?.prefixIconColor);
    Widget? suffixIconWidget =
        hasOnTap || style?.suffixIcon == null && style?.suffix == null
            ? null
            : style?.suffix ??
                Icon(style?.suffixIcon, color: style?.suffixIconColor);

    // ink touch & input field
    Widget textFieldWidget = notifier.watch((state) {
      // get background color
      Color backgroundColor = notifier.disabled
          ? const Color.fromARGB(31, 204, 204, 204)
          : style?.background ??
              (isUnderlined || isTopInner
                  ? Colors.transparent
                  : lzBackgroundColor);

      return InkTouch(
        onTap: state.disabled || !hasOnTap
            ? null
            : () {
                onTap?.call(notifier.controller.text);
                FocusScope.of(context).requestFocus(FocusNode());
              },
        border: attr.isGrouped
            ? null
            : isUnderlined
                ? Br.only(['b'], color: borderColor)
                : Br.all(color: borderColor),
        radius: isUnderlined ? null : Br.radius(attr.isGrouped ? 0 : radius),
        color: backgroundColor,
        child: Stack(
          children: [
            // if grouped, add label and indicator
            if (isGrouped || isUnderlined) groupedLabelWidget,

            // input field
            LzTextField(
              hint: hint,
              enabled: !state.disabled && !hasOnTap,
              prefixIcon: isGrouped || isUnderlined
                  ? prefixIconWidget?.margin(t: 22)
                  : prefixIconWidget,
              suffixIcon: obsecureToggle
                  ? null
                  : isGrouped || isUnderlined
                      ? suffixIconWidget?.margin(t: 22)
                      : suffixIconWidget,
              padding: hasLabel && (isGrouped || isUnderlined)
                  ? labelAndGroupedPadding
                  : Ei.only(
                      l: 16, r: obsecureToggle || hasOnTap ? 45 : 16, v: 14),
              controller: notifier.controller,
              maxLength: state.maxLength,
              obsecure: state.obsecure,
              onChange: (String value) {
                onChange?.call(value);

                // hide error message
                if (!notifier.isValid && value.trim().isNotEmpty) {
                  notifier.setMessage('', true);
                }
              },
              onSubmit: onSubmit,
              autofocus: autofocus,
              keyboard: keyboard,
              formatters: formatters,
              maxLines: maxLines,
              node: focusNode,
              hintStyle: font.fcolor(textColor.withValues(alpha: .4)),
              textStyle: font.fcolor(textColor),
            ),

            // if onTap is not null, add icon
            if (hasOnTap)
              Poslign(
                alignment: Alignment.centerRight,
                child: Icon(
                  style?.suffixIcon ??
                      (isTabler
                          ? Ti.chevronDown
                          : isHugeIcon
                              ? Hi.arrowDown01
                              : La.angleDown),
                  color:
                      style?.suffixIconColor ?? Colors.black38.adaptWithTheme,
                  size: 20,
                ).padding(r: 15, b: 1.5),
              ),

            // obsecure toggle
            if (obsecureToggle && !hasOnTap)
              Poslign(
                alignment: Alignment.centerRight,
                child: notifier
                    .watch((state) {
                      IconData iconView = isTabler
                          ? Ti.eye
                          : isHugeIcon
                              ? Hi.view
                              : La.eye;
                      IconData iconHide = isTabler
                          ? Ti.eyeOff
                          : isHugeIcon
                              ? Hi.viewOffSlash
                              : La.eyeSlash;

                      return Iconr(notifier.obsecure ? iconView : iconHide,
                          color: Colors.black38.adaptWithTheme,
                          padding: Ei.all(15),
                          size: 18);
                    })
                    .padding(b: 1.5, t: isGrouped || isUnderlined ? 22 : 0)
                    .onTap(() => notifier.setObsecure()),
              ),
          ],
        ),
      );
    });

    return Container(
      key: model?.key,
      margin: Ei.only(b: attr.isGrouped ? 0 : 0),
      child: Column(
        children: [
          // input label
          if (isTopAligned)
            Row(
              children: [
                labelWidget,
                if (indicator) indicatorWidget,
              ],
            ).between.margin(b: hasLabel ? 8 : 0),

          // input field
          if (isTopInner && hasLabel)
            Stack(
              children: [
                textFieldWidget.margin(t: 10),
                topInnerLabelWidget,
                if (indicator) topInnerIndicatorWidget,
              ],
            )
          else
            notifier.watch((state) => isUnderlined && state.disabled
                ? textFieldWidget.lz.clip(all: radius)
                : textFieldWidget),

          notifier.watch((state) => FormFeedbackMessage(
                show: !state.isValid,
                message: state.errorMessage,
                attribute: attr,
                backgroundColor: style?.feedbackBackgroundColor,
              ))
        ],
      ).start,
    );
  }
}
