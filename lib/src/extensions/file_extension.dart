import 'dart:convert';
import 'dart:io';

extension FileExtension on File {
  Future<String> toBase64() async {
    String base64Image = base64Encode(readAsBytesSync());
    return base64Image;
  }
}
