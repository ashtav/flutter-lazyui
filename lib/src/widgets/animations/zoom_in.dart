part of widget;

class ZoomIn extends StatefulWidget {
  final Widget child;
  final int? delay;
  final bool animate;

  const ZoomIn({Key? key, required this.child, this.delay, this.animate = true}) : super(key: key);

  @override
  State<ZoomIn> createState() => _ZoomInState();
}

class _ZoomInState extends State<ZoomIn> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;
  Timer? timer;

  void init() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 250));
    scaleAnimation = CurvedAnimation(parent: controller!, curve: Curves.decelerate);

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
    return widget.animate ? ScaleTransition(scale: scaleAnimation!, child: widget.child) : widget.child;
  }
}
