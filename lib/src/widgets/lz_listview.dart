part of widget;

// `LzListView` is a versatile Flutter widget that simplifies the creation of scrollable lists with various features such as scroll limits, custom scroll controllers, and automatic caching.
///
/// It allows you to quickly create scrollable lists of child widgets and provides options for customizing the scrolling behavior and appearance.
///
/// Example usage:
/// ```dart
/// LzListView(
///   controller: myScrollController, // Optional custom ScrollController.
///   scrollLimit: [100.0, 500.0], // Optional scroll limits to restrict scrolling within a range.
///   children: [Widget1(), Widget2(), ...], // List of child widgets.
///   padding: EdgeInsets.all(16.0), // Optional padding around the list.
///   shrinkWrap: false, // Whether the list should shrink-wrap its children.
///   physics: BounceScroll(), // Custom scroll physics, defaults to BounceScroll.
///   onScroll: (controller) {
///     // Callback when the list is scrolled.
///   },
///   autoCache: true, // Whether to automatically cache the list height.
/// )
/// ```
class LzListView extends StatefulWidget {
  /// Optional scroll limits to restrict scrolling within a range.
  final List<double>? scrollLimit;

  /// Optional custom ScrollController.
  final ScrollController? controller;

  /// List of child widgets.
  final List<Widget> children;

  /// Optional padding around the list.
  final EdgeInsetsGeometry? padding;

  /// Whether the list should shrink-wrap its children.
  final bool shrinkWrap;

  /// Custom scroll physics, defaults to BounceScroll.
  final ScrollPhysics? physics;

  /// Callback when the list is scrolled.
  final Function(ScrollController controller)? onScroll;

  /// Whether to automatically cache the list height.
  final bool autoCache;

  const LzListView(
      {super.key,
      this.controller,
      this.scrollLimit,
      this.children = const [],
      this.padding,
      this.shrinkWrap = false,
      this.physics,
      this.onScroll,
      this.autoCache = false});

  @override
  State<LzListView> createState() => _LzListViewState();
}

class _LzListViewState extends State<LzListView> {
  ScrollController controller = ScrollController();
  StreamController<double> streamController = StreamController<double>();

  void listenToScroll() {
    if (widget.scrollLimit != null) {
      final limit = widget.scrollLimit ?? [0, 0];

      if (Utils.scrollHasMax(
          controller, limit.length == 1 ? [limit[0], limit[0]] : limit)) {
        controller.animateTo(controller.position.pixels,
            duration: 250.ms, curve: Curves.easeIn);
      }
    }

    widget.onScroll?.call(controller);
  }

  Future onInitials() async {
    controller = widget.controller ?? ScrollController();
    controller.addListener(listenToScroll);
  }

  Future render() async {
    if (widget.autoCache) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        RenderBox box = context.findRenderObject() as RenderBox;
        double height = (box.size.height * 3);
        streamController.sink.add(height);
      });
    }
  }

  @override
  void initState() {
    onInitials();
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(listenToScroll);
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double spacing = LazyUi.space;

    Widget content({double? cacheExtent}) => ListView(
          physics: widget.physics ?? BounceScroll(),
          controller: controller,
          padding: widget.padding ?? Ei.all(spacing),
          shrinkWrap: widget.shrinkWrap,
          cacheExtent: cacheExtent,
          children: widget.children,
        );

    return widget.autoCache
        ? StreamBuilder<double>(
            stream: streamController.stream,
            builder: (BuildContext context, snap) =>
                content(cacheExtent: snap.data))
        : content();
  }
}
