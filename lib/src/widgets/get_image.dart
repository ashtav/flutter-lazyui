import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lazyui/src/utils/utils.dart';

import '../shortcut.dart';
import 'skeleton.dart';

class GetImage extends StatelessWidget {
  final dynamic image;
  final dynamic size, maxSize;
  final BoxFit fit;
  final double? radius;
  final Color? skeletonColor;
  final EdgeInsetsGeometry? margin;
  const GetImage(this.image, {Key? key, this.size = 100, this.maxSize, this.fit = BoxFit.contain, this.radius, this.skeletonColor, this.margin})
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
          color: Utils.hex('f5f5f5'),
          borderRadius: BorderRadius.circular(radius ?? 0),
        ),
      );
    } else if (image is String && image.contains('http')) {
      widget = CachedNetworkImage(
        fit: fit,
        imageUrl: image,
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return Skeleton(size: size, highlightColor: skeletonColor ?? Colors.black54, radius: radius ?? 10);
        },
        errorWidget: (context, url, error) => const Center(),
      );
    } else if (image is String && isSvg) {
      widget = SvgPicture.asset('assets/images/$image',
          width: size is List ? size[0].toDouble() : size.toDouble(), height: size is List ? size[1].toDouble() : size.toDouble());
    }

    // if path
    else if (image is String && image.split('/').length > 2) {
      widget = Image.file(File(image), fit: fit);
    } else if (image is Uint8List) {
      widget = Image.memory(image, fit: fit);
    } else if (image is File) {
      widget = Image.file(image, fit: fit);
    } else {
      String path = 'assets/images/$image';
      widget = Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(path), fit: fit),
        ),
      );
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: size is List<num> ? size[0]?.toDouble() : size?.toDouble(),
      height: size is List<num> ? size[1]?.toDouble() : size?.toDouble(),
      constraints: maxSize == null
          ? null
          : BoxConstraints(
              minWidth: maxSize is List ? maxSize[0]?.toDouble() : maxSize?.toDouble(),
              minHeight: maxSize is List ? maxSize[1]?.toDouble() : maxSize?.toDouble(),
            ),
      margin: margin,
      child: ClipRRect(borderRadius: Br.radius(radius ?? 0), child: widget),
    );
  }
}
