part of '../widget.dart';

/// A widget that sizes its child to its intrinsic size, optionally allowing it to expand in a specific axis.
///
/// This widget arranges its [children] in the specified [axis] (either horizontal or vertical),
/// and can add spacing between expanded child widgets using a [gap] or custom [spacer] widget.
///
/// - If [gap] is provided, it will create a space of that dimension (width for horizontal axis,
///   height for vertical) between each expanded child.
/// - If [spacer] is provided, that widget will be placed between each expanded child instead
///   of a [gap], allowing for a customized spacer appearance or functionality.
///
/// The main usage of [Intrinsic] is for laying out child widgets with intrinsic sizes,
/// which optionally expand along a specific axis and have controlled spacing between them.
///
/// [children] is a required parameter that lists the widgets to be laid out.
/// [axis] defines the direction of layout, defaulting to [Axis.horizontal].
/// [gap] defines spacing between expanded child widgets when no [spacer] is provided.
/// [spacer] can be a custom widget to use as space between children, taking precedence over [gap].
class Intrinsic extends StatelessWidget {
  /// The list of children to be laid out.
  final List<Widget> children;

  /// The axis along which the child should be sized.
  final Axis axis;

  /// Adds space between expanded child widgets.
  final double? gap;

  /// A custom widget to be placed between expanded child widgets.
  final Widget? spacer;

  /// Example:
  ///
  /// ```dart
  /// Intrinsic(
  ///   spacer: Container(width: .7, height: 20, color: Colors.black26),
  ///   children: ['Unpaid', 'Paid', 'Cancelled'].generate((label, i) {
  ///     return InkTouch(
  ///       onTap: () {},
  ///       padding: Ei.sym(v: 13, h: 20),
  ///       color: Colors.white,
  ///       child: Text(label, textAlign: Ta.center),
  ///     );
  ///   }),
  /// ),
  /// ```
  ///
  /// ```dart
  /// SizedBox(
  ///   height: 200,
  ///   child: Intrinsic(
  ///     axis: Axis.vertical,
  ///     spacer: Container(height: .4, width: context.width, color: Colors.black26),
  ///     children: ['Unpaid', 'Paid', 'Cancelled'].generate((label, i) {
  ///       return InkTouch(
  ///         padding: Ei.sym(v: 13, h: 20),
  ///         color: Colors.white,
  ///         child: Center(child: Textr(label, textAlign: Ta.center, width: context.width)),
  ///       );
  ///     }),
  ///   ),
  /// ),
  /// ```
  const Intrinsic({
    super.key,
    required this.children,
    this.axis = Axis.horizontal,
    this.gap,
    this.spacer,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = this.children;

    for (int i = 0; i < children.length; i++) {
      if (i % 2 == 1 && (gap != null || spacer != null)) {
        children.insert(
            i,
            _Spacer(SizedBox(
                width: gap, child: Center(child: spacer ?? const None()))));
      }
    }

    if (axis == Axis.horizontal) {
      return IntrinsicHeight(
        child: Row(
          children: children.generate((widget, i) {
            return widget is _Spacer
                ? children[i]
                : Expanded(child: children[i]);
          }),
        ),
      );
    }

    return IntrinsicHeight(
      child: Column(
        children: children.generate((widget, i) {
          return widget is _Spacer ? children[i] : Expanded(child: children[i]);
        }),
      ),
    );
  }
}

class _Spacer extends StatelessWidget {
  final Widget child;
  const _Spacer(this.child);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
