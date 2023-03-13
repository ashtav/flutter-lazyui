import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lazyui/lazyui.dart';
import 'animations/opacity_animation.dart';

T? _ambiguate<T>(T? value) => value;

class LazyLoadingContainer extends StatefulWidget {
  final Widget? indicator;
  final String message;
  final bool? dismissOnTap;
  final Completer<void>? completer;
  final bool animation;
  final bool freeInteract;

  const LazyLoadingContainer(
      {Key? key, this.indicator, required this.message, this.dismissOnTap, this.completer, this.animation = true, this.freeInteract = false})
      : super(key: key);

  @override
  LazyLoadingContainerState createState() => LazyLoadingContainerState();
}

class LazyLoadingContainerState extends State<LazyLoadingContainer> with SingleTickerProviderStateMixin {
  late String _message;
  Color? _maskColor;
  late AnimationController animationController;
  late AlignmentGeometry _alignment;
  late bool _dismissOnTap, _ignoring;

  // https://docs.flutter.dev/development/tools/sdk/release-notes/release-notes-3.0.0
  bool get isPersistentCallbacks => _ambiguate(SchedulerBinding.instance)!.schedulerPhase == SchedulerPhase.persistentCallbacks;

  @override
  void initState() {
    super.initState();

    if (!mounted) return;

    _message = widget.message;
    _alignment = AlignmentDirectional.center;
    _dismissOnTap = widget.dismissOnTap ?? false;
    _ignoring = _dismissOnTap ? false : true;
    _maskColor = Colors.black.withOpacity(0.5);

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    // ..addStatusListener((status) {
    //     bool isCompleted = widget.completer?.isCompleted ?? false;
    //     if (status == AnimationStatus.completed && !isCompleted) {
    //       widget.completer?.complete();
    //     }
    //   });

    show(widget.animation);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Future<void> show(bool animation) {
    if (isPersistentCallbacks) {
      Completer completer = Completer();
      _ambiguate(SchedulerBinding.instance)!.addPostFrameCallback((_) => completer.complete(animationController.forward(from: animation ? 0 : 1)));
      return completer.future;
    } else {
      return animationController.forward(from: animation ? 0 : 1);
    }
  }

  Future<void> dismiss(bool animation) {
    if (isPersistentCallbacks) {
      Completer completer = Completer();
      _ambiguate(SchedulerBinding.instance)!.addPostFrameCallback((_) => completer.complete(animationController.reverse(from: animation ? 1 : 0)));
      return completer.future;
    } else {
      return animationController.reverse(from: animation ? 1 : 0);
    }
  }

  void updateStatus(String status) {
    if (_message == status) return;
    setState(() {
      _message = status;
    });
  }

  void _onTap() async {
    if (_dismissOnTap) await LazyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: _alignment,
      children: <Widget>[
        AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: animationController.value,
              child: IgnorePointer(
                ignoring: _ignoring,
                child: _dismissOnTap
                    ? GestureDetector(
                        onTap: _onTap,
                        behavior: HitTestBehavior.translucent,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: _maskColor,
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: _maskColor,
                      ),
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, _) {
            // OpacityAnimation(), ScaleAnimation(), OffsetAnimation()
            return OpacityAnimation().buildWidget(
              _Indicator(
                message: _message,
                indicator: widget.indicator,
              ),
              animationController,
              _alignment,
            );
          },
        ),
      ],
    );
  }
}

class _Indicator extends StatelessWidget {
  final Widget? indicator;
  final String message;

  const _Indicator({
    required this.indicator,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    // get text style
    TextStyle? style = Theme.of(context).textTheme.bodyMedium;

    return Container(
      margin: Ei.only(b: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        margin: Ei.all(50),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.9),
          borderRadius: Br.radius(5),
        ),
        padding: Ei.all(20),
        child: Column(
          mainAxisAlignment: Maa.center,
          crossAxisAlignment: Caa.center,
          mainAxisSize: Mas.min,
          children: [
            indicator?.margin(b: 15) ?? const None(),
            Text(
              message,
              style: style?.copyWith(color: Colors.white),
              textAlign: Ta.center,
            ),
          ],
        ),
      ),
    );
  }
}
