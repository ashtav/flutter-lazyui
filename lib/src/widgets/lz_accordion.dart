part of widget;

/// LzAccordion is a customizable Flutter widget that creates an accordion-style UI component with expandable content sections. It allows you to specify a list of sections, each with a title and content.
///
/// ```dart
/// LzAccordion(
///   children: [
///     LzAccordionContent(
///       title: 'Section 1',
///       child: Text('Content for Section 1'),
///     ),
///     LzAccordionContent(
///       title: 'Section 2',
///       child: Text('Content for Section 2'),
///     ),
///   ]
/// )
/// ```

/// A widget that creates an accordion-style layout for organizing and displaying content.
///
/// The `LzAccordion` widget allows you to create an accordion-style layout that can expand
/// or collapse its child content panels. It is commonly used for displaying multiple sections
/// of content with the option to expand or collapse each section individually.
///
/// Example usage:
/// ```dart
/// LzAccordion(
///   children: [
///     LzAccordionContent(
///       title: 'Section 1',
///       content: Text('Content for Section 1'),
///     ),
///     LzAccordionContent(
///       title: 'Section 2',
///       content: Text('Content for Section 2'),
///     ),
///     // Add more LzAccordionContent widgets here
///   ],
///   multiple: true, // Allow multiple sections to be expanded at once (optional)
///   initValue: 1, // Initialize with a specific section open (optional)
///   radius: 10.0, // Border radius for section panels (optional)
///   padding: EdgeInsets.all(8.0), // Padding around each section (optional)
///   border: true, // Add borders around section panels (optional)
///   titleEllipsis: true, // Enable ellipsis for long section titles (optional)
///   focusOnExpand: true, // Scroll to expanded section when opened (optional)
/// )
/// ```
class LzAccordion extends StatefulWidget {
  /// The list of child content panels within the accordion.
  final List<LzAccordionContent> children;

  /// Determines whether multiple sections can be expanded at once.
  final bool multiple;

  /// Determines whether borders are added around section panels.
  final bool border;

  /// Determines whether long section titles are truncated with ellipsis.
  final bool titleEllipsis;

  /// Determines whether the view automatically scrolls to the expanded section when opened.
  final bool focusOnExpand;

  /// The index of the initially open section when the accordion is first created.
  final int? initValue;

  /// The border radius for section panels.
  final double? radius;

  /// Padding around each section panel.
  final EdgeInsetsGeometry? padding;

  /// Creates an `LzAccordion` widget.
  ///
  /// The [children] parameter is a list of `LzAccordionContent` widgets that represent
  /// the individual sections within the accordion.
  ///
  /// The [multiple] parameter specifies whether multiple sections can be expanded at once.
  ///
  /// The [initValue] parameter allows you to specify the index of the initially open section
  /// when the accordion is first created.
  ///
  /// The [radius] parameter determines the border radius for section panels (optional).
  ///
  /// The [padding] parameter specifies the padding around each section panel (optional).
  ///
  /// The [border] parameter controls whether borders are added around section panels (optional).
  ///
  /// The [titleEllipsis] parameter enables or disables truncating long section titles with ellipsis (optional).
  ///
  /// The [focusOnExpand] parameter determines whether the view automatically scrolls to the expanded
  /// section when opened (optional).
  const LzAccordion({
    Key? key,
    this.children = const [],
    this.multiple = false,
    this.initValue,
    this.radius,
    this.padding,
    this.border = true,
    this.titleEllipsis = false,
    this.focusOnExpand = true,
  }) : super(key: key);

  @override
  State<LzAccordion> createState() => _LzAccordionState();
}

class _LzAccordionState extends State<LzAccordion>
    with TickerProviderStateMixin {
  List<AnimationController> controllers = [];
  List<Animation<double>> animations = [];
  List<int> actives = [];

  final Tween<double> turnsTween = Tween<double>(
    begin: 1,
    end: 0.25,
  );

  int length = 0;

  void init() {
    length = widget.children.length;

    controllers = List.generate(
        length,
        (i) => AnimationController(
            vsync: this, duration: const Duration(milliseconds: 300)));
    animations = List.generate(
        length,
        (i) => CurvedAnimation(
              parent: controllers[i],
              curve: Curves.fastOutSlowIn,
            ));

    int? index = widget.initValue;

    if (index != null && index > -1 && index < length) {
      actives.add(index);
      controllers[index].forward();
    }
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

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void didUpdateWidget(LzAccordion oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double radius = LazyUi.radius;

    return Container(
      decoration: BoxDecoration(
          border: widget.border ? Br.all() : null,
          borderRadius: Br.radius(widget.radius ?? radius)),
      child: ClipRRect(
        borderRadius: Br.radius(widget.radius ?? radius),
        child: Column(
          crossAxisAlignment: Caa.start,
          mainAxisSize: Mas.min,
          children: List.generate(length, (i) {
            String title = widget.children[i].title;
            final controller = controllers[i];

            final gkey = GlobalKey();

            return Container(
              decoration: BoxDecoration(border: Br.only(['t'], except: i == 0)),
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
                            if (gkey.currentContext != null &&
                                widget.focusOnExpand &&
                                controller.value <= 0) {
                              await Future.delayed(300.ms);
                              Scrollable.ensureVisible(gkey.currentContext!,
                                  duration: 250.ms);
                            }
                          },
                          padding: Ei.all(20),
                          color: Colors.white,
                          border: Br.only([controller.value > .01 ? 'b' : '']),
                          child: Row(
                            mainAxisAlignment: Maa.spaceBetween,
                            children: [
                              Flexible(
                                  child: Textr(
                                title,
                                margin: Ei.only(r: 15),
                                overflow: widget.titleEllipsis
                                    ? Tof.ellipsis
                                    : Tof.visible,
                              )),
                              RotationTransition(
                                  turns: turnsTween.animate(controller),
                                  child: const Icon(La.angleRight,
                                      color: Colors.black38))
                            ],
                          ))),
                  SizeTransition(
                      axisAlignment: 1.0,
                      sizeFactor: animations[i],
                      child: Container(
                        padding: widget.padding ?? Ei.all(20),
                        child: widget.children[i].child,
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

  const LzAccordionContent({required this.title, required this.child});
}
