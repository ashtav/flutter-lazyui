part of lazyform;

class Input extends StatelessWidget {
  final String? label, hint;
  final FormModel? model;
  final int maxLength;
  final int? maxLines;
  final FocusNode? node;
  final bool disabled, readonly, autofocus, obsecure, obsecureToggle, indicator;
  final TextInputType? keyboard;
  final List<TextInputFormatter> formatters;
  final Function(String)? onChange, onSubmit;
  final Function(TextEditingController)? onTap;
  final IconData? suffixIcon;
  final LzInputicon? suffix;
  final LzFormLabelStyle? labelStyle;

  /// The length of the list must be 2, the first is the visible icon, the second is the hidden icon
  /// ``` dart
  /// obsecureIcons: [La.lock, La.unlock]
  /// ```
  final List<IconData> obsecureIcons;

  const Input(
      {super.key,
      this.label,
      this.hint,
      this.model,
      this.maxLength = 50,
      this.maxLines,
      this.node,
      this.disabled = false,
      this.readonly = false,
      this.autofocus = false,
      this.obsecure = false,
      this.keyboard,
      this.formatters = const [],
      this.obsecureToggle = false,
      this.indicator = false,
      this.onChange,
      this.onSubmit,
      this.onTap,
      this.suffixIcon,
      this.suffix,
      this.obsecureIcons = const [],
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
      if (parent!.children[0] is Input) {
        Input firstChild = parent.children[0] as Input;
        isFirst = firstChild.label == label;
      }
    }

    if (formListAncestor != null &&
        formListAncestor.style?.type == FormType.topAligned) {
      isTopAligned = true;
    }

    final notifier = model?.notifier ?? FormNotifier();
    List<TextInputFormatter> formatters = [];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      formatters = [
        LengthLimitingTextInputFormatter(maxLength < 1 ? 1 : maxLength),
        ...this.formatters
      ];
      notifier.setMaxLength(maxLength < 1 ? 1 : maxLength);

      // setting input formatter
      if (keyboard == Tit.number) {
        formatters.add(InputFormat.numeric);
      }

      // listen to controller
      if (model?.controller != null) {
        notifier.controller = model!.controller;

        if (notifier.controller.text.trim().isNotEmpty) {
          notifier.setTextLength(notifier.controller.text.length);
        }

        notifier.controller.addListener(() {
          notifier.setTextLength(notifier.controller.text.length);

          if (onTap != null && notifier.controller.text.isNotEmpty) {
            notifier.clear();
          }
        });
      }
    });

    // constructor data
    bool noLabel = label == null || label!.isEmpty;
    bool isSuffix =
        obsecureToggle || onTap != null || suffixIcon != null || suffix != null;
    bool isTopAlignedAndGrouped = isTopAligned && isGrouping;

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

          // Text Length
          indicator
              ? notifier.watch((_) => Textr(
                    '${notifier.textLength}/${notifier.maxLength}',
                    style: style?.copyWith(fontSize: 14, color: Colors.black45),
                    margin: Ei.only(r: isSuffix ? 50 : 0, l: 15),
                  ))
              : const None().margin(r: 50),
        ],
      ),
    );

    /* ----------------------------------------------------
    | Obsecure Toggle Widget
    | */

    IconData obsShowIcon = obsecureIcons.isNotEmpty
        ? obsecureIcons[0]
        : LazyUi.iconType == IconType.lineAwesome
            ? La.eye
            : Ti.eye;
    IconData obsHideIcon = obsecureIcons.length > 1
        ? obsecureIcons[1]
        : LazyUi.iconType == IconType.lineAwesome
            ? La.eyeSlash
            : Ti.eyeOff;

    Widget obsecureToggleWidget(bool obsecure) => Touch(
          onTap: () => notifier.setObsecure(!obsecure),
          child: Iconr(
            obsecure ? obsShowIcon : obsHideIcon,
            padding: Ei.only(h: 15, v: 15),
            border: Br.only(['l'],
                color: (formListAncestor?.style?.inputBorderColor ??
                    Colors.black12)),
          ),
        );

    /* ----------------------------------------------------
    | Suffix Widget
    | */

    // adjust suffix style
    LzInputicon? adjustSuffix;

    if (suffix != null) {
      adjustSuffix = LzInputicon(
        icon: suffix!.icon,
        borderColor: suffix!.borderColor ??
            (formListAncestor?.style?.inputBorderColor ?? Colors.black12),
        onTap: suffix!.onTap,
      );
    }

    Widget suffixWidget = isSuffix
        ? adjustSuffix ??
            Iconr(
              suffixIcon ??
                  (LazyUi.iconType == IconType.lineAwesome
                      ? La.angleDown
                      : Ti.chevronDown),
              color: Colors.black45,
              padding: Ei.only(h: 15, v: 15),
              border: Br.only(['l'],
                  color: (formListAncestor?.style?.inputBorderColor ??
                      Colors.black12)),
            )
        : const None();

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
          Color disabledColor = Utils.hex('#f3f4f6');
          String errorMessage = notifier.errorMessage;
          FocusNode focusNode = node ?? notifier.node;
          int maxLength = notifier.maxLength;

          bool? isDisabled = notifier.disabled;
          bool? isReadonly = notifier.readonly;

          bool enabled = onTap == null &&
              (isDisabled ?? !disabled) &&
              (isReadonly ?? !readonly);

          // update formatters (length, on index 0)
          int ioLengthLimiting = formatters
              .indexWhere((e) => e is LengthLimitingTextInputFormatter);
          if (ioLengthLimiting > -1) {
            formatters[ioLengthLimiting] =
                LengthLimitingTextInputFormatter(maxLength < 1 ? 1 : maxLength);
          }

          return InkTouch(
              onTap: onTap != null ? () => onTap!(notifier.controller) : null,
              color: (isDisabled ?? !disabled) ? Colors.white : disabledColor,
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
                      FocusScope(
                        onFocusChange: (value) {
                          if (!value &&
                              notifier.controller.text.trim().isNotEmpty) {
                            notifier.clear();
                          }
                        },
                        child: LzTextField(
                          hint: hint,
                          controller: model?.controller,
                          maxLength: maxLength,
                          maxLines: maxLines,
                          node: focusNode,
                          enabled: enabled,
                          autofocus: autofocus,
                          obsecure:
                              obsecureToggle ? notifier.obsecure : obsecure,
                          keyboard: keyboard,
                          formatters: formatters,
                          onChange: onChange,
                          onSubmit: onSubmit,
                          contentPadding: Ei.only(
                              t: noLabel || isTopAligned ? 14 : 40,
                              b: isValid ? 14 : 5,
                              l: 15,
                              r: isSuffix ? 65 : 15),
                        ),
                      ),

                      /* ----------------------------------------------------
                      | Feedback Message
                      | */

                      FeedbackMessage(
                        isValid: isValid,
                        errorMessage: errorMessage,
                        isSuffix: isSuffix,
                      ),
                    ],
                  ),
                  if (!isTopAligned)
                    Poslign(
                        alignment: Alignment.topLeft,
                        margin: Ei.only(h: 15, t: 13),
                        child: labelWidget),
                  Poslign(
                      alignment: Alignment.centerRight,
                      child: obsecureToggle
                          ? obsecureToggleWidget(notifier.obsecure)
                          : suffixWidget)
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
