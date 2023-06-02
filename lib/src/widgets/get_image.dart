import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class LzImage<T> extends StatelessWidget {
  final T image;
  final BoxFit fit;
  final Color? color;
  final double? width, height, size;
  final double? radius;
  final Widget? placeholder, errorWidget;

  const LzImage(this.image,
      {super.key, this.fit = BoxFit.cover, this.color, this.width, this.height, this.size, this.radius, this.placeholder, this.errorWidget});

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
        child: errorWidget ??
            const Center(
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
          errorWidget: (context, url, error) => errorWidget ?? const Center(child: Icon(La.exclamationCircle)),
        );
      }

      /* --------------------------------------------------------------------------------------
      | PATH
      | */

      else if (isPath) {
        result = Image.file(File(path), fit: fit, width: width, height: height);
      } else {
        String path = 'assets/images/$image';
        result = Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(path), fit: fit),
          ),
        );
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
