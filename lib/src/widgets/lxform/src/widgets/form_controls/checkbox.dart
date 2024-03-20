// ignore_for_file: invalid_use_of_protected_member

part of forms;

class Checkbox extends StatelessWidget with LzFormMixin {
  final String? label;
  final List<String> options;
  final List<dynamic> values;
  final List<dynamic> initValue;
  final LxFormModel? model;
  final List<dynamic> disabled;
  final FormType? type;
  final CheckboxStyle? style;
  final Function(List<CheckboxValue> value)? onChange;

  const Checkbox(
      {super.key,
      this.label,
      required this.options,
      this.values = const [],
      this.initValue = const [],
      this.model,
      this.disabled = const [],
      this.type,
      this.style,
      this.onChange});

  @override
  Widget build(BuildContext context) {
    final attr = getAttribute(context);
    CheckboxStyle? style =
        (attr.isWrapped ? attr.style?.checkbox : attr.checkboxStyle) ??
            this.style;

    final notifier = model?.notifier ?? LxFormNotifier();
    notifier.controller = model?.controller ?? TextEditingController();
    notifier.label = label;

    // generate options
    List<CheckboxModel> options = this.options.generate((item, i) {
      bool isListInt = this.disabled.every((e) => e is int);
      bool isListString = this.disabled.every((e) => e is String);

      bool disabled = isListInt
          ? this.disabled.contains(i)
          : isListString
              ? this.disabled.contains(item)
              : false;

      final value = values.length <= i ? null : values[i];

      // return checkbox model
      return CheckboxModel(item, value: value, disabled: disabled);
    });

    notifier.checkboxList = options;

    if (model != null) {
      notifier.isCheckbox = true;
      notifier.setCheckboxFindBy(initValue);
    }

    // if values length is not equal to options length, show warning
    if (values.isNotEmpty && values.length != options.length) {
      logg('Warning: Checkbox values length is not equal to options length',
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
    Color textColor = style?.textColor ?? Colors.black87;

    // get radius
    double radius = style?.radius ?? LazyUi.radius;

    // get border color
    Color borderColor = style?.borderColor ?? Colors.black12;

    // get background color
    Color backgroundColor = style?.background ??
        (isUnderlined || isTopInner ? Colors.transparent : Colors.white);

    // create label widget
    Widget labelWidget = hasLabel
        ? Text(label!, style: Gfont.fs14.fcolor(textColor))
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
            final checkboxList = state.checkboxList;

            return Wrap(
              alignment: Wa.start,
              children: checkboxList.generate((item, i) {
                bool active = state.selectedCheckbox.contains(item);

                return _Square(item.label, active, item.disabled, () {
                  // hide error message when user select checkbox
                  if (!notifier.isValid) {
                    notifier.setMessage('', true);
                  }

                  state.setCheckbox(item);
                  onChange?.call(notifier.selectedCheckbox
                      .map((e) => CheckboxValue(e.label, value: e.value))
                      .toList());
                }, style: style);
              }),
            );
          })
        ],
      ).start,
    );

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
              attribute: attr))
        ],
      ).start,
    );
  }
}

class _Square extends StatelessWidget {
  final String label;
  final bool active, disabled;
  final Function() onTap;
  final CheckboxStyle? style;
  const _Square(this.label, this.active, this.disabled, this.onTap,
      {this.style});

  @override
  Widget build(BuildContext context) {
    Color activeColor = style?.activeColor ?? Colors.blueAccent;

    return Row(
      children: [
        AnimatedContainer(
          duration: 150.ms,
          width: 20,
          height: 20,
          margin: Ei.only(r: 10),
          decoration: BoxDecoration(
              color: active ? activeColor : Colors.white,
              border: Br.all(color: Colors.black38, width: active ? 0 : 1.3),
              borderRadius: BorderRadius.circular(3)),
          child: Center(
              child: AnimatedOpacity(
            duration: 100.ms,
            opacity: active ? 1 : 0,
            child: const Icon(
              Ti.check,
              size: 17,
              color: Colors.white,
            ),
          )),
        ),
        Text(label, style: Gfont.color(style?.textColor ?? Colors.black87))
      ],
    ).min.margin(r: 15, b: 5).onTap(() => onTap()).lz.disabled(disabled);
  }
}
