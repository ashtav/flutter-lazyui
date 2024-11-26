part of '../widget.dart';

/// Skeleton widget used for displaying loading or placeholder content.
class Skeleton extends StatelessWidget {
  /// Size of the skeleton widget.
  final dynamic size;

  /// Radius of the skeleton widget.
  final double? radius;

  /// Color of the skeleton widget.
  final Color? color;

  /// Highlight color of the skeleton widget.
  final Color? highlight;

  /// Create widget
  const Skeleton(
      {super.key, this.size, this.radius, this.color, this.highlight});

  @override
  Widget build(BuildContext context) {
    double width = _getSize(size, 'width') ?? 50,
        height = _getSize(size, 'height') ?? 15;
    double radius = this.radius ?? LazyUi.radius;

    Color baseColor = color ?? (lzDarkMode ? '1e1d21'.hex : Colors.grey[300]!);
    Color highlightColor =
        highlight ?? (lzDarkMode ? '555'.hex : Colors.grey[200]!);

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.grey[200]!,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }

  /// Creates a copy of this [Skeleton] but with the given fields replaced with the new values.
  Skeleton copyWith(
      {dynamic size, double? radius, Color? color, Color? highlight}) {
    return Skeleton(
        size: size ?? this.size,
        radius: radius ?? this.radius,
        color: color ?? this.color,
        highlight: highlight ?? this.highlight);
  }

  /// Ready-to-use skeleton with card style
  static Widget card({bool thumbnail = false}) {
    return Container(
      padding: Ei.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: Br.radius(LazyUi.radius)),
      child: Row(
        children: [
          if (thumbnail)
            const Skeleton(
              size: 50,
            ),
          const Skeleton(size: [
            [100, 200]
          ]).iterate(2, gap: 5)
        ],
      ).gap(15),
    );
  }
}

/// Extension on Skeleton to generate a column of widgets based on [value].
extension SkeletonExtension on Skeleton {
  /// Iterates over [value] to generate a column of Skeleton widgets.
  ///
  /// [value]: Number of Skeleton widgets to generate.
  /// [alignment]: CrossAxisAlignment for the Column.
  /// [gap]: Vertical gap between generated Skeleton widgets.
  Widget iterate(int value,
      {CrossAxisAlignment alignment = CrossAxisAlignment.start,
      double gap = 0}) {
    return Column(
        crossAxisAlignment: alignment,
        children: List.generate(value, (i) {
          return copyWith(size: size, color: color, highlight: highlight);
        })).gap(gap);
  }
}

double? _getSize(dynamic size, String type) {
  if (size == null) {
    return null;
  }

  num result = 0;

  if (size is num || size is List) {
    if (type == 'width') {
      if (size is num) {
        result = size;
      } else {
        size as List;

        if (size.isNotEmpty) {
          if (size[0] is List) {
            List<num> size0 = size[0];

            // generate between
            if (size0.length > 1) {
              result = size0.numInRange<double>();
            } else {
              result = size0[0];
            }
          } else {
            result = size[0];
          }
        }
      }
    }

    // height
    else {
      if (size is num) {
        result = size;
      } else {
        size as List;

        if (size.isNotEmpty && size.length > 1) {
          if (size[1] is List) {
            List<num> size1 = size[1];

            // generate between
            if (size1.length > 1) {
              result = size1.numInRange<double>();
            } else {
              result = size1[0];
            }
          } else {
            result = size[1];
          }
        } else {
          return null;
        }
      }
    }
  } else {
    return null;
  }

  return result.toDouble();
}

/// * author: hunghd
/// * email: hunghd.yb@gmail.com
///
/// A package provides an easy way to add shimmer effect to Flutter application

/// An enum defines all supported directions of shimmer effect
///
/// * [ShimmerDirection.ltr] left to right direction
/// * [ShimmerDirection.rtl] right to left direction
/// * [ShimmerDirection.ttb] top to bottom direction
/// * [ShimmerDirection.btt] bottom to top direction

enum ShimmerDirection {
  /// Shimmer animation flows from left to right.
  ltr,

  /// Shimmer animation flows from right to left.
  rtl,

  /// Shimmer animation flows from top to bottom.
  ttb,

  /// Shimmer animation flows from bottom to top.
  btt,
}

/// A widget renders shimmer effect over [child] widget tree.
///
/// [child] defines an area that shimmer effect blends on. You can build [child]
/// from whatever [Widget] you like but there're some notices in order to get
/// exact expected effect and get better rendering performance:
///
/// * Use static [Widget] (which is an instance of [StatelessWidget]).
/// * [Widget] should be a solid color element. Every colors you set on these
/// [Widget]s will be overridden by colors of [gradient].
/// * Shimmer effect only affects to opaque areas of [child], transparent areas
/// still stays transparent.
///
/// [period] controls the speed of shimmer effect. The default value is 1500
/// milliseconds.
///
/// [direction] controls the direction of shimmer effect. The default value
/// is [ShimmerDirection.ltr].
///
/// [gradient] controls colors of shimmer effect.
///
/// [loop] the number of animation loop, set value of `0` to make animation run
/// forever.
///
/// [enabled] controls if shimmer effect is active. When set to false the animation
/// is paused
///
///
/// ## Pro tips:
///
/// * [child] should be made of basic and simple [Widget]s, such as [Container],
/// [Row] and [Column], to avoid side effect.
///
/// * use one [Shimmer] to wrap list of [Widget]s instead of a list of many [Shimmer]s
///
@immutable
class Shimmer extends StatefulWidget {
  /// The child widget to apply shimmer effect.
  final Widget child;

  /// The duration of each shimmer animation cycle.
  final Duration period;

  /// The direction of the shimmer animation.
  final ShimmerDirection direction;

  /// The gradient used for the shimmer effect.
  final Gradient gradient;

  /// The number of times the shimmer animation loops.
  final int loop;

  /// Whether the shimmer effect is currently enabled.
  final bool enabled;

  /// Creates a shimmer effect widget.

  const Shimmer({
    super.key,
    required this.child,
    required this.gradient,
    this.direction = ShimmerDirection.ltr,
    this.period = const Duration(milliseconds: 1500),
    this.loop = 0,
    this.enabled = true,
  });

  ///
  /// A convenient constructor provides an easy and convenient way to create a
  /// [Shimmer] which [gradient] is [LinearGradient] made up of `baseColor` and
  /// `highlightColor`.
  ///
  Shimmer.fromColors({
    super.key,
    required this.child,
    required Color baseColor,
    required Color highlightColor,
    this.period = const Duration(milliseconds: 1500),
    this.direction = ShimmerDirection.ltr,
    this.loop = 0,
    this.enabled = true,
  }) : gradient = LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              baseColor,
              baseColor,
              highlightColor,
              baseColor,
              baseColor
            ],
            stops: const <double>[
              0.0,
              0.35,
              0.5,
              0.65,
              1.0
            ]);

  @override
  State<Shimmer> createState() => _ShimmerState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Gradient>('gradient', gradient,
        defaultValue: null));
    properties.add(EnumProperty<ShimmerDirection>('direction', direction));
    properties.add(
        DiagnosticsProperty<Duration>('period', period, defaultValue: null));
    properties
        .add(DiagnosticsProperty<bool>('enabled', enabled, defaultValue: null));
    properties.add(DiagnosticsProperty<int>('loop', loop, defaultValue: 0));
  }
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _count = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.period)
      ..addStatusListener((AnimationStatus status) {
        if (status != AnimationStatus.completed) {
          return;
        }
        _count++;
        if (widget.loop <= 0) {
          _controller.repeat();
        } else if (_count < widget.loop) {
          _controller.forward(from: 0.0);
        }
      });
    if (widget.enabled) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(Shimmer oldWidget) {
    if (widget.enabled) {
      _controller.forward();
    } else {
      _controller.stop();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (BuildContext context, Widget? child) => _Shimmer(
        direction: widget.direction,
        gradient: widget.gradient,
        percent: _controller.value,
        child: child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

@immutable
class _Shimmer extends SingleChildRenderObjectWidget {
  final double percent;
  final ShimmerDirection direction;
  final Gradient gradient;

  const _Shimmer({
    super.child,
    required this.percent,
    required this.direction,
    required this.gradient,
  });

  @override
  _ShimmerFilter createRenderObject(BuildContext context) {
    return _ShimmerFilter(percent, direction, gradient);
  }

  @override
  void updateRenderObject(BuildContext context, _ShimmerFilter shimmer) {
    shimmer.percent = percent;
    shimmer.gradient = gradient;
    shimmer.direction = direction;
  }
}

class _ShimmerFilter extends RenderProxyBox {
  ShimmerDirection _direction;
  Gradient _gradient;
  double _percent;

  _ShimmerFilter(this._percent, this._direction, this._gradient);

  @override
  ShaderMaskLayer? get layer => super.layer as ShaderMaskLayer?;

  @override
  bool get alwaysNeedsCompositing => child != null;

  set percent(double newValue) {
    if (newValue == _percent) {
      return;
    }
    _percent = newValue;
    markNeedsPaint();
  }

  set gradient(Gradient newValue) {
    if (newValue == _gradient) {
      return;
    }
    _gradient = newValue;
    markNeedsPaint();
  }

  set direction(ShimmerDirection newDirection) {
    if (newDirection == _direction) {
      return;
    }
    _direction = newDirection;
    markNeedsLayout();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      assert(needsCompositing);

      final double width = child!.size.width;
      final double height = child!.size.height;
      Rect rect;
      double dx, dy;
      if (_direction == ShimmerDirection.rtl) {
        dx = _offset(width, -width, _percent);
        dy = 0.0;
        rect = Rect.fromLTWH(dx - width, dy, 3 * width, height);
      } else if (_direction == ShimmerDirection.ttb) {
        dx = 0.0;
        dy = _offset(-height, height, _percent);
        rect = Rect.fromLTWH(dx, dy - height, width, 3 * height);
      } else if (_direction == ShimmerDirection.btt) {
        dx = 0.0;
        dy = _offset(height, -height, _percent);
        rect = Rect.fromLTWH(dx, dy - height, width, 3 * height);
      } else {
        dx = _offset(-width, width, _percent);
        dy = 0.0;
        rect = Rect.fromLTWH(dx - width, dy, 3 * width, height);
      }
      layer ??= ShaderMaskLayer();
      layer!
        ..shader = _gradient.createShader(rect)
        ..maskRect = offset & size
        ..blendMode = BlendMode.srcIn;
      context.pushLayer(layer!, super.paint, offset);
    } else {
      layer = null;
    }
  }

  double _offset(double start, double end, double percent) {
    return start + (end - start) * percent;
  }
}
