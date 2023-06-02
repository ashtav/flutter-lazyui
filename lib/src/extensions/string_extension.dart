import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:lazyui/lazyui.dart';

extension StringExtension on String {
  /// ``` dart
  /// print('john doe'.ucwords); // John Doe
  /// ```
  String get ucwords {
    try {
      String str = this;

      if (str.trim().isEmpty) return '';

      List<String> split = str.split(' ');
      for (int i = 0; i < split.length; i++) {
        if (split[i] != '') {
          split[i] = split[i][0].toUpperCase() + split[i].substring(1);
        }
      }

      return split.join(' ');
    } catch (e) {
      return '';
    }
  }

  /// ``` dart
  /// print('john doe'.ucfirst); // John doe
  /// ```
  String get ucfirst {
    try {
      String str = this;
      if (str.trim() == '') return '';
      return str[0].toUpperCase() + str.substring(1);
    } catch (e) {
      return '';
    }
  }

  /// ``` dart
  /// 'John Doe'.initials(length = 2); // JD
  /// ```
  String initials({bool firstUppercase = true, int length = 2}) {
    String result = '';

    try {
      List<String> char = trim().split(' ');
      char.take(length).forEach((e) => result += firstUppercase ? e[0].ucwords : e[0]);
      return result;
    } catch (e) {
      return '!';
    }
  }

  /// ``` dart
  /// print('lipsum99'.getNumeric); // 99
  /// ```
  int get getNumeric {
    try {
      if (trim().isEmpty) return 0;
      String number = replaceAll(RegExp(r'-(?=\D|$)'), '');
      return int.parse(number.replaceAll(RegExp(r'[^0-9-]'), ''));
    } catch (e) {
      return 0;
    }
  }

  /// ``` dart
  /// 'lorem ipsum dolor'.removeStringBefore('ipsum'); // ipsum dolor
  /// ```
  String removeStringBefore(String pattern, {bool includePattern = false}) {
    try {
      return !includePattern ? substring(lastIndexOf(pattern)) : substring(lastIndexOf(pattern) + pattern.length);
    } catch (e) {
      return this;
    }
  }

  /// ``` dart
  /// 'lorem ipsum dolor'.removeStringAfter('ipsum'); // lorem ipsum
  /// ```
  String removeStringAfter(String pattern, {bool includePattern = false}) {
    try {
      if (indexOf(pattern) == -1) return this;
      return substring(0, !includePattern ? indexOf(pattern) + pattern.length : indexOf(pattern));
    } catch (e) {
      return this;
    }
  }

  /// ``` dart
  /// 'lorem ipsum dolor'.removeStringBetween('lorem','dolor'); // lorem dolor
  /// ```

  String removeStringBetween(String startWord, String endWord) {
    try {
      final startIndex = indexOf(startWord);
      final endIndex = indexOf(endWord, startIndex + startWord.length);
      if (startIndex == -1 || endIndex == -1) {
        return this; // Either startWord or endWord not found
      }
      return replaceRange(startIndex + startWord.length, endIndex, ' ').trim();
    } catch (e) {
      return this;
    }
  }

  /// ``` dart
  /// 'lorem ipsum dolor'.getStringBetween('lorem','dolor'); // ipsum
  /// ```
  String getStringBetween(String start, String end) {
    try {
      int startIndex = indexOf(start);
      int endIndex = indexOf(end);

      return substring(startIndex + start.length, endIndex);
    } catch (e) {
      return '';
    }
  }

  /// ``` dart
  /// '<h1>Hello World</h1>'.removeHtmlTag; // Hello World
  /// ```
  String get removeHtmlTag {
    try {
      RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
      return replaceAll(exp, '').replaceAll('&nbsp;', '');
    } catch (e) {
      return '!';
    }
  }

  /// ``` dart
  /// '{}'.isJson; // true
  /// ```
  bool get isJson {
    try {
      json.decode(this);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// ``` dart
  /// File file = await '<base64-string>'.base64ToFile();
  /// ```
  Future<File> base64ToFile() async {
    Uint8List uint8list = base64Decode(this);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File("$dir/${DateTime.now().millisecondsSinceEpoch}.png");
    return await file.writeAsBytes(uint8list);
  }

  /// ``` dart
  /// Image file = await '<base64-string>'.base64ToImage();
  /// ```
  Future<Image> base64ToImage() async {
    Uint8List uint8list = base64Decode(this);
    return Image.memory(uint8list);
  }

  /// ``` dart
  /// File file = await '<image-url>'.urlToFile();
  /// ```
  Future<File> urlToFile({String format = 'png'}) async {
    // get temporary directory of device.
    Directory tempDir = await getTemporaryDirectory();

    // get temporary path from temporary directory.
    String tempPath = tempDir.path;

    // create a new file in temporary path with random file name.
    File file = File('$tempPath${DateTime.now().millisecondsSinceEpoch}.$format');

    // call http.get method and pass imageUrl into it to get response.
    http.Response response = await http.get(Uri.parse(this));

    // write bodyBytes received in response to file.
    await file.writeAsBytes(response.bodyBytes);

    // now return the file which is created with random name in
    // temporary directory and image bytes from response is written to // that file.
    return file;
  }

  /// ``` dart
  /// File file = await 'images/avatar.png'.imageToFile(); // from assets
  /// ```
  Future<File> imageToFile() async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();

    ByteData bytes = await rootBundle.load('assets/$this');
    String tempPath = (await getTemporaryDirectory()).path;
    File file = File('$tempPath/$fileName.png');
    await file.writeAsBytes(bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
    return file;
  }

  bool get isEmail => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(this);

  bool get isUrl => RegExp(r'^(http|https|ftp):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$').hasMatch(this);
}

extension NullableStringExtension on String? {
  /// ``` dart
  /// "2023-02-10 00:00:00".toDate(); // DateTime(2023, 2, 10, 0, 0, 0)
  /// "10-02-2023 00:00:00".toDate(); // DateTime(2023, 2, 10, 0, 0, 0)
  /// // Support yyyy-MM-dd and dd-MM-yyyy format
  /// ```
  DateTime toDate({bool toLocal = false}) {
    try {
      String? dateString = this;

      if (dateString != null) {
        String? format = Utils.getDateStringFormat(dateString);
        DateTime result = DateTime.now();

        if (format != null && format == 'd-m-y') {
          RegExp regex = RegExp(r'^(\d{2})-(\d{2})-(\d{4})$');
          List<String> dateParts = (regex.firstMatch(dateString.split(' ')[0])?.groups([3, 2, 1]) ?? []).cast();
          String ymd = '${dateParts[0]}-${dateParts[1]}-${dateParts[2]}';

          result = DateTime.parse(ymd);
        } else {
          result = DateTime.parse(dateString);
        }

        return toLocal ? result.toLocal() : result;
      }

      return DateTime.now();
    } catch (e, s) {
      Utils.errorCatcher(e, s);
      return DateTime.now();
    }
  }
}
