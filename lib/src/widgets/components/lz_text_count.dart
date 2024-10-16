part of '../widget.dart';

/// A widget that animates a number count from [begin] to [end] over a specified
/// [duration] with a customizable precision, style, and text formatting options.
///
/// The count is animated smoothly according to the provided [curve] and can be
/// formatted with a [prefix], [suffix], and an optional [separator].
///
/// The resulting text can be styled and aligned with [TextStyle], [TextAlign],
/// and other standard text-related properties.
///
/// The following properties can be customized:
///
/// - [begin]: The initial value of the count (default is 0).
/// - [end]: The final value of the count (required).
/// - [precision]: The number of decimal places to display (default is 0).
/// - [curve]: The animation curve for the transition (default is [Curves.linear]).
/// - [duration]: The duration of the animation (default is 1 second).
/// - [style]: The style to use for the text.
/// - [textAlign]: The alignment of the text.
/// - [textDirection]: The direction of the text (LTR or RTL).
/// - [locale]: The locale used for number formatting.
/// - [softWrap]: Whether to break the text if it overflows.
/// - [overflow]: The behavior when the text overflows the container.
/// - [textScaleFactor]: The scale factor for text.
/// - [maxLines]: The maximum number of lines for the text.
/// - [semanticsLabel]: A label used for screen readers (accessibility).
/// - [separator]: A custom separator for grouping digits (e.g., comma).
/// - [prefix]: A string to display before the number (default is an empty string).
/// - [suffix]: A string to display after the number (default is an empty string).
///
/// This widget is useful for animating counts such as scores, financial data,
/// or any numeric value that changes over time.
class LzTextCount extends StatefulWidget {
  /// The starting value of the count animation.
  final double begin;

  /// The final value of the count animation.
  final double end;

  /// The number of decimal places to display.
  /// Defaults to 0, meaning no decimal places will be shown.
  final int precision;

  /// The curve used for the animation.
  /// Defaults to [Curves.linear].
  final Curve curve;

  /// The duration of the animation.
  /// Defaults to 1 second.
  final Duration duration;

  /// The style to apply to the text.
  final TextStyle? style;

  /// The alignment of the text.
  final TextAlign? textAlign;

  /// The text direction (LTR or RTL).
  final TextDirection? textDirection;

  /// The locale used for formatting the number.
  final Locale? locale;

  /// Whether the text should break if it overflows its container.
  final bool? softWrap;

  /// How the text should behave when it overflows its container.
  final TextOverflow? overflow;

  /// The scale factor for the text.
  final double? textScaleFactor;

  /// The maximum number of lines the text can occupy.
  final int? maxLines;

  /// A label used for accessibility tools such as screen readers.
  final String? semanticsLabel;

  /// A custom separator to group digits (e.g., a comma for thousands).
  final String? separator;

  /// A string to display before the number.
  /// Defaults to an empty string.
  final String prefix;

  /// A string to display after the number.
  /// Defaults to an empty string.
  final String suffix;

  /// Creates a [LzTextCount] widget.
  ///
  /// The [end] value is required, while other parameters such as [begin],
  /// [precision], [curve], and [duration] have default values.
  const LzTextCount({
    super.key,
    this.begin = 0,
    required this.end,
    this.precision = 0,
    this.curve = Curves.linear,
    this.duration = const Duration(seconds: 1),
    this.style,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.separator,
    this.prefix = '',
    this.suffix = '',
  });

  @override
  State<LzTextCount> createState() => _LzTextCountState();
}

class _LzTextCountState extends State<LzTextCount>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double? _latestBegin;
  double? _latestEnd;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _latestBegin = widget.begin;
    _latestEnd = widget.end;
  }

  @override
  void didUpdateWidget(LzTextCount oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update the duration if it has changed
    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
    }

    // Check if the begin or end values have changed, and reset the animation if necessary
    if (widget.begin != _latestBegin || widget.end != _latestEnd) {
      _controller.reset();
      _latestBegin = widget.begin;
      _latestEnd = widget.end;
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    CurvedAnimation curvedAnimation =
        CurvedAnimation(parent: _controller, curve: widget.curve);
    _animation = Tween<double>(begin: widget.begin, end: widget.end)
        .animate(curvedAnimation);

    if (widget.begin != _latestBegin || widget.end != _latestEnd) {
      _controller.reset();
    }

    _latestBegin = widget.begin;
    _latestEnd = widget.end;
    _controller.forward();

    return _LzTextCountAnimatedText(
      key: UniqueKey(),
      animation: _animation,
      precision: widget.precision,
      style: widget.style,
      textAlign: widget.textAlign,
      textDirection: widget.textDirection,
      locale: widget.locale,
      softWrap: widget.softWrap,
      overflow: widget.overflow,
      textScaleFactor: widget.textScaleFactor,
      maxLines: widget.maxLines,
      semanticsLabel: widget.semanticsLabel,
      separator: widget.separator,
      prefix: widget.prefix,
      suffix: widget.suffix,
    );
  }
}

class _LzTextCountAnimatedText extends AnimatedWidget {
  final RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');

  final Animation<double> animation;
  final int precision;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final String? separator;
  final String? prefix;
  final String? suffix;

  _LzTextCountAnimatedText({
    super.key,
    required this.animation,
    required this.precision,
    this.style,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.separator,
    this.prefix,
    this.suffix,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) => Text(
        separator != null
            ? '$prefix${animation.value.toStringAsFixed(precision).replaceAllMapped(reg, (Match match) => '${match[1]}$separator')}$suffix'
            : '$prefix${animation.value.toStringAsFixed(precision)}$suffix',
        style: style,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaler: TextScaler.linear(
            MediaQuery.textScalerOf(context).scale(textScaleFactor ?? 1)),
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
      );
}
