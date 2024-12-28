import 'package:flutter/material.dart' as m;
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../form_model.dart';
import '../notifier.dart';

class Slider extends StatefulWidget {
  final String? label;
  final double? initValue;
  final double min;
  final double max;
  final int? divisions;
  final bool enabled;
  final FormModel? model;
  final Function(double value)? onChange;
  final Widget Function(double value)? indicator;

  const Slider(
      {super.key,
      this.label,
      this.initValue,
      this.min = 0,
      this.max = 100,
      this.divisions,
      this.enabled = false,
      this.model,
      this.onChange,
      this.indicator});

  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  FormNotifier notifier = FormNotifier();

  void onInit() {
    // if model is not null set notifier from model
    if (widget.model != null) {
      // ignore: invalid_use_of_protected_member
      notifier = widget.model!.notifier;
    }

    notifier.controller.text = (widget.initValue ?? 0).toString();
    notifier.enabled = widget.enabled;
  }

  void onChange(double value) {
    notifier.controller.text = value.toString();
    notifier.notify();

    widget.onChange?.call(value);
  }

  @override
  void initState() {
    onInit();
    super.initState();
  }

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Slider old) {
    if(widget.model != old.model){
      onInit();
    }

    super.didUpdateWidget(old);
  }

  @override
  Widget build(BuildContext context) {
    final label = widget.label;
    bool hasLabel = ![null, ''].contains(label);

    Color activeColor = Colors.green;
    Color inactiveColor = context.isDarkMode ? Colors.white12 : Colors.black12;
    Color activeTickMarkColor = Colors.green;
    Color inactiveTickMarkColor = context.isDarkMode ? Colors.white12 : Colors.black12;
    Color valueIndicatorColor = Colors.green;
    Color thumbColor = Colors.green;

    return notifier.watch((state) {
      double getValue(value) {
        value as double;
        value = double.parse(value.toStringAsFixed(0));
        return value;
      }

      double value = getValue(double.tryParse(state.controller.text) ?? 0.0);

      return Column(
        children: [
          Row(
            children: [
              if (hasLabel)
                Textr(
                  label!,
                  style: Gfont.fs14,
                  overflow: Tof.ellipsis,
                ).lz.flexible(),
            ],
          ),
          Stack(
            children: [
              _SlideLiner('l', activeColor, 4),
              _SlideLiner('r', inactiveColor, 4),
              SliderTheme(
                data: SliderThemeData(
                  trackShape: CustomTrackShape(),
                  activeTrackColor: activeColor,
                  inactiveTrackColor: inactiveColor,
                  thumbColor: thumbColor,
                  activeTickMarkColor: activeTickMarkColor,
                  inactiveTickMarkColor: inactiveTickMarkColor,
                  valueIndicatorColor: valueIndicatorColor,
                ),
                child: m.Slider(
                  value: value,
                  max: widget.max,
                  divisions: widget.divisions,
                  label: value.round().toString(),
                  onChanged: onChange,
                ),
              ),
            ],
          ),
        ],
      ).start;
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
        alignment: alignment == 'l' ? Alignment.centerLeft : Alignment.centerRight,
        child: Container(
          height: height,
          width: 10.1,
          decoration: BoxDecoration(
            color: color,
            borderRadius: alignment == 'l' ? Br.radiusOnly(ltb: 5) : Br.radiusOnly(rtb: 5),
          ),
        ));
  }
}
