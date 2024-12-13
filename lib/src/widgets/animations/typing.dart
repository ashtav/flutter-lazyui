part of '../widget.dart';

/// A widget that animates a "typing" effect by displaying a character repeatedly.
///
/// The [TypingAnimate] widget creates an animated typing effect by displaying a character
/// (e.g., dot, underscore) that cycles through a specified number of repetitions, simulating
/// typing or loading.
///
/// * [child]: The main widget to display, typically text or any UI element.
/// * [length]: The number of characters to display in each animation cycle.
/// * [character]: The character to be displayed during the typing effect (default is `.`).
/// * [duration]: The duration of each typing cycle (default is 500 milliseconds).
///
/// Example:
/// ```dart
/// TypingAnimate(
///   child: Text('Loading'),
///   length: 3,
///   character: '.',
///   duration: Duration(milliseconds: 400),
/// );
/// ```
class TypingAnimate extends StatefulWidget {
  /// The widget that will be animated.
  final Widget child;

  /// The number of characters (e.g., dots) to display during the typing animation.
  final int length;

  /// The character to be animated (e.g., dot, underscore, etc.).
  final String character;

  /// The duration for each typing cycle (e.g., how long it takes to complete one cycle of animation).
  final Duration duration;

  /// Add a color parameter to the TypingAnimate widget
  final Color? color;

  /// Creates a [TypingAnimate] widget.
  ///
  /// * [child] is the widget to be displayed alongside the typing animation.
  /// * [length] is the number of animated characters, and [character] is the string used in the animation (e.g., `.` or `_`).
  /// * [duration] controls the speed of the animation.
  const TypingAnimate({
    super.key,
    required this.child,
    this.length = 3,
    this.character = '.',
    this.duration = const Duration(milliseconds: 500),
    this.color,
  });

  @override
  State<TypingAnimate> createState() => _TypingAnimateState();
}

class _TypingAnimateState extends State<TypingAnimate>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  /// Initialize or reinitialize the animation when necessary.
  void _initAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();

    _animation = IntTween(begin: 0, end: widget.length).animate(_controller);
  }

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  @override
  void didUpdateWidget(covariant TypingAnimate oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Reinitialize the animation if the duration or length has changed
    if (oldWidget.duration != widget.duration ||
        oldWidget.length != widget.length) {
      _controller.dispose();
      _initAnimation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        String animatedText = widget.character * _animation.value;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.child,
            Text(animatedText, style: Gfont.color(widget.color ?? lzIconColor)),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
