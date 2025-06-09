part of '../widget.dart';

/// A customizable card widget for displaying content within a material design card.
///
/// The [LzCard] widget provides a convenient way to group related content and actions.
/// It can be used to display information, images, or any custom widget inside a card
/// with optional styling and elevation.
///
/// Typically used in lists, grids, or as standalone elements to highlight content.
///
/// Example usage:
///
/// ```dart
/// LzCard(
///   child: Text('This is a card'),
/// )
/// ```
class LzCard extends StatelessWidget {
  /// The list of child widgets to display inside the card.
  final List<Widget> children;

  /// The background color of the card.
  final Color? color;

  /// The border radius of the card's corners.
  final BorderRadius? radius;

  /// The padding inside the card.
  final EdgeInsetsGeometry? padding;

  /// The border of the card.
  final Border? border;

  /// The gap between child widgets inside the card.
  final double? gap;

  /// The callback function to be called when the card is tapped.
  final void Function()? onTap;

  /// The custom style for the card.
  final LzCardStyle? style;

  /// The alignment of the children along the cross axis.
  final CrossAxisAlignment align;

  const LzCard(
      {super.key,
      this.children = const [],
      this.color,
      this.radius,
      this.padding,
      this.border,
      this.gap,
      this.onTap,
      this.style,
      this.align = CrossAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    final radius = this.radius ?? Br.radius(config.borderRadius);
    Color color =
        this.color ?? (context.isDarkMode ? darkAppbarColor : backgroundColor);

    bool stacked = style?.stacked ?? false;
    bool isTopAlign = style?.stackAlign == StackAlign.top;

    Widget card = Container(
      margin: Ei.only(
          b: stacked && !isTopAlign ? 5 : 0, t: stacked && isTopAlign ? 5 : 0),
      child: Stack(
        children: [
          InkTouch(
            onTap: onTap,
            padding: padding ?? Ei.all(20),
            color: Lz.color.colorToHex(color),
            border: border ?? Br.all(),
            radius: radius,
            child: SizedBox(
                width: double.infinity,
                child: Column(crossAxisAlignment: align, children: children)
                    .gap(gap ?? 2)),
          ),

          // card background icon
          if (style?.child != null)
            Positioned(
              top: style?.iconOffset?.dy ?? 20,
              right: style?.iconOffset?.dx ?? 20,
              child: Transform.rotate(
                      angle: style?.iconAngle ?? .5, child: style?.child!)
                  .lz
                  .ignore(),
            )
        ],
      ).lz.clip(),
    );

    return Stack(
      alignment: isTopAlign ? Ad.topCenter : Ad.bottomCenter,
      children: [
        Container(
          width: context.width * .85,
          height: 10,
          decoration: BoxDecoration(
              border: border ?? Br.all(),
              color: context.isDarkMode
                  ? darkAppbarColor.darken(.3)
                  : 'f9f9f9'.hex,
              borderRadius: radius),
        ),
        card
      ],
    );
  }
}

/// Defines the alignment options for stacked cards.
enum StackAlign {
  /// Aligns the stack to the top.
  top,

  /// Aligns the stack to the bottom.
  bottom
}

/// A style configuration class for customizing the appearance and behavior of an LzCard widget.
///
/// The [LzCardStyle] class allows you to specify whether the card should be stacked,
/// how the stack should be aligned, an optional child widget, and optional icon
/// offset and angle for further customization.
///
/// - [stacked]: Determines if the card should be displayed in a stacked layout. Defaults to `false`.
/// - [stackAlign]: Specifies the alignment of the stack when [stacked] is `true`. Defaults to [StackAlign.bottom].
/// - [child]: An optional widget to display inside the card.
/// - [iconOffset]: An optional offset to position the icon within the card.
/// - [iconAngle]: An optional angle (in radians) to rotate the icon.
class LzCardStyle {
  final bool stacked;
  final StackAlign stackAlign;
  final Widget? child;
  final Offset? iconOffset;
  final double? iconAngle;

  const LzCardStyle(
      {this.stacked = false,
      this.stackAlign = StackAlign.bottom,
      this.child,
      this.iconOffset,
      this.iconAngle});
}
