import 'package:flutter/material.dart' as m;
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/config.dart';

import '../form_model.dart';
import '../notifier.dart';

/// A customizable slider widget that allows users to select a value from a range
/// by sliding a thumb along a horizontal track.
///
/// This widget is stateful and can be used in forms or anywhere a value selection
/// within a range is required.
///
/// Example usage:
/// ```dart
/// Slider(
///   value: _currentValue,
///   min: 0.0,
///   max: 100.0,
///   onChanged: (double newValue) {
///     setState(() {
///       _currentValue = newValue;
///     });
///   },
/// )
/// ```
///
/// See also:
///  * [RangeSlider], for selecting a range of values.
///  * [SliderTheme], for customizing the appearance of sliders.
class Slider extends StatefulWidget {
  /// The label text displayed above the slider.
  final String? label;

  /// The style of the label text.
  final TextStyle? labelStyle;

  /// The initial value for the slider.
  final double? initValue;

  /// The minimum value of the slider.
  final double min;

  /// The maximum value of the slider.
  final double max;

  /// The number of discrete divisions on the slider.
  final int? divisions;

  /// Called when the slider value changes.
  final Function(double value)? onChange;

  /// A widget builder for displaying a custom indicator for the current slider value.
  final Widget Function(double value)? indicator;

  /// Whether the slider is enabled or disabled.
  final bool enabled;

  /// A [FormModel] instance for managing the slider state and validation.
  final FormModel? model;

  /// Constructor for [Slider].
  const Slider({
    super.key,

    // Text properties
    this.label,
    this.labelStyle,

    // Input properties
    this.initValue,
    this.min = 0,
    this.max = 100,
    this.divisions,

    // Event handlers
    this.onChange,

    // Appearance properties
    this.indicator,

    // Control properties
    this.enabled = false,
    this.model,
  });

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

    notifier.type = 'slider';
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
    if (widget.model == null) {
      notifier.dispose();
    }

    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Slider old) {
    if (widget.model != old.model) {
      onInit();
    }

    super.didUpdateWidget(old);
  }

  @override
  Widget build(BuildContext context) {
    final label = widget.label;
    bool hasLabel = ![null, ''].contains(label);

    Color activeColor = config.primaryColor;
    Color inactiveColor =
        context.isDarkMode ? Colors.white12 : Colors.black12.applyOpacity(.05);
    Color activeTickMarkColor = config.primaryColor;
    Color inactiveTickMarkColor =
        context.isDarkMode ? Colors.white12 : Colors.black12;
    Color valueIndicatorColor = config.primaryColor;
    Color thumbColor = config.primaryColor;

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
                  style: widget.labelStyle ?? Gfont.fs14,
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

/// A custom slider track shape that extends [RectangularSliderTrackShape].
///
/// This class can be used to define a unique appearance for the track of a slider widget.
/// Override its methods to customize the track's dimensions, painting, and layout.
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

/// A custom stateless widget that represents a slider line element.
///
/// This widget is intended to be used as part of a form element, providing
/// a visual representation of a slider's track or line.
///
/// Typically used internally by slider-related widgets to render the slider's
/// background or progress indicator.
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
