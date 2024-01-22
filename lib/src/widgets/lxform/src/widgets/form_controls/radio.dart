part of forms;

class Radio2 extends StatelessWidget with LxFormMixin {
  final String? label;
  final List<String> options;
  final List<dynamic> values;
  final FormModelx? model;
  final List<dynamic> disabled;
  final FormType? type;
  final RadioStyle? style;

  const Radio2(
      {super.key,
      this.label,
      required this.options,
      this.values = const [],
      this.model,
      this.disabled = const [],
      this.type,
      this.style});

  @override
  Widget build(BuildContext context) {
    final attr = getAttribute(context);
    RadioStyle? style = attr.radioStyle ?? this.style;

    final notifier = FormNotifier();
    notifier.controller = model?.controller ?? TextEditingController();

    Widget labelWidget = Text(label ?? '', style: Gfont.fs14);

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

    // if values length is not equal to options length, show warning
    if (values.isNotEmpty && values.length != options.length) {
      logg('Warning: Radio values length is not equal to options length', name: 'LxForm');
    }

    // get radius
    double radius = style?.radius ?? LazyUi.radius;

    // get border color
    Color borderColor = style?.borderColor ?? Colors.black12;

    // get background color
    Color backgroundColor = style?.background ?? Colors.white;

    return Container(
      margin: Ei.only(b: 16),
      decoration:
          BoxDecoration(color: backgroundColor, border: Br.all(color: borderColor), borderRadius: Br.radius(radius)),
      padding: Ei.sym(h: 16, v: 10),
      child: Column(
        children: [
          if (label != null) labelWidget.margin(b: 8),

          // options
          notifier.watch((state) {
            final radioList = state.radioList;

            return Wrap(
              alignment: Wa.start,
              children: radioList.generate((item, i) {
                bool active = state.selectedRadio?.toMap().toString() == item.toMap().toString();

                return _Bullet(item.label, active, item.disabled, () {
                  state.setOption(item);
                }, style: style);
              }),
            );
          })
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
  const _Bullet(this.label, this.active, this.disabled, this.onTap, {this.style});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
            duration: 150.ms,
            width: 20,
            height: 20,
            margin: Ei.only(r: 10),
            decoration: BoxDecoration(
                border: Br.all(
                    color:
                        active ? (style?.activeColor ?? Colors.blueAccent) : (style?.inactiveColor ?? Colors.black38),
                    width: active ? 5 : 2),
                borderRadius: BorderRadius.circular(50))),
        Text(label, style: Gfont.color(style?.textColor ?? Colors.black87))
      ],
    ).min.margin(r: 15, b: 5).onTap(() => onTap()).lz.disabled(disabled);
  }
}
