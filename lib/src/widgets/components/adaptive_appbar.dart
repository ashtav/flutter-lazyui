part of '../widget.dart';

/// A customizable adaptive app bar that adjusts its appearance based on opacity.
///
/// This widget allows you to create an `AppBar` with dynamic opacity, optional leading icons,
/// and action buttons. It blends the scaffold's background color with white based on the opacity value.
///
/// The `appBar` extension allows easy integration into `Scaffold.appBar`.
class AdaptiveAppbar extends StatelessWidget {
  /// The title of the app bar.
  final String? title;

  /// The opacity level of the app bar, blending between the scaffold background and white.
  /// Range: `0.0` (fully transparent) to `1.0` (fully white).
  final double opacity;

  /// An optional leading icon button, typically for navigation.
  final IconData? leadingIcon;

  /// A list of action widgets to be displayed on the right side of the app bar.
  final List<Widget> actions;

  /// Example usage:
  /// ```dart
  /// AdaptiveAppbar(
  ///   title: 'Title',
  ///   opacity: 0.5,
  ///   leadingIcon: Icons.arrow_back,
  ///   actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
  /// ).appBar
  /// ```
  const AdaptiveAppbar({
    super.key,
    this.title,
    this.opacity = 0,
    this.leadingIcon,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    final color = Color.lerp(context.scaffoldColor, Colors.white, opacity);

    return AppBar(
      title: Text(title ?? ''),
      leading: leadingIcon == null
          ? null
          : IconButton(
              onPressed: () {
                context.lz.pop();
              },
              icon: Icon(leadingIcon, size: 20),
            ),
      elevation: 0,
      shadowColor: color,
      surfaceTintColor: color,
      backgroundColor: color,
      shape:
          opacity <= 0 ? Br.none : Br.only(['b'], width: opacity.clamp(0, .5)),
      actions: actions,
    );
  }
}

/// Extension to easily convert any widget into a `PreferredSizeWidget` for use as an `AppBar`.
extension PreferredSizeWidgetExtension on Widget {
  /// Wraps the widget in a `PreferredSizeWidget` with a standard app bar height.
  PreferredSizeWidget get appBar => PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight), child: this);
}
