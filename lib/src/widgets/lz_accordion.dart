part of widget;

class LzAccordion extends StatefulWidget {
  final List<LzAccordionContent> children;
  final int? initValue;
  final bool multiple;
  final bool titleEllipsis;
  final bool scrollToExpanded;
  final Curve? curve;
  final Duration? duration;
  final BoxBorder? border;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? textColor;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final AccordionController? controller;

  const LzAccordion({
    Key? key,
    this.children = const [],
    this.initValue,
    this.multiple = false,
    this.titleEllipsis = false,
    this.scrollToExpanded = true,
    this.curve,
    this.duration,
    this.border,
    this.borderColor,
    this.backgroundColor,
    this.textColor,
    this.radius,
    this.padding,
    this.controller,
  }) : super(key: key);

  @override
  State<LzAccordion> createState() => _LzAccordionState();
}

class _LzAccordionState extends State<LzAccordion> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  // Note: AutomaticKeepAliveClientMixin uses this method to keep the state alive

  List<AnimationController> controllers = [];
  List<Animation<double>> animations = [];
  List<int> actives = [];

  final Tween<double> turnsTween = Tween<double>(
    begin: 1,
    end: 0.25,
  );

  int length = 0;

  void onInitialized() async {
    length = widget.children.length;

    controllers = List.generate(length, (i) {
      bool isExpanded = widget.initValue == i;
      return AnimationController(vsync: this, duration: widget.duration ?? 300.ms, value: isExpanded ? 1 : 0);
    });
    animations = List.generate(
        length,
        (i) => CurvedAnimation(
              parent: controllers[i],
              curve: widget.curve ?? Curves.fastOutSlowIn,
            ));

    Bindings.onRendered(() {
      int? index = widget.initValue;

      if (index != null && index > -1 && index < length) {
        actives.add(index);
        controllers[index].forward();
      }
    });
  }

  void disposeControllers() {
    for (AnimationController e in controllers) {
      e.dispose();
    }
  }

  void onTap(int i) {
    AnimationController controller = controllers[i];

    void setForward() {
      if (!widget.multiple) {
        actives = [];
      }

      actives.add(i);
      controller.forward();
    }

    if (!widget.multiple) {
      // collapse all
      for (AnimationController e in controllers) {
        e.reverse();
      }

      // expand only one child
      if (!actives.contains(i)) {
        return setForward();
      }

      actives.remove(i);
    } else {
      if (!actives.contains(i)) {
        return setForward();
      }

      actives.remove(i);
      controller.reverse();
    }
  }

  void initCallbackController() {
    // set up the controller callback
    widget.controller?.collapseAll = () {
      for (var controller in controllers) {
        controller.reverse();
      }
      setState(() {
        actives.clear();
      });
    };
  }

  @override
  void initState() {
    super.initState();
    onInitialized();
    initCallbackController();
  }

  @override
  void didUpdateWidget(LzAccordion oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.children.length != oldWidget.children.length) {
      // Dispose old controllers to prevent memory leaks
      disposeControllers();

      // Re-initialize controllers and animations with new children
      onInitialized();
    }

    if (widget.controller != oldWidget.controller) {
      initCallbackController();
    }
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    double radius = LazyUi.radius;
    bool isTi = LazyUi.iconType == IconType.tablerIcon;

    Color backgroundColor = widget.backgroundColor ?? Colors.white;
    Color borderColor = widget.borderColor ?? (backgroundColor.isDark() ? backgroundColor.lighten(.7) : Colors.black12);

    return Container(
      decoration: BoxDecoration(
          border: widget.border ?? Br.all(color: widget.borderColor ?? Colors.black12),
          borderRadius: Br.radius(widget.radius ?? radius)),
      child: ClipRRect(
        borderRadius: Br.radius((widget.radius ?? radius) - 1),
        child: Column(
          crossAxisAlignment: Caa.start,
          mainAxisSize: Mas.min,
          children: List.generate(length, (i) {
            String title = widget.children[i].title;
            Widget child = widget.children[i].child;
            Widget? suffix = widget.children[i].suffix;

            final controller = controllers[i];

            final gkey = GlobalKey();

            return Container(
              decoration: BoxDecoration(border: Br.only(['t'], except: i == 0, color: borderColor)),
              child: Column(
                crossAxisAlignment: Caa.start,
                mainAxisSize: Mas.min,
                children: [
                  AnimatedBuilder(
                      animation: controller,
                      builder: (_, __) => InkTouch(
                          key: gkey,
                          onTap: () async {
                            onTap(i);

                            // scroll to this widget
                            if (gkey.currentContext != null && widget.scrollToExpanded && controller.value <= 0) {
                              await Future.delayed(300.ms);
                              Scrollable.ensureVisible(gkey.currentContext!, duration: 250.ms);
                            }
                          },
                          padding: Ei.all(20),
                          color: widget.backgroundColor ?? Colors.white,
                          border: Br.only([controller.value > .01 ? 'b' : ''], color: borderColor),
                          child: Row(
                            mainAxisAlignment: Maa.spaceBetween,
                            children: [
                              Flexible(
                                  child: Textr(
                                title,
                                style: LazyUi.font.copyWith(color: widget.textColor),
                                margin: Ei.only(r: 15),
                                overflow: widget.titleEllipsis ? Tof.ellipsis : Tof.visible,
                              )),
                              suffix ??
                                  RotationTransition(
                                      turns: turnsTween.animate(controller),
                                      child: Icon(isTi ? Ti.chevronRight : La.angleRight,
                                          color: widget.textColor ?? Colors.black38))
                            ],
                          ))),
                  SizeTransition(
                      axisAlignment: 1.0,
                      sizeFactor: animations[i],
                      child: Container(
                        width: context.width,
                        padding: widget.padding ?? Ei.all(20),
                        color: backgroundColor.darken(backgroundColor.isDark() ? .09 : .03),
                        child: child,
                      )),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class LzAccordionContent {
  final String title;
  final Widget child;
  final Widget? suffix;

  const LzAccordionContent({required this.title, required this.child, this.suffix});
}

class AccordionController {
  Function? collapseAll;

  void collapse() {
    if (collapseAll != null) {
      collapseAll!();
    }
  }
}
