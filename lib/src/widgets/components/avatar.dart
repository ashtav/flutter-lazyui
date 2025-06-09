part of '../widget.dart';

/// A customizable avatar widget that displays an image, icon, or initials.
///
/// The [LzAvatar] widget can be used to represent a user or entity with a visual
/// identifier. It supports generic type [T] for flexibility in handling different
/// data types or models.
///
/// Typically used in user profile screens, lists, or anywhere an avatar is needed.
///
/// Example usage:
///
/// ```dart
/// LzAvatar<User>(
///   // parameters here
/// )
/// ```
class LzAvatar<T> extends StatelessWidget {
  /// The image to display in the avatar. Can be of type [T] or null.
  final T? image;

  /// The size of the avatar. Can be a [double], [Size], or other dynamic value.
  final dynamic size;

  /// The border radius of the avatar. If null, a default value may be used.
  final double? radius;

  /// How the image should be inscribed into the avatar box.
  final BoxFit fit;

  /// How to align the image within the avatar box.
  final Alignment alignment;

  /// Whether the avatar image can be previewed (e.g., tapped to enlarge).
  final bool previewable;

  /// The [BuildContext] to use for previewing or other context-dependent features.
  final BuildContext? context;

  /// The border to draw around the avatar, if any.
  final BoxBorder? border;

  const LzAvatar(
      {super.key,
      this.image,
      this.size,
      this.radius,
      this.fit = BoxFit.cover,
      this.alignment = Alignment.center,
      this.previewable = false,
      this.context,
      this.border});

  @override
  Widget build(BuildContext context) {
    double size = double.parse((this.size ?? 80).toString());
    double radius = size * (this.radius ?? .5);

    Widget imageWidget = LzImage(image ?? _asset(':default_avatar.png'),
        size: size,
        radius: radius,
        fit: fit,
        alignment: alignment,
        previewable: previewable,
        context: context);

    return border == null
        ? imageWidget
        : Container(
            decoration: BoxDecoration(
                borderRadius: Br.radius(radius * 2), border: border),
            child: imageWidget,
          );
  }
}
