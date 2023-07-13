part of lazyloading;

T? _ambiguate<T>(T? value) => value;

class LazyLoadingContainer extends StatefulWidget {
  final Widget? indicator;
  final String message;
  final bool? dismissOnTap;
  final Completer<void>? completer;
  final bool animation;
  final bool freeInteract;
  final ToastType type;
  final Position position;

  const LazyLoadingContainer(
      {Key? key,
      this.indicator,
      required this.message,
      this.dismissOnTap,
      this.completer,
      this.animation = true,
      this.freeInteract = false,
      this.type = ToastType.overlay,
      this.position = Position.bottom})
      : super(key: key);

  @override
  LazyLoadingContainerState createState() => LazyLoadingContainerState();
}

class LazyLoadingContainerState extends State<LazyLoadingContainer>
    with SingleTickerProviderStateMixin {
  late String _message;
  late AnimationController animationController;

  // https://docs.flutter.dev/development/tools/sdk/release-notes/release-notes-3.0.0
  bool get isPersistentCallbacks =>
      _ambiguate(SchedulerBinding.instance)!.schedulerPhase ==
      SchedulerPhase.persistentCallbacks;

  // Toast Position
  Map<Position, AlignmentGeometry> positions = {
    Position.top: AlignmentDirectional.topCenter,
    Position.center: AlignmentDirectional.center,
    Position.bottom: AlignmentDirectional.bottomCenter,
  };

  @override
  void initState() {
    super.initState();

    if (!mounted) return;

    _message = widget.message;

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
      _ambiguate(SchedulerBinding.instance)!.addPostFrameCallback((_) =>
          completer
              .complete(animationController.forward(from: animation ? 0 : 1)));
      return completer.future;
    } else {
      return animationController.forward(from: animation ? 0 : 1);
    }
  }

  Future<void> dismiss(bool animation) {
    if (isPersistentCallbacks) {
      Completer completer = Completer();
      _ambiguate(SchedulerBinding.instance)!.addPostFrameCallback((_) =>
          completer
              .complete(animationController.reverse(from: animation ? 1 : 0)));
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
