// ignore_for_file: invalid_use_of_protected_member

part of '../forms.dart';

/// A radio button group widget for selecting a single option from a list.
class Radio extends StatelessWidget with LzFormMixin {
  /// The label displayed above the radio button group.
  final String? label;

  /// The list of options displayed as radio button labels.
  final List<String> options;

  /// The list of values corresponding to each option.
  final List<dynamic> values;

  /// The initial selected value for the radio button group.
  final dynamic initValue;

  /// The form model associated with the radio button group.
  final FormModel? model;

  /// List of disabled values for the radio button group.
  final List<dynamic> disabled;

  /// The form type configuration.
  final FormType? type;

  /// The style configuration for the radio button group.
  final RadioStyle? style;

  /// Callback function invoked when the selected radio button changes.
  final Function(RadioValue value)? onChange;

  /// Create widget
  const Radio(
      {super.key,
      this.label,
      required this.options,
      this.values = const [],
      this.initValue,
      this.model,
      this.disabled = const [],
      this.type,
      this.style,
      this.onChange});

  @override
  Widget build(BuildContext context) {
    final font = Gfont.style(context);
    final attr = getAttribute(context);
    RadioStyle? style =
        (attr.isWrapped ? attr.style?.radio : attr.radioStyle) ?? this.style;

    final notifier = model?.notifier ?? FormNotifier();
    notifier.controller = model?.controller ?? TextEditingController();
    notifier.label = label;

    // generate options
    List<RadioModel> options = this.options.generate((item, i) {
      bool isListInt = this.disabled.every((e) => e is int);
      bool isListString = this.disabled.every((e) => e is String);

      bool disabled = isListInt
          ? this.disabled.contains(i)
          : isListString
              ? this.disabled.contains(item)
              : false;

      final value = values.length <= i ? null : values[i];

      // return radio model
      return RadioModel(item, value: value, disabled: disabled);
    });

    notifier.radioList = options;

    if (model != null) {
      notifier.isRadio = true;
      notifier.setOptionFindBy(initValue);
    }

    // if values length is not equal to options length, show warning
    if (values.isNotEmpty && values.length != options.length) {
      logg('Warning: Radio values length is not equal to options length',
          name: 'LzForm');
    }

    // check if label is available
    bool hasLabel = label != null && !attr.isGrouped;

    // get form type
    FormType formType = attr.type ?? (type ?? FormType.topAligned);
    bool isGrouped = formType == FormType.grouped;
    bool isTopAligned = formType == FormType.topAligned;
    bool isUnderlined = formType == FormType.underlined;
    bool isTopInner = formType == FormType.topInner;

    // get text color
    Color textColor = style?.textColor ?? Colors.black87.adaptWithTheme;

    // get radius
    double radius = style?.radius ?? LazyUi.radius;

    // get border color
    Color borderColor = style?.borderColor ?? Colors.black12.adaptWithTheme;

    // get background color
    Color backgroundColor = style?.background ??
        (isUnderlined || isTopInner ? Colors.transparent : lzBackgroundColor);

    // create label widget
    Widget labelWidget = hasLabel
        ? Text(label!, style: font.fs14.fcolor(textColor))
        : const None();

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

    Widget radioWidget = Container(
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
      padding: Ei.sym(h: 16, v: 10),
      width: context.width,
      child: Column(
        children: [
          if ((isGrouped || isUnderlined) && !attr.isGrouped)
            labelWidget.margin(b: 8),
          if ((!hasLabel || !isGrouped || !isUnderlined))
            const SizedBox(height: 5),

          // options
          notifier.watch((state) {
            final radioList = state.radioList;

            return Wrap(
              alignment: Wa.start,
              children: radioList.generate((item, i) {
                bool active = state.selectedRadio?.toMap().toString() ==
                    item.toMap().toString();

                return _Bullet(item.label, active, item.disabled, () {
                  // hide error message when user select radio
                  if (!notifier.isValid) {
                    notifier.setMessage('', true);
                  }

                  state.setOption(item);
                  onChange?.call(RadioValue(item.label, value: item.value));
                }, style: style);
              }),
            );
          })
        ],
      ).start,
    );

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
                radioWidget.margin(t: 10),
                topInnerLabelWidget,
              ],
            )
          else
            isUnderlined && notifier.disabled
                ? radioWidget.lz.clip(all: radius)
                : radioWidget,

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

class _Bullet extends StatelessWidget {
  final String label;
  final bool active, disabled;
  final Function() onTap;
  final RadioStyle? style;
  const _Bullet(this.label, this.active, this.disabled, this.onTap,
      {this.style});

  @override
  Widget build(BuildContext context) {
    final font = Gfont.style(context);
    return Row(
      children: [
        AnimatedContainer(
            duration: 150.ms,
            width: 20,
            height: 20,
            margin: Ei.only(r: 10),
            decoration: BoxDecoration(
                border: Br.all(
                    color: active
                        ? (style?.activeColor ?? Colors.blueAccent)
                        : (style?.inactiveColor ??
                            Colors.black38.adaptWithTheme),
                    width: active ? 5 : 1.3),
                borderRadius: BorderRadius.circular(50))),
        Text(label,
            style:
                font.fcolor(style?.textColor ?? Colors.black87.adaptWithTheme))
      ],
    ).min.margin(r: 15, b: 5).onTap(() => onTap()).lz.disabled(disabled);
  }
}
