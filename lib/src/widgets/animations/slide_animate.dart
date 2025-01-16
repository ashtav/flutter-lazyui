part of '../widget.dart';

class SlideAnimate extends StatefulWidget {
  final bool show;
  final Duration duration;
  final Widget child;

  const SlideAnimate({
    super.key,
    this.show = false,
    this.duration = const Duration(milliseconds: 250),
    required this.child,
  });

  @override
  State<SlideAnimate> createState() => _SlideShowState();
}

class _SlideShowState extends State<SlideAnimate>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late AnimationController controller;
  late Animation<double> animation;

  void initializeAnimation() {
    controller = AnimationController(
        vsync: this, duration: widget.duration, value: widget.show ? 1 : 0);
    animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    // Trigger the appropriate animation state
    if (widget.show) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  void didUpdateWidget(SlideAnimate oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.show != oldWidget.show) {
      // Play the appropriate animation when `show` changes
      if (widget.show) {
        controller.forward();
      } else {
        controller.reverse();
      }
    }

    // Reinitialize the controller if the duration changes
    if (widget.duration != oldWidget.duration) {
      controller.dispose();
      initializeAnimation();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initializeAnimation();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizeTransition(
        axisAlignment: 1.0,
        sizeFactor: animation,
        child: FadeTransition(opacity: animation, child: widget.child));
  }
}
