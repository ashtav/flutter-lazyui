part of widget;

/// Poslign is a Flutter widget that allows precise control over the positioning and alignment of its child widget within a container.
/// It combines the power of Positioned, IgnorePointer, Align, and Container widgets to achieve this.
///
/// ```dart
/// Poslign(
///   alignment: Alignment.center,
///   child: YourWidget(),
/// )
/// ```

class Poslign extends StatelessWidget {
  final AlignmentGeometry alignment;
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final bool ignoring;
  const Poslign(
      {super.key,
      required this.alignment,
      this.child,
      this.ignoring = false,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: IgnorePointer(
      ignoring: ignoring,
      child: Align(
        alignment: alignment,
        child: Container(
          margin: margin,
          child: child,
        ),
      ),
    ));
  }
}
