part of '../widget.dart';

/// A widget that displays a list of collapsible panels, allowing users to expand or collapse content sections.
class LzAccordion extends StatefulWidget {
  /// The list of accordion panels.
  final List<LzAccordionContent> children;

  /// The index of the panel to be initially expanded.
  final List<int> initValues;

  /// Determines if multiple panels can be expanded simultaneously.
  final bool multiple;

  /// Determines if the title text should be truncated with an ellipsis when it overflows.
  final bool titleEllipsis;

  /// Determines if the view should scroll to the expanded panel when it's opened.
  final bool scrollToExpanded;

  /// The curve of the animation when expanding or collapsing panels.
  final Curve? curve;

  /// The duration of the animation when expanding or collapsing panels.
  final Duration? duration;

  /// The border of the accordion.
  final BoxBorder? border;

  /// The color of the accordion border.
  final Color? borderColor;

  /// The background color of the accordion.
  final Color? backgroundColor;

  /// The text color used for titles and content.
  final Color? textColor;

  /// The radius of the accordion corners.
  final double? radius;

  /// The padding around the accordion.
  final EdgeInsetsGeometry? padding;

  /// Manages the state of the accordion, allowing programmatic control.
  final AccordionController? controller;

  /// Callback triggered when a section in the accordion is expanded or collapsed.
  /// [i] is the index of the toggled section.
  final void Function(int i)? onExpand;

  /// Specifies chunk sizes for grouping accordion sections.
  final List<int> chunk;

  /// The spacing between chunks in the accordion.
  final double chunkSpace;

  /// Creates an [LzAccordion] widget.
  ///
  /// The [children] parameter is required and must not be null.

  const LzAccordion(
      {super.key,
      this.children = const [],
      this.initValues = const [],
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
      this.onExpand,
      this.chunk = const [],
      this.chunkSpace = 10});

  @override
  State<LzAccordion> createState() => _LzAccordionState();
}

class _LzAccordionState extends State<LzAccordion>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
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
      bool isExpanded = widget.initValues.contains(i);
      return AnimationController(
          vsync: this,
          duration: widget.duration ?? 300.ms,
          value: isExpanded ? 1 : 0);
    });
    animations = List.generate(
        length,
        (i) => CurvedAnimation(
              parent: controllers[i],
              curve: widget.curve ?? Curves.fastOutSlowIn,
            ));

    Bindings.onRendered(() {
      for (var index in widget.initValues) {
        if (index > -1 && index < length) {
          actives.add(index);
          controllers[index].forward();
        }
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
    widget.onExpand?.call(i);

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
    bool isTabler = LazyUi.iconType == IconType.tabler;
    bool isHuge = LazyUi.iconType == IconType.huge;

    Color backgroundColor = widget.backgroundColor ?? lzBackgroundColor;
    Color borderColor = widget.borderColor ??
        (backgroundColor.isDark()
            ? backgroundColor.lighten(.1)
            : lzBorderColor);
    int currentIndex = 0;

    // accordion widget
    Widget accordion(List<LzAccordionContent> children, {int from = 0}) =>
        Container(
          decoration: BoxDecoration(
              border: widget.border ??
                  Br.all(color: widget.borderColor ?? lzBorderColor),
              borderRadius: Br.radius(widget.radius ?? radius)),
          child: ClipRRect(
            borderRadius: Br.radius((widget.radius ?? radius) - 1),
            child: Column(
              crossAxisAlignment: Caa.start,
              mainAxisSize: Mas.min,
              children: children.generate((item, i) {
                String title = item.title;
                Widget child = item.child;
                Widget? suffix = item.suffix;

                int index = currentIndex++;
                final controller = controllers[index];

                final gkey = GlobalKey();

                return Container(
                  decoration: BoxDecoration(
                      border:
                          Br.only(['t'], except: i == 0, color: borderColor)),
                  child: Column(
                    crossAxisAlignment: Caa.start,
                    mainAxisSize: Mas.min,
                    children: [
                      AnimatedBuilder(
                          animation: controller,
                          builder: (_, __) => InkTouch(
                              key: gkey,
                              onTap: () async {
                                onTap(index);

                                // scroll to this widget
                                if (gkey.currentContext != null &&
                                    widget.scrollToExpanded &&
                                    controller.value <= 0) {
                                  await Future.delayed(300.ms);
                                  Scrollable.ensureVisible(gkey.currentContext!,
                                      duration: 250.ms);
                                }
                              },
                              padding: Ei.all(20),
                              color:
                                  widget.backgroundColor ?? lzBackgroundColor,
                              border: Br.only(
                                  [controller.value > .01 ? 'b' : ''],
                                  color: borderColor),
                              child: Row(
                                mainAxisAlignment: Maa.spaceBetween,
                                children: [
                                  Flexible(
                                      child: Textr(
                                    title,
                                    style: LazyUi.font
                                        .copyWith(color: widget.textColor),
                                    margin: Ei.only(r: 15),
                                    overflow: widget.titleEllipsis
                                        ? Tof.ellipsis
                                        : Tof.visible,
                                  )),
                                  suffix ??
                                      RotationTransition(
                                          turns: turnsTween.animate(controller),
                                          child: Icon(
                                              isTabler
                                                  ? Ti.chevronRight
                                                  : isHuge
                                                      ? Hi.arrowRight01
                                                      : La.angleRight,
                                              color: Colors
                                                  .black45.adaptWithTheme))
                                ],
                              ))),

                      // expanded or collapsed content
                      SizeTransition(
                          axisAlignment: 1.0,
                          sizeFactor: animations[index],
                          child: Container(
                            width: context.width,
                            padding: widget.padding ?? Ei.all(20),
                            color: backgroundColor
                                .darken(backgroundColor.isDark() ? .09 : .03),
                            child: child,
                          )),
                    ],
                  ),
                );
              }),
            ),
          ),
        );

    if (widget.chunk.isNotEmpty) {
      List<List<LzAccordionContent>> children =
          widget.children.chunk(widget.chunk);

      return Column(
        children: children.generate((data, i) {
          return Container(
              margin: Ei.only(t: i == 0 ? 0 : widget.chunkSpace),
              child: accordion(data, from: (i + 1)));
        }),
      );
    }

    return accordion(widget.children);
  }
}

/// Represents content for an accordion widget, consisting of a [title], [child], and optional [suffix].
class LzAccordionContent {
  /// The title of the accordion content.
  final String title;

  /// The main child widget to be displayed when the accordion is expanded.
  final Widget child;

  /// Optional widget to display as a suffix after the main child.
  final Widget? suffix;

  /// Creates a new instance of [LzAccordionContent].
  ///
  /// [title]: The title of the accordion content.
  /// [child]: The main child widget to display.
  /// [suffix]: Optional widget to display as a suffix after the main child.
  const LzAccordionContent({
    required this.title,
    required this.child,
    this.suffix,
  });
}

/// Controller class for managing accordions, providing methods to control their state.
class AccordionController {
  /// Function to collapse all accordions managed by this controller.
  Function? collapseAll;

  /// Collapses all accordions.
  void collapse() {
    if (collapseAll != null) {
      collapseAll!();
    }
  }
}
