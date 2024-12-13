// ignore_for_file: invalid_use_of_protected_member

part of '../forms.dart';

/// A number input widget for capturing numeric values.
class Number extends StatelessWidget with LzFormMixin {
  /// The label displayed above the number input field.
  final String? label;

  /// The hint text displayed inside the number input field.
  final String? hint;

  /// The form type configuration.
  final FormType? type;

  /// The style configuration for the number input field.
  final FormStyle? style;

  /// Whether the number input field is disabled.
  final bool disabled;

  /// Whether the number input field should have autofocus.
  final bool autofocus;

  /// Callback function invoked when the number input text changes.
  final Function(String value)? onChange;

  /// The form model associated with the number input field.
  final FormModel? model;

  /// The focus node that controls the focus state of the number input field.
  final FocusNode? node;

  /// The minimum value allowed for the number input.
  final int min;

  /// The maximum value allowed for the number input.
  final int max;

  /// The step value used for incrementing or decrementing the number input.
  final int step;

  /// Whether to show control buttons (e.g., increment and decrement buttons).
  final bool controls;

  /// List of icon data for control buttons.
  final List<IconData>? iconControls;

  /// Create widget
  const Number(
      {super.key,
      this.label,
      this.hint,
      this.type,
      this.style,
      this.disabled = false,
      this.autofocus = false,
      this.onChange,
      this.model,
      this.node,
      this.min = 0,
      this.max = 100,
      this.step = 1,
      this.controls = true,
      this.iconControls});

  @override
  Widget build(BuildContext context) {
    final font = Gfont.style(context);
    final attr = getAttribute(context);
    FormStyle? style = attr.style ?? this.style;

    // form notifier
    final notifier = model?.notifier ?? FormNotifier();
    notifier.controller = model?.controller ?? TextEditingController();
    notifier.label = label ?? hint;

    FocusNode focusNode = node ?? notifier.node;

    // set enabled or disabled
    if (!notifier.hasInit) {
      notifier.disabled = disabled;
      notifier.hasInit = true;
    }

    notifier.min = min;
    notifier.max = max;
    notifier.step = step;
    notifier.onChange = onChange;

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

    // create label widget
    Widget labelWidget = hasLabel
        ? Text(label!, style: font.fs14.fcolor(textColor))
        : const None();

    // create grouped label widget
    Widget groupedLabelWidget = Positioned(
        top: 12,
        child: Container(
            padding: Ei.sym(h: 16), width: context.width, child: labelWidget));

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

    // create has label and grouped padding
    final labelAndGroupedPadding = Ei.only(h: 16, t: 35, b: 12);

    // create prefix & suffix icon widget
    Widget? prefixIconWidget = style?.prefixIcon == null
        ? null
        : Icon(style?.prefixIcon, color: style?.prefixIconColor);

    void onChangeControl(String value) {
      try {
        int number = int.parse(value.trim().isEmpty ? '0' : value.trim());
        if (number < min) number = min;
        if (number > max) number = max;

        notifier.controller.text = number.toString();
        onChange?.call(number.toString());
      } catch (e, s) {
        Utils.errorCatcher(e, s);
      }
    }

    // ink touch & input field
    Widget textFieldWidget = notifier.watch((state) {
      // get background color
      Color backgroundColor = notifier.disabled
          ? const Color.fromARGB(31, 204, 204, 204)
          : style?.background ??
              (isUnderlined || isTopInner
                  ? Colors.transparent
                  : lzBackgroundColor);

      return Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: attr.isGrouped
              ? null
              : isUnderlined
                  ? Br.only(['b'], color: borderColor)
                  : Br.all(color: borderColor),
          borderRadius:
              isUnderlined ? null : Br.radius(attr.isGrouped ? 0 : radius),
        ),
        child: Stack(
          children: [
            // if grouped, add label and indicator
            if (isGrouped || isUnderlined) groupedLabelWidget,

            // input field
            LzTextField(
              hint: hint,
              enabled: !state.disabled,
              prefixIcon: isGrouped || isUnderlined
                  ? prefixIconWidget?.margin(t: 22)
                  : prefixIconWidget,
              padding: hasLabel && (isGrouped || isUnderlined)
                  ? labelAndGroupedPadding
                  : Ei.only(l: 16, r: controls ? (45 * 2) : 16, v: 14),
              controller: notifier.controller,
              maxLength: 50,
              onChange: onChangeControl,
              autofocus: autofocus,
              keyboard: Tit.number,
              formatters: [
                LengthLimitingTextInputFormatter(max < 1 ? 1 : max),
                Formatter.numeric
              ],
              node: focusNode,
              hintStyle: font.fcolor(textColor.withValues(alpha: .4)),
              textStyle: font.fcolor(textColor),
            ),

            // input number control
            if (controls)
              Poslign(
                alignment: Alignment.centerRight,
                child: notifier
                    .watch((state) {
                      IconData iconPlus = isTabler
                          ? Ti.plus
                          : isHugeIcon
                              ? Hi.plusSign
                              : La.plus;
                      IconData iconMin = isTabler
                          ? Ti.minus
                          : isHugeIcon
                              ? Hi.minusSign
                              : La.minus;

                      if (iconControls != null && iconControls!.length == 2) {
                        iconMin = iconControls![0];
                        iconPlus = iconControls![1];
                      }

                      return Row(
                          children: [iconMin, iconPlus].generate((icon, i) {
                        bool disabled = (i == 0 && state.getNumber <= min) ||
                            (i == 1 && state.getNumber >= max);

                        return GestureDetector(
                          onLongPress: disabled
                              ? null
                              : () => notifier.setNumber(i, longPress: true),
                          onLongPressUp:
                              disabled ? null : () => notifier.setNumber(-1),
                          child: InkTouch(
                            onTap:
                                disabled ? null : () => notifier.setNumber(i),
                            padding: Ei.all(15),
                            child: Icon(icon,
                                color: disabled
                                    ? Colors.black12.adaptWithTheme
                                    : Colors.black38.adaptWithTheme,
                                size: 18),
                          ),
                        );
                      })).min;
                    })
                    .padding(t: isGrouped || isUnderlined ? 22 : 0)
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
              ],
            ).between.margin(b: hasLabel ? 8 : 0),

          // input field
          if (isTopInner && hasLabel)
            Stack(
              children: [
                textFieldWidget.margin(t: 10),
                topInnerLabelWidget,
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
              backgroundColor: style?.feedbackBackgroundColor))
        ],
      ).start,
    );
  }
}
