part of '../widget.dart';

class LzAvatar<T> extends StatelessWidget {
  final T? image;
  final dynamic size;
  final double? radius;
  final BoxFit fit;
  final Alignment alignment;
  final bool previewable;
  final BuildContext? context;
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
