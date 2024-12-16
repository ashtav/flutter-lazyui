part of '../widget.dart';

/// A customizable avatar widget that displays an image or a default profile placeholder.
///
/// The [LzAvatar] widget allows you to display a user profile image, or fallback to a
/// default asset image when no image is provided. You can customize its size and border radius.
class LzAvatar extends StatelessWidget {
  /// The source of the image to display.
  ///
  /// This can be any image source supported by `LzImage` or `Image.asset`. If [image] is
  /// `null` or an empty string, the widget displays the default `profile.png` asset.
  final dynamic image;

  /// The size (width and height) of the avatar.
  ///
  /// If [size] is not provided, it defaults to `50.0`.
  final double? size;

  /// The radius of the avatar's rounded corners.
  ///
  /// If [radius] is not provided, it uses the default value from `LazyUi.radius`.
  final double? radius;

  /// Creates an [LzAvatar] widget.
  ///
  /// [image], [size], and [radius] are optional parameters.
  const LzAvatar({
    super.key,
    this.image,
    this.size,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    // Set default size and radius if not provided.
    double size = this.size ?? 50;
    double radius = this.radius ?? LazyUi.radius;

    // Display default asset if image is null or empty.
    return ['', null].contains(image)
        ? Image.asset(
            getAsset('profile.png'),
            width: size,
            height: size,
            fit: BoxFit.cover,
          ).lz.clip(all: radius)
        : LzImage(image, size: size, radius: radius);
  }
}
