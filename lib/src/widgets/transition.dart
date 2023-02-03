import 'dart:async';
import 'package:flutter/material.dart';

class ZoomIn extends StatefulWidget {
  final Widget child;
  final int? delay;
  final bool animate;

  const ZoomIn({Key? key, required this.child, this.delay, this.animate = true})
      : super(key: key);

  @override
  State<ZoomIn> createState() => _ZoomInState();
}

class _ZoomInState extends State<ZoomIn> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;
  Timer? timer;

  void init() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
    scaleAnimation =
        CurvedAnimation(parent: controller!, curve: Curves.decelerate);

    if (widget.animate) {
      widget.delay == null
          ? controller?.forward()
          : timer = Timer(Duration(milliseconds: widget.delay!), () {
              controller?.forward();
            });
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    controller?.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.animate
        ? ScaleTransition(scale: scaleAnimation!, child: widget.child)
        : widget.child;
  }
}

class SlideLeft extends StatefulWidget {
  final Widget child;
  final int? delay;
  final double speed;
  final bool animate;

  const SlideLeft(
      {Key? key,
      required this.child,
      this.delay,
      this.speed = 0.50,
      this.animate = true})
      : super(key: key);
  @override
  State<SlideLeft> createState() => _SlideLeftState();
}

class _SlideLeftState extends State<SlideLeft> with TickerProviderStateMixin {
  AnimationController? _animController;
  Animation<Offset>? _animOffset;
  Timer? timer;

  void init() {
    _animController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController!);
    _animOffset =
        Tween<Offset>(begin: Offset(widget.speed, 0.0), end: Offset.zero)
            .animate(curve);

    widget.delay == null
        ? _animController?.forward()
        : timer = Timer(Duration(milliseconds: widget.delay!), () {
            _animController?.forward();
          });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    _animController?.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.animate
        ? FadeTransition(
            opacity: _animController!,
            child: SlideTransition(position: _animOffset!, child: widget.child))
        : widget.child;
  }
}

class SlideRight extends StatefulWidget {
  final Widget child;
  final int? delay;
  final double speed;
  final bool animate;

  const SlideRight(
      {Key? key,
      required this.child,
      this.delay,
      this.speed = 0.50,
      this.animate = true})
      : super(key: key);

  @override
  State<SlideRight> createState() => _SlideRightState();
}

class _SlideRightState extends State<SlideRight> with TickerProviderStateMixin {
  AnimationController? _animController;
  Animation<Offset>? _animOffset;
  Timer? timer;

  void init() {
    _animController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController!);
    _animOffset =
        Tween<Offset>(begin: Offset(-widget.speed, 0.0), end: Offset.zero)
            .animate(curve);

    widget.delay == null
        ? _animController?.forward()
        : timer = Timer(Duration(milliseconds: widget.delay!), () {
            _animController?.forward();
          });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    _animController?.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.animate
        ? FadeTransition(
            opacity: _animController!,
            child: SlideTransition(position: _animOffset!, child: widget.child))
        : widget.child;
  }
}

class SlideUp extends StatefulWidget {
  final Widget child;
  final int? delay;
  final double speed;
  final bool animate;

  const SlideUp(
      {Key? key,
      required this.child,
      this.delay,
      this.speed = 0.50,
      this.animate = true})
      : super(key: key);

  @override
  State<SlideUp> createState() => _SlideUpState();
}

class _SlideUpState extends State<SlideUp> with TickerProviderStateMixin {
  AnimationController? _animController;
  Animation<Offset>? _animOffset;
  Timer? timer;

  void init() {
    _animController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController!);
    _animOffset =
        Tween<Offset>(begin: Offset(0.0, widget.speed), end: Offset.zero)
            .animate(curve);

    widget.delay == null
        ? _animController?.forward()
        : timer = Timer(Duration(milliseconds: widget.delay!), () {
            _animController?.forward();
          });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    _animController?.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.animate
        ? FadeTransition(
            opacity: _animController!,
            child: SlideTransition(
              position: _animOffset!,
              child: widget.child,
            ))
        : widget.child;
  }
}

class SlideDown extends StatefulWidget {
  final Widget child;
  final int? delay;
  final double speed;
  final bool animate;

  const SlideDown(
      {Key? key,
      required this.child,
      this.delay,
      this.speed = 0.50,
      this.animate = true})
      : super(key: key);

  @override
  State<SlideDown> createState() => _SlideDownState();
}

class _SlideDownState extends State<SlideDown> with TickerProviderStateMixin {
  AnimationController? _animController;
  Animation<Offset>? _animOffset;
  Timer? timer;

  void init() {
    _animController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController!);
    _animOffset =
        Tween<Offset>(begin: Offset(0.0, -widget.speed), end: Offset.zero)
            .animate(curve);

    widget.delay == null
        ? _animController?.forward()
        : timer = Timer(Duration(milliseconds: widget.delay!), () {
            _animController?.forward();
          });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    _animController?.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.animate
        ? FadeTransition(
            opacity: _animController!,
            child: SlideTransition(position: _animOffset!, child: widget.child))
        : widget.child;
  }
}
