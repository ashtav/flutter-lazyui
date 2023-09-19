part of lazyform;

/* ----------------------------------------------------
| Select Widget
| */

class Select extends StatelessWidget with FormWidgetMixin {
  final String? label, hint;
  final List<Option> options;
  final Option? initValue;
  final FormModel? model;
  final bool disabled, expandValue;
  final Function(String)? onChange;
  final Future? Function(SelectController controller)? onTap;
  final Function(SelectController controller)? onSelect;
  final LzFormLabelStyle? labelStyle;
  final int? maxLines;

  const Select(
      {super.key,
      this.label,
      this.hint,
      this.options = const [],
      this.initValue,
      this.model,
      this.disabled = false,
      this.expandValue = false,
      this.onChange,
      this.onTap,
      this.onSelect,
      this.labelStyle,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    final attr = getAttribute<Select>(
        context, (e) => label == null ? e.hint == hint : e.label == label);

    bool isGrouping = attr.isGrouping;
    bool isFirst = attr.isFirst;

    final notifier = model?.notifier ?? FormNotifier();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // listen to controller
      if (model?.controller != null) {
        notifier.controller = model!.controller;

        if (notifier.controller.text.trim().isNotEmpty) {
          notifier.setTextLength(notifier.controller.text.length);
        }
      }

      // set options
      notifier.setOptions(options);
    });

    // constructor data
    bool noLabel = label == null || label!.isEmpty;
    bool isTopAlignedAndGrouped = attr.isTypeTopAligned && isGrouping;

    // get text style
    TextStyle? style = Theme.of(context).textTheme.bodyMedium;
    double configRadius = LazyUi.radius;

    /* ----------------------------------------------------
    | Label Widget
    | */

    Widget labelWidget = IgnorePointer(
      child: Row(
        mainAxisAlignment: Maa.spaceBetween,
        children: [
          Flexible(
            child: Textr(
              label ?? '',
              style: style?.copyWith(
                  fontSize: labelStyle?.fontSize ?? 14,
                  fontWeight: labelStyle?.fontWeight ??
                      attr.formListAncestor?.style?.inputLabelFontWeight,
                  color: labelStyle?.color,
                  letterSpacing: labelStyle?.letterSpacing),
              overflow: Tof.ellipsis,
            ),
          ),
        ],
      ),
    );

    /* ----------------------------------------------------
    | Suffix Widget
    | */

    Widget suffixWidget = Iconr(
      LazyUi.iconType == IconType.lineAwesome ? La.angleDown : Ti.chevronDown,
      color: Colors.black45,
      padding: Ei.only(h: 15, v: 15),
      border: Br.only(['l'],
          color: (attr.formListAncestor?.style?.inputBorderColor ??
              Colors.black12)),
    );

    SelectController selectController = SelectController(
        label: label?.replaceAll('*', '').trim(),
        controller: model?.controller,
        setExtra: (value) {
          notifier.extra = value;
        });

    Widget field = ClipRRect(
      key: model?.key,
      borderRadius: Br.radius(isGrouping ? 0 : configRadius),
      child: AnimatedBuilder(
        animation: notifier,
        builder: (context, _) {
          // notifier data
          bool isValid = notifier.isValid;
          Color borderColor = isValid || isGrouping
              ? (attr.formListAncestor?.style?.inputBorderColor ??
                  Colors.black12)
              : Colors.redAccent;
          String errorMessage = notifier.errorMessage;
          Color disabledColor = Utils.hex('#f3f4f6');

          bool? isDisabled = notifier.disabled;
          bool enabled = (isDisabled ?? !disabled);

          return InkTouch(
              onTap: !enabled
                  ? null
                  : () async {
                      // execute onTap callback
                      dynamic callback = await onTap?.call(selectController);

                      // as default, options can be shown except when the callback is false
                      bool ok = true;
                      if (callback is bool) ok = callback;

                      // get options
                      List<Option> options =
                          selectController.options ?? notifier.options;

                      // if (selectController.option != null) {
                      //   notifier.setOption(selectController.option);
                      // }

                      if (ok && options.isNotEmpty && context.mounted) {
                        FocusScope.of(context).unfocus();

                        // show options
                        context.bottomSheet(
                            SelectPicker(
                                initialValue: notifier.option ?? initValue,
                                options: options,
                                maxLines: maxLines,
                                onSelect: (option) {
                                  selectController.option = option;

                                  notifier.setOption(option);
                                  onSelect?.call(selectController);

                                  if ((attr.formListAncestor?.cleanOnFilled ??
                                          false) &&
                                      !notifier.data['valid']) {
                                    notifier.clear();
                                  }
                                }),
                            backgroundColor: Colors.transparent);
                      }
                    },
              color: attr.isTypeTopAligned || isGrouping
                  ? Colors.transparent
                  : enabled
                      ? Colors.white
                      : disabledColor,
              border: isGrouping
                  ? Br.only(['t'], except: isFirst, color: borderColor)
                  : Br.all(color: borderColor),
              radius: isGrouping ? null : Br.radius(configRadius),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: Caa.start,
                    mainAxisSize: Mas.min,
                    children: [
                      LzTextField(
                        hint: hint,
                        controller: model?.controller,
                        enabled: false,
                        onChange: onChange,
                        padding: Ei.only(
                            t: noLabel || attr.isTypeTopAligned || isGrouping
                                ? 14
                                : 40,
                            b: isValid ? 14 : 5,
                            l: attr.isTypeUnderlined ? 0 : 15,
                            r: attr.isTypeUnderlined ? 0 : 65),
                        maxLines: expandValue ? 50 : null,
                      ),

                      /* ----------------------------------------------------
                      | Feedback Message
                      | */

                      FeedbackMessage(
                        isValid: isValid,
                        errorMessage: errorMessage,
                        isSuffix: true,
                      ),
                    ],
                  ),
                  if (!attr.isTypeTopAligned && !isGrouping)
                    Poslign(
                        alignment: Alignment.topLeft,
                        margin: Ei.only(h: 15, t: 13),
                        child: labelWidget),
                  Poslign(alignment: Alignment.centerRight, child: suffixWidget)
                ],
              ));
        },
      ),
    );

    return (attr.isTypeTopAligned
            ? Column(
                crossAxisAlignment: Caa.start,
                mainAxisSize: Mas.min,
                children: [
                  if (!isTopAlignedAndGrouped) labelWidget.margin(b: 10),
                  field
                ],
              )
            : field)
        .margin(b: isGrouping ? 0 : 20);
  }
}
