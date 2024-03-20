// ignore_for_file: invalid_use_of_protected_member

part of forms;

class Slider extends StatelessWidget with LzFormMixin {
  final String? label;
  final double? initValue;
  final double min;
  final double max;
  final int? divisions;
  final bool disabled;
  final LxFormModel? model;
  final Function(double value)? onChange;
  final SlideStyle? style;
  final Widget Function(double value)? indicator;

  const Slider(
      {super.key,
      this.label,
      this.initValue,
      this.min = 0,
      this.max = 100,
      this.divisions,
      this.disabled = false,
      this.model,
      this.onChange,
      this.style,
      this.indicator});

  @override
  Widget build(BuildContext context) {
    final attr = getAttribute(context);
    SlideStyle? style =
        (attr.isWrapped ? attr.style?.slide : attr.slideStyle) ?? this.style;

    final notifier = model?.notifier ?? LxFormNotifier();
    notifier.controller = model?.controller ?? TextEditingController();
    notifier.label = label;

    bool hasLabel = label != null;
    bool hasIndicator = indicator != null;

    Color activeColor = style?.activeColor ?? Colors.blueAccent;
    Color inactiveColor =
        style?.inactiveColor ?? Colors.blueAccent.withOpacity(.5);

    return notifier.watch((state) {
      double getValue(value) {
        value = double.parse(value.toStringAsFixed(0));
        return value;
      }

      double value = getValue(double.tryParse(state.controller.text) ?? 0);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hasLabel && !attr.isGrouped)
            Row(
              mainAxisAlignment: Maa.spaceBetween,
              children: [
                Textr(
                  label!,
                  overflow: Tof.ellipsis,
                  margin: Ei.only(r: 15),
                ).lz.flexible(),
                hasIndicator ? indicator!(value) : Text('$value')
              ],
            ),
          Container(
              padding: Ei.sym(h: attr.isGrouped ? 16 : 0),
              color: attr.isGrouped ? Colors.white : Colors.transparent,
              child: Stack(
                children: [
                  // additional widget for slider
                  _SlideLiner('l', activeColor, 4),
                  _SlideLiner('r', inactiveColor, 4),

                  // slider
                  SliderTheme(
                    data: SliderThemeData(
                      trackShape: CustomTrackShape(),
                      activeTrackColor: activeColor,
                      inactiveTrackColor: inactiveColor,
                      thumbColor: style?.thumbColor,
                      activeTickMarkColor: style?.activeTickMarkColor,
                      inactiveTickMarkColor: style?.inactiveTickMarkColor,
                      // valueIndicatorColor: Colors.transparent,
                      // valueIndicatorTextStyle: Gfont.black
                    ),
                    child: m.Slider(
                      value: value,
                      max: max,
                      divisions: divisions,
                      label: value.round().toString(),
                      onChanged: (double value) {
                        notifier.setSlider(getValue(value));
                        onChange?.call(getValue(value));
                      },
                    ),
                  ),
                ],
              ).lz.opacity(disabled ? .5 : 1).lz.ignore(disabled)),
        ],
      );
    });
  }
}

class CustomTrackShape extends RectangularSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx + 10;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width - 20;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

class _SlideLiner extends StatelessWidget {
  final String alignment;
  final Color? color;
  final double height;

  const _SlideLiner(this.alignment, this.color, this.height);

  @override
  Widget build(BuildContext context) {
    return Poslign(
        alignment:
            alignment == 'l' ? Alignment.centerLeft : Alignment.centerRight,
        child: Container(
          height: height,
          width: 10.1,
          decoration: BoxDecoration(
            color: color,
            borderRadius: alignment == 'l'
                ? Br.radiusOnly(ltb: 5)
                : Br.radiusOnly(rtb: 5),
          ),
        ));
  }
}
