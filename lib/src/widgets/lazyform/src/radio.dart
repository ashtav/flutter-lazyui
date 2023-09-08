part of lazyform;

/* ----------------------------------------------------
| Radio Widget
| */

class Radio extends StatelessWidget {
  final String? label;
  final List<Option> options;
  final Option? initValue;
  final FormModel? model;
  final bool disabled;
  final Color? activeColor;
  final Function(Option)? onChange;
  final LzFormLabelStyle? labelStyle;

  const Radio(
      {super.key,
      this.label,
      this.options = const [],
      this.initValue,
      this.model,
      this.disabled = false,
      this.activeColor,
      this.onChange,
      this.labelStyle});

  @override
  Widget build(BuildContext context) {
    // get parent widget name
    final parent = context.findAncestorWidgetOfExactType<LzFormGroup>();
    final formListAncestor =
        context.findAncestorWidgetOfExactType<LzFormList>();

    Type parentName = parent.runtimeType;
    bool isGrouping = parentName == LzFormGroup;
    bool isFirst = false;
    bool isTopAligned = parent?.type == FormType.topAligned;

    // get first children of parent
    if (isGrouping && (parent?.children ?? []).isNotEmpty) {
      if (parent!.children[0] is Radio) {
        Radio firstChild = parent.children[0] as Radio;
        isFirst = firstChild.label == label;
      }
    }

    if (formListAncestor != null &&
        formListAncestor.style?.type == FormType.topAligned) {
      isTopAligned = true;
    }

    final notifier = model?.notifier ?? FormNotifier();

    // constructor data
    bool noLabel = label == null || label!.isEmpty;
    bool isTopAlignedAndGrouped = isTopAligned && isGrouping;

    // set controller
    if (model?.controller != null) {
      notifier.controller = model!.controller;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // init value
      if (initValue != null) {
        notifier.setOption(initValue!);
      }
    });

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
                      formListAncestor?.style?.inputLabelFontWeight,
                  color: labelStyle?.color,
                  letterSpacing: labelStyle?.letterSpacing),
              overflow: Tof.ellipsis,
            ),
          ),
        ],
      ),
    );

    Widget field = ClipRRect(
      key: model?.key,
      borderRadius: Br.radius(isGrouping ? 0 : configRadius),
      child: AnimatedBuilder(
        animation: notifier,
        builder: (context, _) {
          // notifier data
          bool isValid = notifier.isValid;
          Color borderColor = isValid || isGrouping
              ? (formListAncestor?.style?.inputBorderColor ?? Colors.black12)
              : Colors.redAccent;
          String errorMessage = notifier.errorMessage;

          return Container(
              width: context.width,
              decoration: BoxDecoration(
                color: Colors.white,
                border: isGrouping
                    ? Br.only(['t'], except: isFirst)
                    : Br.all(color: borderColor),
                borderRadius: isGrouping ? null : Br.radius(configRadius),
              ),
              child: Stack(
                children: [
                  Container(
                    padding: Ei.only(
                        t: noLabel || isTopAligned ? 14 : 43,
                        b: isValid ? 5 : 0,
                        l: 15,
                        r: 15),
                    child: Column(
                      crossAxisAlignment: Caa.start,
                      mainAxisSize: Mas.min,
                      children: [
                        Wrap(
                          children: List.generate(options.length, (i) {
                            Option option = options[i];

                            String label = option.option;
                            bool disabled = this.disabled || option.disabled;
                            bool selected = notifier.option?.option == label;

                            Color radioColor = selected
                                ? (activeColor ?? LzFormTheme.activeColor)
                                : Colors.black38;

                            return Opacity(
                              opacity: !disabled ? 1 : .4,
                              child: Touch(
                                onTap: disabled
                                    ? null
                                    : () {
                                        notifier.setOption(options[i]);
                                        onChange?.call(options[i]);

                                        if ((formListAncestor?.cleanOnType ??
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
                                          shape: BoxShape.circle,
                                          border: Br.all(
                                              color: radioColor,
                                              width: selected ? 5 : 1),
                                          color: Colors.white),
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
                  if (!isTopAligned)
                    Poslign(
                        alignment: Alignment.topLeft,
                        margin: Ei.only(h: 15, t: 13),
                        child: labelWidget),
                ],
              ));
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
