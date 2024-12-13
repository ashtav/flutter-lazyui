// ignore_for_file: invalid_use_of_protected_member

part of '../forms.dart';

/// A dropdown selection widget for choosing an option from a list.
class Select extends StatelessWidget with LzFormMixin {
  /// The label displayed above the dropdown selection.
  final String? label;

  /// The hint text displayed in the dropdown selection.
  final String? hint;

  /// The list of options available for selection.
  final List<Option> options;

  /// The form type configuration.
  final FormType? type;

  /// The style configuration for the dropdown selection.
  final FormStyle? style;

  /// The style configuration for the picker used in the dropdown selection.
  final PickerStyle? pickerStyle;

  /// Specifies if the dropdown selection is disabled.
  final bool disabled;

  /// Callback function invoked when the dropdown selection is tapped.
  final Future Function()? onTap;

  /// Callback function invoked when the selected option changes.
  final Function(SelectValue value)? onChange;

  /// The form model associated with the dropdown selection.
  final FormModel? model;

  /// Create widget
  const Select(
      {super.key,
      this.label,
      this.hint,
      this.options = const [],
      this.type,
      this.style,
      this.pickerStyle,
      this.disabled = false,
      this.onTap,
      this.onChange,
      this.model});

  @override
  Widget build(BuildContext context) {
    final font = Gfont.style(context);
    final attr = getAttribute(context);
    FormStyle? style = attr.style ?? this.style;

    // form notifier
    final notifier = model?.notifier ?? FormNotifier();
    notifier.controller = model?.controller ?? TextEditingController();
    notifier.label = label ?? hint;
    notifier.isSelect = true;

    // set enabled or disabled
    if (!notifier.hasInit) {
      notifier.disabled = disabled;
      notifier.hasInit = true;
    }

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
    // bool hasOnTap = onTap != null;
    bool hasPrefix = style?.prefix != null;

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
    Widget? prefixIconWidget =
        style?.prefixIcon == null && style?.prefix == null
            ? null
            : hasPrefix
                ? Center(widthFactor: 1, child: style?.prefix).padding(h: 16)
                : Icon(style?.prefixIcon, color: style?.prefixIconColor);
    Widget? suffixIconWidget = Icon(
        style?.suffixIcon ??
            (isTabler
                ? Ti.chevronDown
                : isHugeIcon
                    ? Hi.arrowDown01
                    : La.angleDown),
        color: style?.suffixIconColor,
        size: 20);

    // init select list
    notifier.selectList = options;

    // ink touch & input field
    Widget textFieldWidget = notifier.watch((state) {
      // get background color
      Color backgroundColor = notifier.disabled
          ? const Color.fromARGB(31, 204, 204, 204)
          : style?.background ??
              (isUnderlined || isTopInner
                  ? Colors.transparent
                  : lzBackgroundColor);

      // onTap action
      void onTapSelect() {
        final selected = notifier.selectedSelect;

        // create options
        List<Option> options =
            state.selectList.map((e) => Option.fromMap(e.toMap())).toList();
        Option initialValue = Option.fromMap(selected?.toMap() ?? {});

        notifier.isSelectShow = true;
        LzPicker.option(context, initialValue: initialValue, options: options,
            onSelect: (value) {
          notifier.controller.text = value.label;
          notifier.selectedSelect = Option.fromMap(value.toMap());

          onChange?.call(SelectValue(value.label, value: value.value));
          notifier.isSelectShow = false;
          notifier.onSelected?.call(notifier.selectedSelect!);

          // set extra automatically
          notifier.extra = value.value;

          // hide error message
          if (!notifier.isValid) {
            notifier.setMessage('', true);
          }
        }, style: pickerStyle);
      }

      notifier.onTapSelect = onTapSelect;

      return InkTouch(
        onTap: state.disabled
            ? null
            : () async {
                bool ok = await onTap?.call() ?? true;
                if (!ok) return;

                onTapSelect();
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
              enabled: false,
              prefixIcon: isGrouped || isUnderlined
                  ? prefixIconWidget?.margin(t: 22)
                  : prefixIconWidget,
              suffixIcon: isGrouped || isUnderlined
                  ? suffixIconWidget.margin(t: 22)
                  : suffixIconWidget,
              padding: hasLabel && (isGrouped || isUnderlined)
                  ? labelAndGroupedPadding
                  : Ei.only(l: 16, r: 16, v: 14),
              controller: notifier.controller,
              hintStyle: font.fcolor(textColor.withValues(alpha: .4)),
              textStyle: font.fcolor(textColor),
            ),

            // if onTap is not null, add icon
            // if (hasOnTap)
            //   Poslign(
            //     alignment: Alignment.centerRight,
            //     child: Icon(
            //       style?.suffixIcon ??
            //           (isTabler ? Ti.chevronDown : La.angleDown),
            //       color: style?.suffixIconColor ?? Colors.black38,
            //       size: 18,
            //     ).padding(r: 15, b: 1.5),
            //   ),
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
