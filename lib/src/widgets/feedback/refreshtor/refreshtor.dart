import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/widgets/feedback/refreshtor/src/arrow_indicator.dart';

import 'src/bar_indicator.dart';
import 'src/curve_indicator.dart';

export 'src/style.dart';

/// A widget that displays a refresh indicator.
class Refreshtor extends StatelessWidget {
  /// The widget below this widget in the tree.
  final Widget? child;

  /// Callback function invoked when the user triggers a refresh.
  final Function() onRefresh;

  /// The type of Refreshtor.
  final RefrehtorType type;

  /// Style configuration for the Refreshtor.
  final RefreshtorStyle? style;

  /// A builder function that returns a custom indicator widget.
  final Widget Function(IndicatorController controller, double value)? builder;

  /// Creates a Refreshtor widget.
  const Refreshtor(
      {super.key,
      this.child,
      required this.onRefresh,
      this.type = RefrehtorType.curve,
      this.style,
      this.builder});

  @override
  Widget build(BuildContext context) {
    bool hasVibrated = false;

    return CustomRefreshIndicator(
        onRefresh: () async => onRefresh.call(),
        offsetToArmed: style?.offsetToArmed ?? 80,
        builder: (
          BuildContext context,
          Widget child,
          IndicatorController controller,
        ) {
          return Stack(children: <Widget>[
            AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget? _) {
                double value = controller.value;

                if (builder != null) {
                  return builder!(controller, value);
                }

                if (controller.isArmed && !hasVibrated) {
                  HapticFeedback.heavyImpact();
                  hasVibrated = true;
                } else if (!controller.isArmed) {
                  hasVibrated = false;
                }

                Map<RefrehtorType, Widget> contents = {
                  RefrehtorType.curve: CurveIndicator(controller, value, style),
                  RefrehtorType.bar: BarIndicator(controller, value, style),
                  RefrehtorType.arrow: ArrowIndicator(controller, value, style)
                };

                return contents[type]!;
              },
            ),
            child
          ]);
        },
        child: child ?? const None());
  }
}
