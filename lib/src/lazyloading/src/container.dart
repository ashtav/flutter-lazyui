import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lazyui/lazyui.dart';

T? _ambiguate<T>(T? value) => value;

class LazyLoadingContainer extends StatefulWidget {
  final Widget? indicator;
  final String message;
  final bool? dismissOnTap;
  final Completer<void>? completer;
  final bool animation;
  final bool freeInteract;
  final ToastType type;
  final LzToastPosition position;

  const LazyLoadingContainer(
      {Key? key,
      this.indicator,
      required this.message,
      this.dismissOnTap,
      this.completer,
      this.animation = true,
      this.freeInteract = false,
      this.type = ToastType.overlay,
      this.position = LzToastPosition.bottom})
      : super(key: key);

  @override
  LazyLoadingContainerState createState() => LazyLoadingContainerState();
}

class LazyLoadingContainerState extends State<LazyLoadingContainer> with SingleTickerProviderStateMixin {
  late String _message;
  Color? _maskColor;
  late AnimationController animationController;
  late bool _dismissOnTap, _ignoring;

  // https://docs.flutter.dev/development/tools/sdk/release-notes/release-notes-3.0.0
  bool get isPersistentCallbacks => _ambiguate(SchedulerBinding.instance)!.schedulerPhase == SchedulerPhase.persistentCallbacks;

  // Toast Position
  Map<LzToastPosition, AlignmentGeometry> positions = {
    LzToastPosition.top: AlignmentDirectional.topCenter,
    LzToastPosition.center: AlignmentDirectional.center,
    LzToastPosition.bottom: AlignmentDirectional.bottomCenter,
  };

  @override
  void initState() {
    super.initState();

    if (!mounted) return;

    _message = widget.message;
    _dismissOnTap = widget.dismissOnTap ?? false;
    _ignoring = _dismissOnTap ? true : false;
    _maskColor = Colors.black.withOpacity(0.5);

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

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

  void _onTap() async {}

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: positions[widget.position]!,
      children: const [
        Text(
          'Hello World',
          style: TextStyle(color: Colors.red),
        )

        // if (widget.type == ToastType.overlay)
        //   AnimatedBuilder(
        //     animation: animationController,
        //     builder: (BuildContext context, Widget? child) {
        //       return Opacity(
        //         opacity: animationController.value,
        //         child: IgnorePointer(
        //           ignoring: _ignoring,
        //           child: _dismissOnTap
        //               ? GestureDetector(
        //                   onTap: _onTap,
        //                   behavior: HitTestBehavior.translucent,
        //                   child: Container(
        //                     width: double.infinity,
        //                     height: double.infinity,
        //                     color: _maskColor,
        //                   ),
        //                 )
        //               : Container(
        //                   width: double.infinity,
        //                   height: double.infinity,
        //                   color: _maskColor,
        //                 ),
        //         ),
        //       );
        //     },
        //   ),

        // // Text Message
        // AnimatedBuilder(
        //   animation: animationController,
        //   builder: (BuildContext context, _) {
        //     // OpacityAnimation(), ScaleAnimation(), OffsetAnimation()
        //     return OpacityAnimation().buildWidget(
        //       _Indicator(
        //         message: _message,
        //         indicator: widget.indicator,
        //         padding: widget.type == ToastType.overlay ? Ei.all(20) : Ei.sym(v: 15, h: 20),
        //       ),
        //       animationController,
        //       positions[widget.position]!,
        //     );
        //   },
        // ),
      ],
    );
  }
}

class _Indicator extends StatelessWidget {
  final Widget? indicator;
  final String message;
  final EdgeInsetsGeometry? padding;

  const _Indicator({
    required this.indicator,
    required this.message,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    // get text style
    TextStyle? style = Theme.of(context).textTheme.bodyMedium;

    return Container(
      margin: Ei.only(b: MediaQuery.of(context).viewInsets.bottom + 50, others: 50),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.9),
        borderRadius: Br.radius(5),
      ),
      padding: padding ?? Ei.all(20),
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
    );
  }
}
