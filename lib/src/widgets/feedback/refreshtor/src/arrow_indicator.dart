import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

/// Widget for displaying an arrow indicator.
class ArrowIndicator extends StatelessWidget {
  /// The controller for the indicator.
  final IndicatorController controller;

  /// The value of the indicator.
  final double value;

  /// The style of the indicator.
  final RefreshtorStyle? style;

  /// Creates an ArrowIndicator.
  const ArrowIndicator(this.controller, this.value, this.style, {super.key});

  @override
  Widget build(BuildContext context) {
    bool isArmed = controller.isArmed;
    bool isFinal = controller.isFinalizing;
    bool isLoading = controller.isLoading;

    Color backgroundColor = style?.backgroundColor ?? Colors.white;
    Color textColor = style?.textColor ??
        (backgroundColor.isDark() ? Colors.white : Colors.black87);
    Color releaseTextColor = style?.releaseTextColor ??
        (backgroundColor.isDark() ? Colors.white : Colors.black87);
    Color indicatorColor = style?.indicatorColor ??
        (backgroundColor.isDark() ? Colors.white : Colors.black87);

    String? text = style?.text;
    String? releaseText = style?.releaseText;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        if (!isLoading && !isFinal)
          SizedBox(
            width: context.width,
            child: AnimatedOpacity(
              duration: 300.ms,
              opacity: value > 1 ? 1 : value,
              child: Column(
                mainAxisSize: Mas.min,
                mainAxisAlignment: Maa.center,
                children: [
                  SlideSwitched(
                      direction: SlideDirection.down,
                      child: value < .1
                          ? const None()
                          : Container(
                              margin:
                                  Ei.only(t: 25 * value + (style?.height ?? 0)),
                              child: ResizedSwitcher(
                                show: true,
                                alignment: Alignment.center,
                                child: SizedBox(
                                  key: ValueKey(isArmed),
                                  width: context.width,
                                  child: Iconr(
                                    isArmed ? Ti.arrowUp : Ti.arrowDown,
                                    color: indicatorColor,
                                  ).lz.animate.blink(isArmed, 300.ms),
                                ),
                              ),
                            )),
                  AnimatedOpacity(
                    duration: 150.ms,
                    opacity: value.clamp(0, 1),
                    child: Textr(
                        isArmed
                            ? (releaseText ?? 'Release to refresh')
                            : (text ?? 'Pull down to refresh'),
                        style: LazyUi.font.copyWith(
                            fontSize: 13,
                            fontWeight: isArmed ? Fw.bold : Fw.normal,
                            color: isArmed ? releaseTextColor : textColor),
                        margin: Ei.only(t: 15 * value)),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
