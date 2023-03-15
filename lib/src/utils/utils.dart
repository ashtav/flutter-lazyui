import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:lazyui/lazyui.dart';

class Utils {
  /// ``` dart
  /// Utils.hex('fff'); // white
  /// ```
  static Color hex(String code) {
    String color = code.replaceAll('#', '');

    // if color code length is 3, make complete color code
    if (color.length == 3) {
      color = '${color[0]}${color[0]}${color[1]}${color[1]}${color[2]}${color[2]}';
    }

    return Color(int.parse('0xff$color'));
  }

  /// ``` dart
  /// catch (e, s){
  ///   Utils.errorCatcher(e, s);
  /// }
  /// ```
  static errorCatcher(e, StackTrace s) {
    List frames = Trace.current().frames, terseFrames = Trace.from(s).terse.frames;
    Frame frame = Trace.current().frames[frames.length > 1 ? 1 : 0], trace = Trace.from(s).terse.frames[terseFrames.length > 1 ? 1 : 0];

    String errorLocation = '${frame.member}', errorLine = '${trace.line}';
    logg('-- Error on $errorLocation (Line $errorLine), $e', name: 'ERROR');
  }

  // SYSTEM CHROME ============================================

  /// ``` dart
  /// Utils.setSystemUI();
  /// ```
  static setSystemUI(
      {Brightness brightness = Brightness.dark, Color? statusBarColor, Color? navDividerColor, Brightness? navBarIconColor, Color? navBarColor}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: navBarIconColor ?? Brightness.dark,
        statusBarIconBrightness: brightness,
        statusBarColor: statusBarColor ?? Colors.transparent,
        systemNavigationBarDividerColor: navDividerColor,
        systemNavigationBarColor: navBarColor));
  }

  /// ``` dart
  /// Utils.statusBar(true); // set false to hide
  /// ```
  static void statusBar([bool show = true]) => SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: show ? SystemUiOverlay.values : []);

  // CLIPBOARD =============================================

  /// ```dart
  /// Utils.copy('YOUR TEXT');
  /// ```
  static Future<bool> copy(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    return true;
  }

  /// ```dart
  /// Timer timer = Utils.timer((){
  ///   // do something...
  /// }, 5.s); // 100.ms, 1.s, 1.m, 1.h
  /// ```
  static Timer timer(void Function() then, [Duration? duration]) => Timer(duration ?? 100.ms, then);

  /// ``` dart
  /// Utils.msToDateTime(1625386377499, format: 'D, d F Y h:i:s'); // Sabtu, 20 Maret 2021
  /// ```
  static String msToDateTime(int ms, {String format = 'dd/MM/yyyy'}) => DateTime.fromMillisecondsSinceEpoch(ms).format(format);

  /// ```dart
  /// String timeElapsed = Utils.timeElapsed('2021-02-24 11:12:30', inDay: 'day ago');
  /// // put value with String or DateTime only
  /// // only for 1 month calculation
  /// ```
  static String timeElapsed(dynamic dateTime, {String? inDay, String? inHour, String? inMinute, String justNow = 'just now'}) {
    try {
      Duration compare(DateTime x, DateTime y) => Duration(microseconds: (x.microsecondsSinceEpoch - y.microsecondsSinceEpoch).abs());

      DateTime date = dateTime is String ? DateTime.parse(dateTime) : dateTime;

      DateTime x = DateTime.now();
      DateTime y = DateTime(date.year, date.month, date.day, date.hour, date.minute, date.second);

      Duration diff = compare(x, y);
      String h = '${date.hour}'.padLeft(2, '0'), m = '${date.minute}'.padLeft(2, '0'), s = '${date.second}'.padLeft(2, '0');

      String dateTimeStr = '${date.year}-${'${date.month}'.padLeft(2, '0')}-${'${date.day}'.padLeft(2, '0')} $h:$m:$s';

      // if init value more then current time
      if (y.millisecondsSinceEpoch > x.millisecondsSinceEpoch) {
        return '-';
      }

      String textInDay(int value) => inDay ?? (value > 1 ? 'days ago' : 'day ago');
      String textInHour(int value) => inHour ?? (value > 1 ? 'hours ago' : 'hour ago');
      String textInMinute(int value) => inMinute ?? (value > 1 ? 'minutes ago' : 'minute ago');

      if (diff.inSeconds >= 60) {
        if (diff.inMinutes >= 60) {
          if (diff.inHours >= 24) {
            return diff.inDays > 31 ? dateTimeStr : '${diff.inDays} ${textInDay(diff.inDays)}';
          } else {
            return '${diff.inHours} ${textInHour(diff.inHours)}';
          }
        } else {
          return '${diff.inMinutes} ${textInMinute(diff.inMinutes)}';
        }
      } else {
        return justNow;
      }
    } catch (e) {
      rethrow;
    }
  }

  /// ``` dart
  /// Utils.randNumber(18); // generate random int value, max length is 18
  /// ```
  static int randNumber([int length = 10]) {
    if (length > 18) length = 18;

    String rand = '';
    for (int i = 0; i < length - 1; i++) {
      while (rand == '' || rand[0] == '0') {
        rand = Random().nextInt(10).toString();
      }

      rand += Random().nextInt(10).toString();
    }
    return int.parse(rand);
  }

  /// ``` dart
  /// Utils.randString(10); // generate random string value
  /// ```
  static String randString(int length, {bool withSymbol = false, List<String> customChar = const []}) {
    String chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

    if (customChar.isNotEmpty) {
      chars = customChar.join();
    }

    if (withSymbol) {
      chars += '!@#\$%^&*()_+-=[]{}|;:<>?,./';
    }

    if (length < 1) length = 1;

    String rand = '';
    for (int i = 0; i < length; i++) {
      rand += chars[Random().nextInt(chars.length)];
    }
    return rand;
  }

  // CURSOR =================================================

  /// ```dart
  /// TextEditingController name = TextEditingController();
  /// Utils.setCursorToLastPosition(name);
  /// ```
  static setCursorToLastPosition(TextEditingController controller, [int time = 0]) {
    Timer(Duration(milliseconds: time), () => controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length)));
  }

  // SCROLL =================================================

  /// ```dart
  /// ScrollController scroll = ScrollController();
  /// Utils.scrollTo(scroll);
  /// ```
  static scrollTo(ScrollController scrollController, {int duration = 300, int delay = 50, AxisDirection to = AxisDirection.up}) {
    Timer? timer;

    try {
      if (scrollController.hasClients) {
        timer = Timer(Duration(milliseconds: delay), () {
          scrollController.animateTo(
            to == AxisDirection.down ? scrollController.position.maxScrollExtent : 0,
            curve: Curves.easeOut,
            duration: Duration(milliseconds: duration),
          );

          timer?.cancel();
        });
      }
    } catch (e) {
      rethrow;
    }
  }

  ///
  /// ```dart
  /// ListView(
  ///   controller: yourScrollController,
  ///   children: [
  ///     YourWidget(
  ///       key: yourGlobalKey
  ///     )
  ///   ]
  /// )
  ///
  /// onTap: (){
  ///   Utils.scrollToWidget(yourGlobalKey, yourScrollController, MediaQuery.of(context).size.width);
  /// }
  /// ```

  static void scrollToWidget(GlobalKey key, ScrollController controller, double screenWidth) {
    if (key.currentContext != null) {
      RenderBox box = key.currentContext?.findRenderObject() as RenderBox;

      // get width of widget
      double w = box.size.width;

      // get horizontal position of widget
      double dx = box.localToGlobal(Offset.zero).dx;

      // get max scroll of List
      double ms = controller.position.maxScrollExtent;

      // get pixel of scroll position
      double pixel = controller.position.pixels;

      // result, the center position of widget
      double pos = (pixel + dx) - (screenWidth / 2) + (w / 2);

      // scroll to position
      controller.animateTo(
          pos < 0
              ? 0
              : pos > ms
                  ? ms
                  : pos,
          duration: const Duration(milliseconds: 250),
          curve: Curves.ease);
    }
  }

  /// This function will set scroll to default position when user scroll to max position
  /// ``` dart
  /// List max = [10, 50]; // [top, bottom]
  /// double max = 50; // this value will set to top and bottom
  ///
  /// bool hasMax = scrollHasMax(scrollController, max);
  ///
  /// // for example:
  /// void yourScrollListener() {
  ///   double pixel = scrollController.position.pixels;
  ///
  ///   if (scrollHasMax(scrollController, [20, 50])) {
  ///     scrollController.animateTo(pixel, duration: const Duration(milliseconds: 250), curve: Curves.easeInBack);
  ///   }
  /// }
  /// ```
  static bool scrollHasMax(ScrollController scrollController, dynamic max) {
    bool isMaxList = max is List;

    // if max is integer or double
    max = max is int ? max.toDouble() : max;

    if (isMaxList) {
      if (max.length == 1) max.add(max[0]);
      max = max.map((e) => e is int ? e.toDouble() : e).toList();
    }

    double maxT = isMaxList ? max[0] : max;
    double maxB = isMaxList ? max[1] : max;

    double pixel = scrollController.position.pixels;
    double maxPixel = scrollController.position.maxScrollExtent;
    return (pixel < -maxB || pixel > (maxPixel + maxT));
  }

  // SCREEN =================================================

  /// ```dart
  /// Utils.orientation([DeviceOrientation.landscapeLeft]);
  /// ```
  static void orientation([List<DeviceOrientation> orientations = const [DeviceOrientation.portraitUp]]) {
    SystemChrome.setPreferredOrientations(orientations);
  }

  // IMAGES =================================================

  /// ```dart
  /// File file = await Utils.urlToFile('FILE-URL');
  /// ```
  static Future<File> urlToFile(String imageUrl, {String format = 'png'}) async {
    try {
      // get temporary directory of device.
      Directory tempDir = await getTemporaryDirectory();

      // get temporary path from temporary directory.
      String tempPath = tempDir.path;

      // create a new file in temporary path with random file name.
      File file = File('$tempPath${DateTime.now().millisecondsSinceEpoch}.$format');

      // call http.get method and pass imageUrl into it to get response.
      http.Response response = await http.get(Uri.parse(imageUrl));

      // write bodyBytes received in response to file.
      await file.writeAsBytes(response.bodyBytes);

      // now return the file which is created with random name in
      // temporary directory and image bytes from response is written to // that file.
      return file;
    } catch (e) {
      rethrow;
    }
  }

  /// ```dart
  /// String base64 = await Utils.fileToBase64(file);
  /// ```
  static Future<String> fileToBase64(File file) async {
    try {
      String base64Image = base64Encode(file.readAsBytesSync());
      return base64Image;
    } catch (e) {
      rethrow;
    }
  }

  /// ```dart
  /// File file = await Utils.base64ToFile('BASE64-STRING');
  /// ```
  static Future<File> base64ToFile(String base64) async {
    try {
      Uint8List uint8list = base64Decode(base64);
      String dir = (await getApplicationDocumentsDirectory()).path;
      File file = File("$dir/${DateTime.now().millisecondsSinceEpoch}.png");
      return await file.writeAsBytes(uint8list);
    } catch (e) {
      rethrow;
    }
  }

  /// ```dart
  /// Image image = await Utils.base64ToImage('BASE64-STRING');
  /// ```
  static Future<Image> base64ToImage(String base64) async {
    try {
      Uint8List uint8list = base64Decode(base64);
      return Image.memory(uint8list);
    } catch (e) {
      rethrow;
    }
  }

  /// ```dart
  /// File file = await 'images/avatar.png'.imageToFile(); // from assets
  /// ```
  static Future<File> imageToFile(String imageName) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();

    var bytes = await rootBundle.load('assets/$imageName');
    String tempPath = (await getTemporaryDirectory()).path;
    File file = File('$tempPath/$fileName.png');
    await file.writeAsBytes(bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
    return file;
  }

  /// ```dart
  /// String text = await Utils.htmlToText('<p>HTML</p>');
  /// ```
  static String htmlToText(String html) {
    // replace <br /> = \n
    // &ldquo;, &rdquo; = "
    // &lsquo;, &rsquo; = '
    // &amp; = &
    // &nbsp; = ' '
    // &hellip; = ...
    // &ndash; = -
    // &mdash; = --
    // &lt; = <
    // &gt; = >
    // &copy; = ©
    // &reg; = ®
    // &trade; = ™
    // &euro; = €
    // &pound; = £
    // &yen; = ¥
    // &cent; = ¢
    // &sect; = §
    // &para; = ¶
    // &deg; = °
    // &plusmn; = ±
    // &sup2; = ²
    // &sup3; = ³
    // &frac14; = ¼
    // &frac12; = ½
    // &frac34; = ¾
    // &times; = ×
    // &divide; = ÷
    // &micro; = µ
    // &middot; = ·
    // &bull; = •

    return html
        .replaceAll('<br />', '\n')
        .replaceAll('&ldquo;', '"')
        .replaceAll('&rdquo;', '"')
        .replaceAll('&lsquo;', "'")
        .replaceAll('&rsquo;', "'")
        .replaceAll('&amp;', '&')
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&hellip;', '...')
        .replaceAll('&ndash;', '-')
        .replaceAll('&mdash;', '--')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&copy;', '©')
        .replaceAll('&reg;', '®')
        .replaceAll('&trade;', '™')
        .replaceAll('&euro;', '€')
        .replaceAll('&pound;', '£')
        .replaceAll('&yen;', '¥')
        .replaceAll('&cent;', '¢')
        .replaceAll('&sect;', '§')
        .replaceAll('&para;', '¶')
        .replaceAll('&deg;', '°')
        .replaceAll('&plusmn;', '±')
        .replaceAll('&sup2;', '²')
        .replaceAll('&sup3;', '³')
        .replaceAll('&frac14;', '¼')
        .replaceAll('&frac12;', '½')
        .replaceAll('&frac34;', '¾')
        .replaceAll('&times;', '×')
        .replaceAll('&divide;', '÷')
        .replaceAll('&micro;', 'µ')
        .replaceAll('&middot;', '·')
        .replaceAll('&bull;', '•')
        .removeHtmlTag;
  }

  /// ```dart
  /// Utils.checkModel('users.json', {'id': 1, 'name': 'John Doe'})
  /// // jsonPath must be = 'filename.json', put in assets/models
  /// ```
  static Future<bool> checkModel(String path, Map<String, dynamic> jsonData, {bool ignoreNull = false}) async {
    bool isOk = true;

    try {
      rootBundle.loadString('assets/models/$path').then((jsonStr) {
        Map<String, dynamic> model = jsonDecode(jsonStr);

        List<Map<String, Type>> missingKeys = [];
        List<Map<String, Type>> wrongType = [];

        // check each type of data
        jsonData.forEach((key, value) {
          if (model.containsKey(key)) {
            if (model[key].runtimeType != value.runtimeType) {
              // if ignoreNull is true, then ignore null value
              if (ignoreNull && value == null) {
                return;
              }

              wrongType.add({key: value.runtimeType});
            }
          } else {
            missingKeys.add({key: value.runtimeType});
          }
        });

        String missing = missingKeys.map((e) {
          String resType = colorize(e.values.first.toString(), LogColor.yellow);
          return '${colorize(e.keys.first, LogColor.yellow)} ($resType) is missing from your model';
        }).join(', ');

        String wrong = wrongType.map((e) {
          String modelType = colorize(model[e.keys.first].runtimeType.toString(), LogColor.yellow);
          String resType = colorize(e.values.first.toString(), LogColor.yellow);
          return '${colorize(e.keys.first, LogColor.yellow)} property of your model must be $resType not $modelType';
        }).join(', ');

        String message = '';

        if (missingKeys.isNotEmpty) {
          isOk = false;
          message += 'You have ${missingKeys.length} missing keys :\n$missing';
        }

        if (wrongType.isNotEmpty) {
          isOk = false;

          if (message.isNotEmpty) message += '\n\n';
          message += 'You have ${wrongType.length} wrong type of data :\n$wrong';
        }

        if (message.isNotEmpty) {
          logg(message, color: LogColor.normal);
        } else {
          logg('Your model ($path) is valid. ✓', color: LogColor.green);
        }
      }).catchError((err) => logg(err));
    } catch (e, s) {
      Utils.errorCatcher(e, s);
    }

    return isOk;
  }

  /// ```dart
  /// Utils.getDateStringFormat('2000-12-10'); // y-m-d
  /// ```

  static String? getDateStringFormat(String dateString) {
    Map<String, RegExp> formatRegexMap = {
      'y-m-d': RegExp(r'^\d{4}-\d{2}-\d{2}$'),
      'd-m-y': RegExp(r'^\d{2}-\d{2}-\d{4}$'),
      'y.m.d': RegExp(r'^\d{4}\.\d{2}\.\d{2}$'),
      'y/m/d': RegExp(r'^\d{4}/\d{2}/\d{2}$'),
      'd/m/y': RegExp(r'^\d{2}/\d{2}/\d{4}$'),
      'd.m.y': RegExp(r'^\d{2}\.\d{2}\.\d{4}$'),
      'ymd': RegExp(r'^\d{4}\d{2}\d{2}$'),
      'dmy': RegExp(r'^\d{2}\d{2}\d{4}$'),
    };

    String? result;

    for (String format in formatRegexMap.keys) {
      RegExp? r = formatRegexMap[format];

      if (dateString.contains(' ')) {
        dateString = dateString.split(' ')[0]; // extract date portion of string
      } else {
        dateString = dateString;
      }

      if (r != null && r.hasMatch(dateString)) {
        result = format;
        break; // exit loop when match is found
      }
    }

    return result;
  }
}
