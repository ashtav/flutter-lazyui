import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

extension IntExtension on int {
  /// ``` dart
  /// print(99025.formatBytes()); // 96.7 KB
  /// ```
  String formatBytes([int decimals = 1]) {
    int bytes = int.parse(toString());
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }
}

extension Uint8ListExtension on Uint8List {
  Future<File> toFile([String? filename]) async {
    final Directory tempDir = await getTemporaryDirectory();
    File file = await File(
            '${tempDir.path}/${filename ?? DateTime.now().millisecondsSinceEpoch.toString()}.png')
        .create();
    file.writeAsBytesSync(this);

    return file;
  }
}
