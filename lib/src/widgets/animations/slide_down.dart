part of widget;

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