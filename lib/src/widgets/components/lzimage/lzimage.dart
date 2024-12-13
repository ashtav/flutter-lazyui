import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'lzimage_preview.dart';
import 'utils.dart';

/// A widget for displaying an image.
class LzImage<T> extends StatelessWidget {
  /// The image to be displayed.
  final T image;

  /// The size of the image.
  final dynamic size;

  /// How the image should be inscribed into the box.
  final BoxFit fit;

  /// The radius of the image corners.
  final double? radius;

  /// The alignment of the image within its container.
  final Alignment alignment;

  /// Whether the image is interactive, allowing user interaction.
  final bool interactive;

  /// A placeholder widget to be displayed while the image is loading.
  final Widget? placeholder;

  /// A widget to be displayed if the image fails to load.
  final Widget? errorWidget;

  /// Size duration
  final Duration? sizeChangeDuration;

  /// Creates a container that animates its parameters implicitly.
  final Curve curve;

  /// The [context] parameter provides access to the current [BuildContext]
  final BuildContext? context;

  /// Creates a LzImage widget.
  const LzImage(this.image,
      {super.key,
      this.size,
      this.fit = BoxFit.cover,
      this.radius,
      this.alignment = Alignment.center,
      this.interactive = false,
      this.placeholder,
      this.errorWidget,
      this.sizeChangeDuration,
      this.curve = Curves.linear,
      this.context});

  @override
  Widget build(BuildContext context) {
    // check image type
    bool isString = image is String;
    bool isUrl = isString &&
        ('$image'.startsWith('http://') || '$image'.startsWith('https://'));
    bool isSvg = '$image'.endsWith('.svg');
    bool isPath = isValidPath('$image');

    bool isFile = image is File;
    bool isUint8List = image is Uint8List;
    bool isImage = image is Image;

    bool isValidImage = true;

    // logg('isPath: $isPath, isFile: $isFile');

    // get image size
    double? width = _getImageSize(size, 'width');
    double? height = _getImageSize(size, 'height');

    Widget placeholder = this.placeholder ??
        Skeleton(
          size: [width ?? 50, height ?? 50],
          radius: radius ?? 5,
        );

    Widget errorWidget = Container(
        width: width,
        height: height,
        color: Colors.black12,
        child: this.errorWidget ??
            const Center(child: Icon(La.exclamationCircle)));

    Widget imageWidget = this.image == null
        ? errorWidget
        : Container(
            width: width,
            height: height,
            color: Colors.black12,
            child: const Center(child: Icon(La.exclamationCircle)));

    // handle image url
    if (isString) {
      String image = this.image as String;

      if (image.trim().isEmpty) {
        imageWidget = errorWidget;
        isValidImage = false;
      }

      // Url
      // This section determines how the image should be loaded based on its url
      // It can be an svg or an image
      if (isUrl) {
        if (isSvg) {
          imageWidget = SvgPicture.network(image,
              fit: fit,
              width: width,
              height: height,
              alignment: alignment,
              placeholderBuilder: (context) => placeholder);
        } else {
          imageWidget = CachedNetworkImage(
            imageUrl: image,
            fit: fit,
            width: width,
            height: height,
            alignment: alignment,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                placeholder,
            errorWidget: (context, url, error) => errorWidget,
          );
        }
      }

      // Path
      // This section determines how the image should be loaded based on its path
      // It can be an asset or a file path
      else if (isPath) {
        bool isAsset = image.startsWith('assets/');
        bool isFileNameOnly = !image.contains('/');

        if (isAsset || isFileNameOnly || !image.startsWith('/')) {
          if (isFileNameOnly || !image.startsWith('/')) {
            image = 'assets/images/$image';
          }

          if (isSvg) {
            imageWidget = SvgPicture.asset(image,
                fit: fit,
                width: width,
                height: height,
                alignment: alignment,
                placeholderBuilder: (_) => placeholder);
          } else {
            imageWidget = Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image),
                    fit: fit,
                    alignment: alignment,
                    onError: (e, s) => errorWidget),
              ),
            );
          }
        } else {
          imageWidget = Image.file(File(image),
              fit: fit,
              width: width,
              height: height,
              alignment: alignment,
              errorBuilder: (_, e, s) => errorWidget);
        }
      }
    }

    // File
    // This section determines how the image should be loaded based on its type
    else if (isFile) {
      imageWidget = Image.file(image as File,
          fit: fit,
          width: width,
          height: height,
          alignment: alignment,
          errorBuilder: (_, e, s) => errorWidget);
    }

    // Uint8List
    // This section determines how the image should be loaded based on its type
    else if (isUint8List) {
      imageWidget = Image.memory(image as Uint8List,
          fit: fit,
          width: width,
          height: height,
          alignment: alignment,
          frameBuilder: (context, _, __, ___) => placeholder,
          errorBuilder: (_, e, s) => errorWidget);
    }

    // Image
    else if (isImage) {
      imageWidget = image as Image;
    }

    imageWidget = imageWidget.lz.clip(all: radius ?? LazyUi.radius);

    // if interactive, image can be previewed by tapping on it
    if (interactive && isValidImage) {
      final tag =
          '${DateTime.now().microsecondsSinceEpoch}_${Random().nextInt(10000)}';
      return Hero(
          tag: tag,
          child: imageWidget.onTap(() {
            Navigator.push(this.context ?? context,
                MaterialPageRoute(builder: (context) {
              return LzImageViewer(image, tag: tag);
            }));
          }));
    }

    return sizeChangeDuration != null
        ? AnimatedContainer(
            duration: sizeChangeDuration!,
            curve: curve,
            width: width,
            height: height,
            child: imageWidget)
        : imageWidget;
  }
}

double? _getImageSize(dynamic size, String type) {
  if (size == null) {
    return null;
  }

  num result = 0;

  if (size is num || size is List<num?>) {
    if (type == 'width') {
      if (size is num) {
        result = size;
      } else {
        size as List;

        if (size.isNotEmpty && size[0] == null) {
          return null;
        }

        result = size.isNotEmpty ? size[0] : 0;
      }
    }

    // height
    else {
      if (size is num) {
        result = size;
      } else {
        size as List;

        if (size.length > 1 && size[1] == null) {
          return null;
        }

        result = size.length > 1
            ? size[1]
            : size.length == 1
                ? size[0]
                : 0;
      }
    }
  } else {
    return null;
  }

  return result.toDouble();
}
