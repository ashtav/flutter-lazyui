part of lazyform;

class SliderWidget extends StatelessWidget with FormWidgetMixin {
  final String? label;
  final double min, max;
  final int? divisions;
  final FormModel? model;
  final LzFormLabelStyle? labelStyle;

  const SliderWidget(
      {super.key, this.label, this.min = 0, this.max = 100, this.divisions, this.model, this.labelStyle});

  @override
  Widget build(BuildContext context) {
    final attr = getAttribute<Input>(context, (e) => e.label == label);

    final notifier = model?.notifier ?? FormNotifier();

    TextStyle? style = Theme.of(context).textTheme.bodyMedium;

    return notifier.watch((state) {
      double value = double.tryParse(state.controller.text) ?? 0;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Row(
              mainAxisAlignment: Maa.spaceBetween,
              children: [
                Text(
                  label!,
                  style: style?.copyWith(
                      fontSize: labelStyle?.fontSize ?? 14,
                      fontWeight: labelStyle?.fontWeight ?? attr.formListAncestor?.style?.inputLabelFontWeight,
                      color: labelStyle?.color,
                      letterSpacing: labelStyle?.letterSpacing),
                ),
                Text('${value.round()}')
              ],
            ),
          SliderTheme(
            data: SliderThemeData(
              trackShape: CustomTrackShape(),
            ),
            child: Slider(
              value: value,
              max: max,
              activeColor: Colors.grey,
              inactiveColor: Colors.grey[300],
              divisions: divisions,
              label: value.round().toString(),
              onChanged: (double value) {
                notifier.setText(value.toString(), notify: true);
              },
            ),
          ),
        ],
      );
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
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
