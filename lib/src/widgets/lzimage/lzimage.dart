import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:lazyui/src/widgets/lzimage/utils.dart';

class LzImage<T> extends StatelessWidget {
  final T image;
  const LzImage(this.image, {super.key});

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

    return const Placeholder();
  }

  static preview(String image) {}
}
