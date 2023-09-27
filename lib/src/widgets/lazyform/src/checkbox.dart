part of lazyform;

/* ----------------------------------------------------
| Checkbox Widget
| */

class Checkbox extends StatelessWidget with FormWidgetMixin {
  final String? label;
  final List<Option> options, initValue;
  final FormModel? model;
  final bool disabled;
  final Color? activeColor;
  final Function(Option)? onChange;
  final LzFormLabelStyle? labelStyle;

  const Checkbox(
      {super.key,
      this.label,
      this.options = const [],
      this.initValue = const [],
      this.model,
      this.disabled = false,
      this.activeColor,
      this.onChange,
      this.labelStyle});

  @override
  Widget build(BuildContext context) {
    final attr = getAttribute<Checkbox>(context, (e) => e.label == label);

    bool isFirst = attr.isFirst;
    bool isTopAligned = attr.isTypeTopAligned;
    bool isGrouping = attr.isGrouping;

    // if (attr.formListAncestor != null && attr.formListAncestor!.style?.type == FormType.topAligned) {
    //   isTopAligned = true;
    // }

    final notifier = model?.notifier ?? FormNotifier();

    // constructor data
    bool noLabel = label == null || label!.isEmpty;
    bool isTopAlignedAndGrouped = isTopAligned && isGrouping;

    // set controller
    if (model?.controller != null) {
      notifier.controller = model!.controller;

      // init value
      List<String> checkeds =
          model!.controller.text.split(',').map((e) => e.trim()).toList();
      notifier.checked = checkeds.map((e) => Option(option: e)).toList();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // init value
      if (initValue.isNotEmpty) {
        notifier.setCheckedAll(initValue);
      }
    });

    // get text style
    TextStyle? style = Theme.of(context).textTheme.bodyMedium;
    double configRadius = LazyUi.radius;

    /* ----------------------------------------------------
    | Label Widget
    | */

    Widget justLabel = Textr(
      label ?? '',
      style: style?.copyWith(
          fontSize: labelStyle?.fontSize ?? 14,
          fontWeight: labelStyle?.fontWeight ??
              attr.formListAncestor?.style?.inputLabelFontWeight,
          color: labelStyle?.color,
          letterSpacing: labelStyle?.letterSpacing),
      overflow: Tof.ellipsis,
    );

    // i and l need less space than other letters
    // so we need to adjust

    int countI = (label ?? '').replaceAll(RegExp('[^il]'), '').length;

    Widget labelWidget = IgnorePointer(
      child: Row(
        mainAxisAlignment: Maa.spaceBetween,
        children: [
          Flexible(
              child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              if (attr.isTopInner)
                Container(
                  height: 2,
                  width: (label ?? '').length * (8 - (countI * .7)).toDouble(),
                  color: attr.formListAncestor?.style?.backgroundColor ??
                      (attr.isTopInner ? 'fafafa'.hex : Colors.transparent),
                  margin: Ei.only(t: 2),
                ),
              justLabel.margin(l: attr.isTopInner ? 5 : 0)
            ],
          )),
        ],
      ),
    );

    Widget field = ClipRRect(
      key: model?.key,
      borderRadius:
          Br.radius(isGrouping || attr.isTypeUnderlined ? 0 : configRadius),
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

          return Stack(
            children: [
              Container(
                  width: context.width,
                  decoration: BoxDecoration(
                    color: attr.formListAncestor?.style?.backgroundColor ??
                        (attr.isTypeUnderlined || attr.isTopInner
                            ? Colors.transparent
                            : Colors.white),
                    border: attr.isTypeUnderlined && !isGrouping
                        ? Br.only(['b'], color: borderColor)
                        : isGrouping
                            ? Br.only(['t'],
                                except: isFirst, color: borderColor)
                            : Br.all(color: borderColor),
                    borderRadius: attr.isTypeUnderlined || isGrouping
                        ? null
                        : Br.radius(configRadius),
                  ),
                  margin: Ei.only(t: attr.isTopInner && !isGrouping ? 10 : 0),
                  child: Stack(
                    children: [
                      Container(
                        padding: Ei.only(
                            t: noLabel || attr.isTypeTopAligned || isGrouping
                                ? 14
                                : attr.isTopInner
                                    ? 17
                                    : 43,
                            b: isValid ? 5 : 0,
                            l: attr.isTypeUnderlined ? 0 : 15,
                            r: attr.isTypeUnderlined ? 0 : 15),
                        child: Column(
                          crossAxisAlignment: Caa.start,
                          mainAxisSize: Mas.min,
                          children: [
                            Wrap(
                              children: List.generate(options.length, (i) {
                                Option option = options[i];

                                String label = option.option;
                                bool disabled =
                                    this.disabled || option.disabled;
                                bool selected = notifier.checked
                                    .any((e) => e.option == label);

                                Color radioColor = selected
                                    ? (activeColor ?? LzFormTheme.activeColor)
                                    : Colors.black38;

                                return Opacity(
                                  opacity: !disabled ? 1 : .4,
                                  child: Touch(
                                    onTap: disabled
                                        ? null
                                        : () {
                                            notifier.setChecked(options[i]);
                                            onChange?.call(options[i]);

                                            if ((attr.formListAncestor
                                                        ?.cleanOnFilled ??
                                                    false) &&
                                                !notifier.data['valid']) {
                                              notifier.clear();
                                            }
                                          },
                                    margin: Ei.only(b: 10),
                                    child: Row(
                                      mainAxisSize: Mas.min,
                                      children: [
                                        AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 150),
                                          width: 18,
                                          height: 18,
                                          margin: Ei.only(r: 10),
                                          decoration: BoxDecoration(
                                              borderRadius: Br.radius(3),
                                              border: Br.all(color: radioColor),
                                              color: selected
                                                  ? radioColor
                                                  : Colors.white),
                                          child: AnimatedSwitcher(
                                              duration: const Duration(
                                                  milliseconds: 150),
                                              transitionBuilder: (Widget child,
                                                      Animation<double>
                                                          animation) =>
                                                  ScaleTransition(
                                                    scale: animation,
                                                    child: child,
                                                  ),
                                              child: selected
                                                  ? const Icon(
                                                      Icons.check,
                                                      size: 16,
                                                      color: Colors.white,
                                                    )
                                                  : const None()),
                                        ),
                                        Textr(
                                          label,
                                          margin: Ei.only(r: 15),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),

                            /* ----------------------------------------------------
                            | Feedback Message
                            | */

                            FeedbackMessage(
                              isValid: isValid,
                              errorMessage: errorMessage,
                              leftLess: true,
                            ),
                          ],
                        ),
                      ),
                      if ((attr.isTypeGrouped || attr.isTypeUnderlined) &&
                          !isGrouping)
                        Poslign(
                            alignment: Alignment.topLeft,
                            margin: Ei.only(
                                h: attr.isTypeUnderlined ? 0 : 15, t: 13),
                            child: labelWidget),
                    ],
                  )),

              // top inner label
              if (attr.isTopInner && !isGrouping)
                Poslign(
                    alignment: Alignment.topLeft,
                    margin: Ei.only(h: 10),
                    child: labelWidget),
            ],
          );
        },
      ),
    );

    return (isTopAligned
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
