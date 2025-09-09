part of '../widget.dart';

/// A widget that provides an animated accordion effect, allowing its content
/// to expand and collapse with a smooth animation.
///
/// Typically used to show and hide sections of related content in a vertical list.
///
/// See also:
///
///  * [ExpansionPanel], which provides a similar expandable/collapsible effect.
///  * [AnimatedContainer], which can be used for custom animated transitions.
class AccordionAnimated extends StatefulWidget {
  /// Whether the accordion is expanded and its content is visible.
  final bool show;

  /// The duration of the expand/collapse animation.
  final Duration duration;

  /// The widget to display inside the accordion.
  final Widget child;

  /// The animation curve used for the expand/collapse transition.
  final Curve curve;

  /// A widget that provides an animated accordion effect, allowing its child
  /// widgets to expand and collapse with a smooth animation.
  ///
  /// The [AccordionAnimated] widget is typically used to show and hide content
  /// in a vertical list, such as FAQs or expandable panels, enhancing user
  /// experience with animated transitions.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// AccordionAnimated(
  ///   isOpen: true,
  ///   duration: Duration(milliseconds: 300),
  ///   child: Text('Expandable content'),
  /// )
  /// ```
  ///
  /// See also:
  ///
  /// * [ExpansionPanel], which provides similar functionality in a list.
  /// * [AnimatedContainer], for more general animated size transitions.
  const AccordionAnimated(
      {super.key,
      this.show = false,
      this.duration = const Duration(milliseconds: 250),
      required this.child,
      this.curve = Curves.easeIn});

  @override
  State<AccordionAnimated> createState() => _SlideShowState();
}

class _SlideShowState extends State<AccordionAnimated>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late AnimationController controller;
  late Animation<double> animation;

  void initializeAnimation() {
    controller = AnimationController(
        vsync: this, duration: widget.duration, value: widget.show ? 1 : 0);
    animation = CurvedAnimation(parent: controller, curve: widget.curve);

    // Trigger the appropriate animation state
    if (widget.show) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  void didUpdateWidget(AccordionAnimated oldWidget) {
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
