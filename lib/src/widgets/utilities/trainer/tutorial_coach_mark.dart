// source code: https://github.com/RafaelBarbosatec/tutorial_coach_mark.git
// author: https://github.com/RafaelBarbosatec

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'animations.dart';
import 'controller.dart';
import 'target.dart';

class TutorialCoachMark {
  final List<TargetFocus> targets;
  final void Function()? onFinish;
  final void Function()? onSkip;
  final double paddingFocus;
  final bool useSafeArea;
  final Color colorShadow;
  final double opacityShadow;
  final GlobalKey<TutorialCoachMarkWidgetState> _widgetKey = GlobalKey();
  final Duration duration;
  final ImageFilter? imageFilter;
  final int? initFocus;

  OverlayEntry? _overlayEntry;

  TutorialCoachMark(
      {required this.targets,
      this.colorShadow = Colors.black,
      this.onFinish,
      this.onSkip,
      this.paddingFocus = 10,
      this.useSafeArea = true,
      this.opacityShadow = 0.8,
      this.duration = const Duration(milliseconds: 600),
      this.imageFilter,
      this.initFocus})
      : assert(opacityShadow >= 0 && opacityShadow <= 1);

  OverlayEntry _buildOverlay() {
    return OverlayEntry(
      builder: (context) {
        return TutorialCoachMarkWidget(
            key: _widgetKey,
            targets: targets,
            paddingFocus: paddingFocus,
            onClickSkip: skip,
            useSafeArea: useSafeArea,
            colorShadow: colorShadow,
            opacityShadow: opacityShadow,
            duration: duration,
            finish: finish,
            imageFilter: imageFilter,
            initFocus: initFocus);
      },
    );
  }

  void show(BuildContext context) {
    OverlayState overlay = Overlay.of(context);

    if (_overlayEntry == null) {
      _overlayEntry = _buildOverlay();
      overlay.insert(_overlayEntry!);
    }
  }

  void finish() {
    onFinish?.call();
    _removeOverlay();
  }

  void skip() {
    onSkip?.call();
    _removeOverlay();
  }

  void next() => _widgetKey.currentState?.next();

  void previous() => _widgetKey.currentState?.previous();

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

class TutorialCoachMarkWidget extends StatefulWidget {
  const TutorialCoachMarkWidget(
      {super.key,
      required this.targets,
      this.finish,
      this.paddingFocus = 10,
      this.onClickSkip,
      this.colorShadow = Colors.black,
      this.opacityShadow = 0.8,
      this.useSafeArea = true,
      this.duration,
      this.imageFilter,
      this.initFocus = 0})
      : assert(targets.length > 0);

  final List<TargetFocus> targets;
  final void Function()? finish;
  final Color colorShadow;
  final double opacityShadow;
  final double paddingFocus;
  final void Function()? onClickSkip;
  final bool useSafeArea;
  final Duration? duration;
  final ImageFilter? imageFilter;
  final int? initFocus;

  @override
  TutorialCoachMarkWidgetState createState() => TutorialCoachMarkWidgetState();
}

class TutorialCoachMarkWidgetState extends State<TutorialCoachMarkWidget>
    implements TutorialCoachMarkController {
  final GlobalKey<AnimatedFocusLightState> _focusLightKey = GlobalKey();
  bool showContent = false;
  TargetFocus? currentTarget;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: <Widget>[
          AnimatedFocusLight(
            key: _focusLightKey,
            targets: widget.targets,
            finish: widget.finish,
            paddingFocus: widget.paddingFocus,
            colorShadow: widget.colorShadow,
            opacityShadow: widget.opacityShadow,
            duration: widget.duration,
            imageFilter: widget.imageFilter,
            initFocus: widget.initFocus,
            focus: (target) {
              setState(() {
                currentTarget = target;
                showContent = true;
              });
            },
            removeFocus: () {
              setState(() {
                showContent = false;
              });
            },
          ),
          AnimatedOpacity(
            opacity: showContent ? 1 : 0,
            duration: const Duration(milliseconds: 300),
            child: _buildContents(),
          ),
        ],
      ),
    );
  }

  Widget _buildContents() {
    if (currentTarget == null) {
      return const SizedBox.shrink();
    }

    List<Widget> children = <Widget>[];
    TargetPosition? target;

    try {
      target = getTargetCurrent(currentTarget!);
    } on NotFoundTargetException catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }

    if (target == null) {
      return const SizedBox.shrink();
    }

    var positioned = Offset(
      target.offset.dx + target.size.width / 2,
      target.offset.dy + target.size.height / 2,
    );

    double haloWidth;
    double haloHeight;

    if (currentTarget!.shape == ShapeLightFocus.circle) {
      haloWidth = target.size.width > target.size.height
          ? target.size.width
          : target.size.height;
      haloHeight = haloWidth;
    } else {
      haloWidth = target.size.width;
      haloHeight = target.size.height;
    }

    haloWidth = haloWidth * 0.6 + widget.paddingFocus;
    haloHeight = haloHeight * 0.6 + widget.paddingFocus;

    double width = 0.0;
    double? top;
    double? bottom;
    double? left;
    double? right;

    final ancestorBox = context.findRenderObject() as RenderBox;

    children = currentTarget!.contents!.map<Widget>((i) {
      switch (i.align) {
        case ContentAlign.bottom:
          {
            width = ancestorBox.size.width;
            left = 0;
            top = positioned.dy + haloHeight;
            bottom = null;
          }
          break;
        case ContentAlign.top:
          {
            width = ancestorBox.size.width;
            left = 0;
            top = null;
            bottom = haloHeight + (ancestorBox.size.height - positioned.dy);
          }
          break;
        case ContentAlign.left:
          {
            width = positioned.dx - haloWidth;
            left = 0;
            top = positioned.dy - target!.size.height / 2 - haloHeight;
            bottom = null;
          }
          break;
        case ContentAlign.right:
          {
            left = positioned.dx + haloWidth;
            top = positioned.dy - target!.size.height / 2 - haloHeight;
            bottom = null;
            width = ancestorBox.size.width - left!;
          }
          break;
      }

      return Positioned(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        child: SizedBox(
          width: width,
          child: Padding(
            padding: i.padding,
            child: i.builder.call(context, this),
          ),
        ),
      );
    }).toList();

    return Stack(children: children);
  }

  @override
  void skip() => widget.onClickSkip?.call();

  @override
  void next() => _focusLightKey.currentState?.next();

  @override
  void previous() => _focusLightKey.currentState?.previous();
}
