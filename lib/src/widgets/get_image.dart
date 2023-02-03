import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mixins/mixins.dart';

import 'skeleton.dart';

class GetImage extends StatelessWidget {
  final dynamic image;
  final dynamic size;
  final BoxFit fit;
  final double? borderRadius, skeletonRadius;
  final Color? skeletonColor;
  final EdgeInsetsGeometry? margin;
  final String? path;
  const GetImage(this.image,
      {Key? key,
      this.size = 100,
      this.fit = BoxFit.contain,
      this.borderRadius,
      this.skeletonRadius,
      this.skeletonColor,
      this.path = 'assets/images',
      this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic image = this.image ?? '';
    image = image == 'null' ? '' : image;

    bool isSvg = image is String && image.split('.').last.toLowerCase() == 'svg';
    Widget? widget;

    if (image is String && image.toString().isEmpty) {
      widget = Container(
        decoration: BoxDecoration(
          color: Mixins.hex('f5f5f5'),
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
      );
    } else if (image is String && image.contains('http')) {
      // image is a url
      widget = ClipRRect(
        borderRadius: Br.radius(borderRadius ?? 0),
        child: CachedNetworkImage(
          fit: fit,
          imageUrl: image,
          progressIndicatorBuilder: (context, url, downloadProgress) {
            return Skeleton(size: size, highlightColor: skeletonColor ?? Colors.black54, radius: skeletonRadius ?? 10);
          },
          errorWidget: (context, url, error) => const Center(),
        ),
      );
    } else if (image is String && isSvg) {
      widget = SvgPicture.asset('$path/$image',
          width: size is List ? size[0].toDouble() : size.toDouble(), height: size is List ? size[1].toDouble() : size.toDouble());
    } else if (image is String && image.split('/').length > 2) {
      // image is a path
      widget = ClipRRect(
        borderRadius: Br.radius(borderRadius ?? 0),
        child: Image.file(File(image), fit: fit),
      );
    } else if (image is Uint8List) {
      // image is a Uint8List
      widget = ClipRRect(
        borderRadius: Br.radius(borderRadius ?? 0),
        child: Image.memory(image, fit: fit),
      );
    } else if (image is File) {
      // image is a File
      widget = ClipRRect(
        borderRadius: Br.radius(borderRadius ?? 0),
        child: Image.file(image, fit: fit),
      );
    } else {
      // image is an asset
      String assetName = '$path/$image';

      widget = ClipRRect(
        borderRadius: Br.radius(borderRadius ?? 0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(assetName), fit: fit),
          ),
        ),
      );
    }

    return Container(
      width: size is List ? size[0]?.toDouble() : size?.toDouble(),
      height: size is List ? size[1]?.toDouble() : size?.toDouble(),
      margin: margin,
      child: widget,
    );
  }
}
