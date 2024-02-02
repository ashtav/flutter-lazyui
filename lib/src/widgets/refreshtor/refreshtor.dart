import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/widgets/refreshtor/src/arrow_indicator.dart';

import 'src/bar_indicator.dart';
import 'src/curve_indicator.dart';

export 'src/style.dart';

class Refreshtor extends StatelessWidget {
  final Widget? child;
  final Function() onRefresh;
  final RefrehtorType type;
  final RefreshtorStyle? style;
  final Widget Function(IndicatorController controller, double value)? builder;

  const Refreshtor(
      {super.key, this.child, required this.onRefresh, this.type = RefrehtorType.curve, this.style, this.builder});

  @override
  Widget build(BuildContext context) {
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

                Map<RefrehtorType, Widget> contents = {
                  RefrehtorType.curve: CurveIndicator(controller, value, style),
                  RefrehtorType.bar: BarIndicator(controller, value, style),
                  RefrehtorType.arrow: ArrowIndicator(controller, value, style)
                };

                return Container(margin: Ei.only(t: style?.height ?? 0), child: contents[type]!);
              },
            ),
            child
          ]);
        },
        child: child ?? const None());
  }
}
