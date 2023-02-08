import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:mixins/mixins.dart';

import 'transition.dart';

class Refreshtor extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final Widget child;
  final Color? releaseTextColor;
  final double heightIndicator;

  const Refreshtor({Key? key, required this.onRefresh, required this.child, this.releaseTextColor, this.heightIndicator = 110}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
        onRefresh: onRefresh,
        builder: (
          BuildContext context,
          Widget child,
          IndicatorController controller,
        ) {
          return Stack(children: <Widget>[
            AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget? _) {
                Color primaryColor = LazyConfig.getConfig.primaryColor;

                return controller.isLoading || controller.value <= 0.1
                    ? const None()
                    : SlideDown(
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: controller.value >= 1
                              ? 1
                              : controller.value <= 0
                                  ? 0
                                  : controller.value,
                          child: Container(
                              alignment: Alignment.center,
                              height: heightIndicator * controller.value,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  AnimatedContainer(
                                      margin: Ei.only(b: 10),
                                      duration: const Duration(milliseconds: 100),
                                      height: 2,
                                      width: 50 * controller.value,
                                      decoration: BoxDecoration(
                                          color: controller.isArmed ? (releaseTextColor ?? primaryColor) : Colors.black38,
                                          borderRadius: Br.radius(50))),
                                  Textr(controller.isArmed ? 'Release to refresh' : 'Pull down to refresh',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(fontSize: 13, color: controller.isArmed ? (releaseTextColor ?? primaryColor) : Colors.black38),
                                      margin: Ei.only(t: 20))
                                ],
                              )),
                        ),
                      );
              },
            ),
            child
          ]);
        },
        child: child);
  }
}
