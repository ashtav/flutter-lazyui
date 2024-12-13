part of '../widget.dart';

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
  final Function(Scroller scroll)? onScroll;

  /// Whether to automatically cache the list height.
  final bool autoCache;

  /// Reverse list view
  final bool reverse;

  /// Optional callback when the list is refreshed.
  final void Function()? onRefresh;

  /// Type of refresh indicator to be displayed.
  final RefrehtorType refreshType;

  /// Style of refresh indicator to be displayed.
  final RefreshtorStyle? refreshStyle;

  /// Gap between items in the list.
  final double? gap;

  /// Create widget
  const LzListView(
      {super.key,
      this.controller,
      this.scrollLimit,
      this.children = const [],
      this.padding,
      this.shrinkWrap = false,
      this.physics,
      this.onScroll,
      this.autoCache = false,
      this.reverse = false,
      this.onRefresh,
      this.refreshType = RefrehtorType.bar,
      this.refreshStyle,
      this.gap});

  @override
  State<LzListView> createState() => _LzListViewState();
}

class _LzListViewState extends State<LzListView> {
  ScrollController controller = ScrollController();
  StreamController<double> streamController = StreamController<double>();

  double previousScrollPosition = 0.0;
  ScrollDirection direction = ScrollDirection.idle;

  void listenToScroll() {
    // detect scroll direction
    double currentScrollPosition = controller.position.pixels;

    if (currentScrollPosition > previousScrollPosition &&
        currentScrollPosition > 0) {
      direction = ScrollDirection.forward;
    } else if (currentScrollPosition < previousScrollPosition &&
        currentScrollPosition >= 0) {
      direction = ScrollDirection.reverse;
    } else {
      direction = ScrollDirection.idle;
    }

    previousScrollPosition = currentScrollPosition;

    // set scroll limitation
    if (widget.scrollLimit != null) {
      final limit = widget.scrollLimit ?? [0, 0];

      if (Utils.scrollHasMax(
          controller, limit.length == 1 ? [limit[0], limit[0]] : limit)) {
        controller.animateTo(controller.position.pixels,
            duration: 250.ms, curve: Curves.easeIn);
      }
    }

    widget.onScroll
        ?.call(Scroller(controller: controller, direction: direction));
  }

  Future onInitials() async {
    controller = widget.controller ?? ScrollController();
    controller.addListener(listenToScroll);

    // render and cache list height
    render();
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
    List<Widget> children = widget.children;
    List<Widget> newChildren = [];

    if (widget.gap != null && children.length > 1) {
      for (int i = 0; i < children.length; i++) {
        newChildren.add(children[i]);
        if (i != children.length - 1) {
          newChildren.add(SizedBox(height: widget.gap!));
        }
      }
    } else {
      newChildren = children;
    }

    Widget listView([double? cacheExtent]) => ListView(
          reverse: widget.reverse,
          physics: widget.physics ?? BounceScroll(),
          controller: controller,
          padding: widget.padding ?? Ei.all(20),
          shrinkWrap: widget.shrinkWrap,
          cacheExtent: cacheExtent,
          children: widget.gap == null ? children : newChildren,
        );

    Widget content({double? cacheExtent}) => widget.onRefresh == null
        ? listView(cacheExtent)
        : Refreshtor(
            onRefresh: () async => widget.onRefresh?.call(),
            type: widget.refreshType,
            style: widget.refreshStyle,
            child: listView(cacheExtent));

    return widget.autoCache
        ? StreamBuilder<double>(
            stream: streamController.stream,
            builder: (BuildContext context, snap) =>
                content(cacheExtent: snap.data))
        : content();
  }
}

/// Utility class for handling scrolling operations with a [ScrollController].
class Scroller {
  /// The scroll controller for the list.
  final ScrollController controller;

  /// The scroll direction.
  final ScrollDirection direction;

  /// Creates a [Scroller] instance with the provided [controller] and [direction].
  Scroller({required this.controller, required this.direction});

  /// Checks if the list is scrolled to the bottom.
  ///
  /// Returns true if the current scroll position plus [offset] is greater than or equal to
  /// the maximum scroll extent of the list.
  bool atBottom([double offset = 0]) {
    return controller.position.pixels + offset >=
        controller.position.maxScrollExtent;
  }

  /// Calculates the opacity value based on the current scroll position.
  ///
  /// The [factor] parameter adjusts the speed of opacity changes. Lower values make opacity change faster.
  ///
  /// Setting [invertOpacity] to true will invert the opacity value.
  /// - When true, the opacity decreases as the scroll position increases.
  /// - When false, the opacity increases as the scroll position increases.
  double getOpacity([double factor = 100, bool invertOpacity = true]) {
    double value = (controller.position.pixels / (factor < 1 ? 1 : factor));
    return (invertOpacity ? (1 - value) : value).clamp(0, 1);
  }

  /// Retrieves the current scroll position in pixels.
  double get pixels => controller.position.pixels;

  /// Retrieves the max scroll position.
  double get max => controller.position.maxScrollExtent;

  /// Calculates the opacity value based on the current scroll position.
  ///
  /// The [factor] parameter adjusts the speed of opacity changes. Lower values make opacity change faster.
  ///
  /// The [type] parameter determines the type of opacity calculation:
  /// - [ScrollOpacity.top01]: Opacity increases from 0 to 1 as you scroll from top to bottom.
  /// - [ScrollOpacity.top10]: Opacity decreases from 1 to 0 as you scroll from top to bottom.
  /// - [ScrollOpacity.bottom01]: Opacity increases from 0 to 1 as you scroll from bottom to top.
  /// - [ScrollOpacity.bottom10]: Opacity decreases from 1 to 0 as you scroll from bottom to top.
  ///
  /// Returns a double value representing the opacity, clamped between 0 and 1.
  ///
  /// Example usage:
  /// ```dart
  /// double opacityValue = scroller.opacity(factor: 50, type: ScrollOpacity.top01);
  /// ```
  ///
  /// [factor] defaults to 100 if not provided.
  /// [type] defaults to [ScrollOpacity.top01] if not provided.
  double opacity(
      [double factor = 100, ScrollOpacity type = ScrollOpacity.top01]) {
    double pixels = controller.position.pixels;
    double value = (pixels / (factor < 1 ? 1 : factor));

    // scroll to top start from 0 - 1
    double scrollTop01 = value.clamp(0, 1);

    // scroll to top start from 1 - 0
    double scrollTop10 = 1 - value.clamp(0, 1);

    // scroll to bottom start from 0 - 1
    double scrollBottom01 = value > 0 ? 0 : value.abs().clamp(0, 1);

    // scroll to bottom start from 1 - 0
    double scrollBottom10 = value > 0 ? 1 : 1 - value.abs().clamp(0, 1);

    final results = {
      ScrollOpacity.top01: scrollTop01,
      ScrollOpacity.top10: scrollTop10,
      ScrollOpacity.bottom01: scrollBottom01,
      ScrollOpacity.bottom10: scrollBottom10,
    };

    return results[type] ?? scrollTop01;
  }
}

/// Enum representing different types of opacity calculations based on the scroll position.
///
/// The [ScrollOpacity] enum defines four types:
/// - [top01]: Opacity increases from 0 to 1 as you scroll from top to bottom.
/// - [top10]: Opacity decreases from 1 to 0 as you scroll from top to bottom.
/// - [bottom01]: Opacity increases from 0 to 1 as you scroll from bottom to top.
/// - [bottom10]: Opacity decreases from 1 to 0 as you scroll from bottom to top.
enum ScrollOpacity {
  /// Opacity increases from 0 to 1 as you scroll from top to bottom.
  top01,

  /// Opacity decreases from 1 to 0 as you scroll from top to bottom.
  top10,

  /// Opacity increases from 0 to 1 as you scroll from bottom to top.
  bottom01,

  /// Opacity decreases from 1 to 0 as you scroll from bottom to top.
  bottom10
}
