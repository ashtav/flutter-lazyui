import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

// @Deprecated('Use LzImage widget instead')
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

class LzImage<T> extends StatelessWidget {
  final T image;
  final BoxFit fit;
  final Color? color;
  final double? width, height, size;
  final double? radius;
  final Widget? placeholder;

  const LzImage(this.image, {super.key, this.fit = BoxFit.cover, this.color, this.width, this.height, this.size, this.radius, this.placeholder});

  @override
  Widget build(BuildContext context) {
    // init size
    double? width = this.width, height = this.height;

    if (size != null) {
      width = size;
      height = size;
    }

    List availables = [String, File, Uint8List, Image];

    // check available type
    if (!availables.contains(image.runtimeType)) {
      logg('Image type is not available | $image', name: 'LzImage', color: LogColor.cyan);
      return SizedBox(
        width: width,
        height: height,
        child: const Center(
            child: Icon(
          La.exclamationCircle,
        )),
      );
    }

    late Widget result;

    // init radius
    double radius = this.radius ?? LazyUi.getConfig.radius;

    // if string, check if it's a imageUrl, path, asset or svg
    if (image is String) {
      String path = image as String;

      bool isSvg = path.split('.').last.toLowerCase() == 'svg';
      bool isUrl = path.contains('http');
      bool isPath = path.split('/').length > 2; // ex: /storage/emulated/0/Download/IMG_20210101_000000.jpg

      /* --------------------------------------------------------------------------------------
      | SVG
      | */

      if (isSvg) {
        result = SvgPicture.asset('assets/images/$image', width: width, height: height);
      }

      /* --------------------------------------------------------------------------------------
      | IMAGE URL
      | */

      else if (isUrl) {
        // Future<bool> is404() async {
        //   var uri = Uri.parse(path);
        //   var request = await HttpClient().getUrl(uri);
        //   var response = await request.close();
        //   return response.statusCode == HttpStatus.notFound;
        // }

        // Widget error = Center(
        //     child: Text(
        //   '404',
        //   style: LazyUi.getConfig.textStyle?.copyWith(fontWeight: Fw.bold),
        // ));

        Widget shimmer = Shimmer.fromColors(
          baseColor: Colors.black26,
          highlightColor: Colors.black54,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(radius)),
          ),
        );

        result = CachedNetworkImage(
          fit: fit,
          imageUrl: path,
          width: width,
          height: height,
          progressIndicatorBuilder: (context, url, downloadProgress) => placeholder ?? shimmer,
          errorWidget: (context, url, error) => const Center(child: Icon(La.exclamationCircle)),
        );
      }

      /* --------------------------------------------------------------------------------------
      | PATH
      | */

      else if (isPath) {
        result = Image.file(File(path), fit: fit, width: width, height: height);
      }
    }

    /* --------------------------------------------------------------------------------------
    | Uint8List
    | */

    else if (image is Uint8List) {
      result = Image.memory(image as Uint8List, fit: fit, width: width, height: height);
    }

    /* --------------------------------------------------------------------------------------
    | File
    | */

    else if (image is File) {
      result = Image.file(image as File, fit: fit, width: width, height: height);
    } else {
      String path = 'assets/images/$image';
      result = Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(path), fit: fit),
        ),
      );
    }

    return SizedBox(
      width: width,
      height: height,
      child: result,
    ).clip(all: radius);
  }
}
