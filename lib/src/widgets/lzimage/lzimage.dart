import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'utils.dart';

class Dimen {
  final double? w;
  final double? h;
  const Dimen({this.w, this.h});

  static Dimen all(double? value) => Dimen(w: value, h: value);
}

class LzImage<T> extends StatelessWidget {
  final T image;
  final Dimen? size;
  final BoxFit fit;
  final double? radius;
  const LzImage(this.image, {super.key, this.size, this.fit = BoxFit.cover, this.radius});

  @override
  Widget build(BuildContext context) {
    // check image type
    bool isString = image is String;
    bool isUrl = isString && ('$image'.startsWith('http://') || '$image'.startsWith('https://'));
    bool isSvg = '$image'.endsWith('.svg');
    bool isPath = isValidPath('$image');

    bool isFile = image is File;
    bool isUint8List = image is Uint8List;
    bool isImage = image is Image;

    bool isValidImage = isUrl || isSvg || isPath || isFile || isUint8List || isImage;

    // get image size
    double? width = size?.w;
    double? height = size?.h;

    Widget imageWidget = Container(
        width: width, height: height, color: Colors.black12, child: const Center(child: Icon(La.exclamationCircle)));

    Widget skeleton = Skeleton(
      size: [width ?? 50, height ?? 50],
      radius: radius ?? 5,
    );

    // handle image url
    if (isUrl) {
      if (isSvg) {
        imageWidget = SvgPicture.network(image.toString(),
            fit: fit, width: width, height: height, placeholderBuilder: (context) => skeleton);
      } else {
        imageWidget = CachedNetworkImage(
          imageUrl: image.toString(),
          fit: fit,
          width: width,
          height: height,
          progressIndicatorBuilder: (context, url, downloadProgress) => skeleton,
          errorWidget: (context, url, error) => const Center(child: Icon(La.exclamationCircle)),
        );
      }
    }

    return imageWidget.lz.clip(all: radius ?? LazyUi.radius);
  }

  static preview(String image) {}
}
