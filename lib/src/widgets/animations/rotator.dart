part of widget;

class Rotator extends StatefulWidget {
  final Widget child;
  final int degree;
  final Duration duration;

  const Rotator({super.key, required this.child, this.degree = 0, this.duration = const Duration(milliseconds: 150)});

  @override
  State<Rotator> createState() => _RotatorState();
}

class _RotatorState extends State<Rotator> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: widget.duration, vsync: this);
    animation = Tween<double>(begin: 0, end: _degreeToRadian(widget.degree)).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  void didUpdateWidget(Rotator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.degree != widget.degree || oldWidget.duration != widget.duration) {
      controller.duration = widget.duration;
      animation = Tween<double>(begin: animation.value, end: _degreeToRadian(widget.degree)).animate(controller)
        ..addListener(() {
          setState(() {});
        });
      controller
        ..reset()
        ..forward();
    }
  }

  double _degreeToRadian(int degree) {
    return degree * pi / 180;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: animation.value,
      child: widget.child,
    );
  }
}
