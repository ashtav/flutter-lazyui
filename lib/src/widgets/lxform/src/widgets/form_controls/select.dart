// ignore_for_file: invalid_use_of_protected_member

part of forms;

class Select extends StatelessWidget with LzFormMixin {
  final String? label, hint;
  final List<LxOption> options;
  final FormType? type;
  final FormStyle? style;
  final bool disabled;
  final Future Function()? onTap;
  final Function(SelectValue value)? onChange;
  final LxFormModel? model;

  const Select({
    super.key,
    this.label,
    this.hint,
    this.options = const [],
    this.type,
    this.style,
    this.disabled = false,
    this.onTap,
    this.onChange,
    this.model,
  });

  @override
  Widget build(BuildContext context) {
    final attr = getAttribute(context);
    FormStyle? style = attr.style ?? this.style;

    // form notifier
    final notifier = model?.notifier ?? LxFormNotifier();
    notifier.controller = model?.controller ?? TextEditingController();
    notifier.label = label ?? hint;
    notifier.isSelect = true;

    // set enabled or disabled
    notifier.disabled = disabled;

    // get form type
    FormType formType = attr.type ?? (type ?? FormType.topAligned);
    bool isGrouped = formType == FormType.grouped;
    bool isTopAligned = formType == FormType.topAligned;
    bool isUnderlined = formType == FormType.underlined;
    bool isTopInner = formType == FormType.topInner;

    // get icon (tabler or line awesome)
    bool isTabler = LazyUi.iconType == IconType.tablerIcon;

    // get radius
    double radius = style?.radius ?? LazyUi.radius;

    // get border color
    Color borderColor = style?.borderColor ?? Colors.black12;

    // get text color
    Color textColor = style?.textColor ?? Colors.black87;

    // check if label is available
    bool hasLabel = label != null && !attr.isGrouped;
    bool hasOnTap = onTap != null;

    // create label widget
    Widget labelWidget = hasLabel
        ? Text(label!, style: Gfont.fs14.fcolor(textColor))
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
    Widget? prefixIconWidget = hasOnTap || style?.prefixIcon == null
        ? null
        : Icon(style?.prefixIcon, color: style?.prefixIconColor);
    Widget? suffixIconWidget = Icon(
        style?.suffixIcon ?? (isTabler ? Ti.chevronDown : La.angleDown),
        color: style?.suffixIconColor);

    // init select list
    notifier.selectList = options;

    // ink touch & input field
    Widget textFieldWidget = notifier.watch((state) {
      // get background color
      Color backgroundColor = notifier.disabled
          ? const Color.fromARGB(31, 204, 204, 204)
          : style?.background ??
              (isUnderlined || isTopInner ? Colors.transparent : Colors.white);

      // onTap action
      void onTapSelect() {
        final selected = notifier.selectedSelect;

        // create options
        List<LxOption> options =
            state.selectList.map((e) => LxOption.fromMap(e.toMap())).toList();
        LxOption initialValue = LxOption.fromMap(selected?.toMap() ?? {});

        notifier.isSelectShow = true;
        LxPicker.option(context, initialValue: initialValue, options: options,
            onSelect: (value) {
          notifier.controller.text = value.label;
          notifier.selectedSelect = LxOption.fromMap(value.toMap());

          onChange?.call(SelectValue(value.label, value: value.value));
          notifier.isSelectShow = false;
          notifier.onSelected?.call(notifier.selectedSelect);

          // hide error message
          if (!notifier.isValid) {
            notifier.setMessage('', true);
          }
        });
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
              hintStyle: Gfont.color(textColor.withOpacity(.4)),
              textStyle: Gfont.color(textColor),
            ),

            // if onTap is not null, add icon
            if (hasOnTap)
              Poslign(
                alignment: Alignment.centerRight,
                child: Icon(
                  style?.suffixIcon ??
                      (isTabler ? Ti.chevronDown : La.angleDown),
                  color: style?.suffixIconColor ?? Colors.black38,
                  size: 18,
                ).padding(r: 15, b: 1.5),
              ),
          ],
        ),
      );
    });

    return Container(
      key: model?.key,
      margin: Ei.only(b: attr.isGrouped ? 0 : 16),
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
              attribute: attr))
        ],
      ).start,
    );
  }
}
