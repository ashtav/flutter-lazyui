import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class Files {
  /// Convert a [File] to a base64-encoded string.
  ///
  /// The [file] parameter is the file to be converted.
  ///
  /// Example usage:
  /// ```dart
  /// File imageFile = File('path/to/image.png');
  /// String base64 = await fileToBase64(imageFile);
  /// print(base64); // The base64-encoded string representation of the image file
  /// ```
  Future fileToBase64(File file) async {
    String base64Image = base64Encode(file.readAsBytesSync());
    return base64Image;
  }

  /// Convert a [Uint8List] to a [File] and save it to the temporary directory.
  ///
  /// The [value] parameter is the Uint8List data to be converted.
  /// The optional [filename] parameter is the name of the file (default: current timestamp).
  ///
  /// Example usage:
  /// ```dart
  /// Uint8List imageData = ... // Get the Uint8List data
  /// File imageFile = await uint8ListToFile(imageData, filename: 'image.png');
  /// print(imageFile.path); // The path to the saved image file
  /// ```
  Future uint8ListToFile(Uint8List value, {String? filename}) async {
    final Directory tempDir = await getTemporaryDirectory();
    File file =
        await File('${tempDir.path}/${filename ?? DateTime.now().millisecondsSinceEpoch.toString()}.png').create();
    file.writeAsBytesSync(value);

    return file;
  }

  /// Convert a base64-encoded string to a [File] and save it to the application documents directory.
  ///
  /// The [base64] parameter is the base64-encoded string to be converted.
  ///
  /// Example usage:
  /// ```dart
  /// String base64Image = ... // Get the base64-encoded string
  /// File imageFile = await base64ToFile(base64Image);
  /// print(imageFile.path); // The path to the saved image file
  /// ```
  Future<File> base64ToFile(String base64) async {
    Uint8List uint8list = base64Decode(base64);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File("$dir/${DateTime.now().millisecondsSinceEpoch}.png");
    return await file.writeAsBytes(uint8list);
  }

  /// Convert a base64-encoded string to an [Image] widget.
  ///
  /// The [base64] parameter is the base64-encoded string to be converted.
  ///
  /// Example usage:
  /// ```dart
  /// String base64Image = ... // Get the base64-encoded string
  /// Image image = await base64ToImage(base64Image);
  /// ```
  Future<Image> base64ToImage(String base64) async {
    Uint8List uint8list = base64Decode(base64);
    return Image.memory(uint8list);
  }

  /// Convert an image file located at the specified [path] in the assets folder to a [File].
  ///
  /// The [path] parameter is the relative path of the image file in the assets folder.
  ///
  /// Example usage:
  /// ```dart
  /// String imagePath = 'images/my_image.png'; // The relative path of the image file
  /// File imageFile = await imageToFile(imagePath);
  /// print(imageFile.path); // The path to the converted image file
  /// ```
  Future<File> imageToFile(String path) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    ByteData bytes = await rootBundle.load('assets/$path');
    String tempPath = (await getTemporaryDirectory()).path;
    File file = File('$tempPath/$fileName.png');
    return await file.writeAsBytes(bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
  }
}
