part of lazyform;

class SliderWidget extends StatelessWidget with FormWidgetMixin {
  final String? label;
  final double min, max;
  final int? divisions;
  final FormModel? model;
  final Color? activeColor, inactiveColor;
  final LzFormLabelStyle? labelStyle;
  final bool disabled;
  final Function(double value)? onChange;

  const SliderWidget(
      {super.key,
      this.label,
      this.min = 0,
      this.max = 100,
      this.divisions,
      this.model,
      this.labelStyle,
      this.activeColor,
      this.inactiveColor,
      this.disabled = false,
      this.onChange});

  @override
  Widget build(BuildContext context) {
    final attr = getAttribute<Input>(context, (e) => e.label == label);
    final notifier = model?.notifier ?? FormNotifier();

    TextStyle? style = Theme.of(context).textTheme.bodyMedium;

    Color activeColor = this.activeColor ?? Colors.blueAccent;
    Color inactiveColor =
        this.inactiveColor ?? const Color.fromARGB(255, 145, 184, 252);

    return notifier.watch((state) {
      double value = double.tryParse(state.controller.text) ?? 0;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null && !attr.isGrouping)
            Row(
              mainAxisAlignment: Maa.spaceBetween,
              children: [
                Text(
                  label!,
                  style: style?.copyWith(
                      fontSize: labelStyle?.fontSize ?? 14,
                      fontWeight: labelStyle?.fontWeight ??
                          attr.formListAncestor?.style?.inputLabelFontWeight,
                      color: labelStyle?.color,
                      letterSpacing: labelStyle?.letterSpacing),
                ),
                Text('${value.round()}')
              ],
            ),
          Container(
            padding:
                Ei.sym(h: attr.isGrouping && !attr.isTypeUnderlined ? 15 : 0),
            child: Stack(
              children: [
                // additional widget for slider
                _SlideLiner('l', activeColor, 6),
                _SlideLiner('r', inactiveColor, 4),

                // slider
                SliderTheme(
                  data: SliderThemeData(
                    trackShape: CustomTrackShape(),
                  ),
                  child: Slider(
                    value: value,
                    max: max,
                    activeColor: activeColor,
                    inactiveColor: inactiveColor,
                    divisions: divisions,
                    label: value.round().toString(),
                    onChanged: (double value) {
                      notifier.setText(value.toString(), notify: true);
                      onChange?.call(value);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ).lz.opacity(disabled ? .5 : 1).lz.ignore(disabled);
    });
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
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
          width: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
        ));
  }
}
