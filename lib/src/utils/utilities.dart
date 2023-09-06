part of utils;

class Utils {
  /// Converts a hexadecimal color code to a Color object in Dart.
  ///
  /// This utility function takes a string representing a hexadecimal color code as input.
  /// The input string can be either three or six characters long, and may optionally start with a '#'.
  /// If a three-character string is provided, it is expanded into a six-character string by duplicating each character.
  /// This expanded string is then parsed into an integer, which is used to create a new Color object.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// Color color1 = Utils.hex('fff'); // returns a Color object representing white
  /// Color color2 = Utils.hex('#abc'); // returns a Color object
  /// Color color3 = Utils.hex('123456'); // returns a Color object
  /// ```

  static Color hex(String code) {
    String color = code.replaceAll('#', '');

    // if color code length is 3, make complete color code
    if (color.length == 3) {
      color =
          '${color[0]}${color[0]}${color[1]}${color[1]}${color[2]}${color[2]}';
    }

    return Color(int.tryParse('0xff$color') ?? 0xff000000);
  }

  /// Catcher function for handling errors and exceptions.
  ///
  /// The [e] parameter represents the error or exception.
  /// The [s] parameter represents the stack trace associated with the error or exception.
  /// The [tracing] parameter, if set to true, enables detailed tracing of error locations (default: false).
  ///
  /// Example usage:
  /// ```dart
  /// try {
  ///   // Code that may throw an error or exception
  /// } catch (e, s) {
  ///   Utils.errorCatcher(e, s, tracing: true);
  /// }
  /// ```

  static errorCatcher(e, StackTrace s, {bool tracing = false}) {
    if (tracing) {
      final frames = Trace.from(s).terse.frames;

      // Extracting relevant information from stack frames
      List<String> members = frames
          .take(5)
          .map((e) => '${e.member ?? 'Unknown'} (${e.line}:${e.column})')
          .toList();
      String member = members.join(', ');

      // Constructing the error message with trace information
      String message = '''$e
Try to check [$member]''';

      // Logging the error message
      logg(message, name: 'ERROR');
      return;
    }

    // Extracting relevant frames for error location
    List frames = Trace.current().frames,
        terseFrames = Trace.from(s).terse.frames;
    Frame frame = Trace.current().frames[frames.length > 1 ? 1 : 0],
        trace = Trace.from(s).terse.frames[terseFrames.length > 1 ? 1 : 0];

    String errorLocation = '${frame.member}', errorLine = '${trace.line}';

    // Logging the error message with error location
    logg('-- Error on $errorLocation (Line $errorLine), $e', name: 'ERROR');
  }

  /// Set the system UI overlay style with the specified options.
  ///
  /// The [brightness] parameter sets the brightness of the status bar icons (default: Brightness.dark).
  /// The [statusBarColor] parameter sets the color of the status bar (default: transparent).
  /// The [navDividerColor] parameter sets the color of the navigation bar divider (default: null).
  /// The [navBarIconColor] parameter sets the color of the navigation bar icons (default: Brightness.dark).
  /// The [navBarColor] parameter sets the color of the navigation bar (default: null).
  ///
  /// Example usage:
  /// ```dart
  /// Utils.setSystemUI(
  ///   brightness: Brightness.light,
  ///   statusBarColor: Colors.blue,
  ///   navDividerColor: Colors.grey,
  ///   navBarIconColor: Brightness.light,
  ///   navBarColor: Colors.white,
  /// );
  /// ```

  static setSystemUI({
    Brightness brightness = Brightness.dark,
    Color? statusBarColor,
    Color? navDividerColor,
    Brightness? navBarIconColor,
    Color? navBarColor,
  }) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: navBarIconColor ?? Brightness.dark,
      statusBarIconBrightness: brightness,
      statusBarColor: statusBarColor ?? Colors.transparent,
      systemNavigationBarDividerColor: navDividerColor,
      systemNavigationBarColor: navBarColor,
    ));
  }

  /// Toggle the visibility of the status bar.
  ///
  /// The [show] parameter determines whether to show or hide the status bar (default: true).
  ///
  /// Example usage:
  /// ```dart
  /// Utils.statusBar(true); // set false to hide
  /// ```

  static void statusBar([bool show = true]) =>
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: show ? SystemUiOverlay.values : []);

  /// Copy the specified [text] to the clipboard.
  ///
  /// Returns a [Future<bool>] indicating whether the text was successfully copied.
  ///
  /// Example usage:
  /// ```dart
  /// Utils.copy('YOUR TEXT');
  /// ```

  static Future<bool> copy(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    return true;
  }

  /// Create a timer that invokes the specified [then] function after the specified [duration].
  ///
  /// The [then] parameter is a callback function that will be called when the timer expires.
  /// The [duration] parameter sets the duration of the timer (default: 100 milliseconds).
  ///
  /// Example usage:
  /// ```dart
  /// Timer timer = Utils.timer((){
  ///   // do something...
  /// }, 5.s); // 100.ms, 1.s, 1.m, 1.h
  /// ```

  static Timer timer(void Function() then, [Duration? duration]) =>
      Timer(duration ?? 100.ms, then);

  /// Set the cursor to the last position in the text field associated with the given [controller].
  ///
  /// The [controller] parameter is the TextEditingController instance associated with the text field.
  /// The optional [time] parameter specifies the delay in milliseconds before setting the cursor position (default: 0).
  ///
  /// Example usage:
  /// ```dart
  /// TextEditingController name = TextEditingController();
  /// Utils.setCursorToLastPosition(name);
  /// ```

  static setCursorToLastPosition(TextEditingController controller,
      [int time = 0]) {
    Timer(
      Duration(milliseconds: time),
      () => controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length),
      ),
    );
  }

  /// Scroll the given [scrollController] to the specified position.
  ///
  /// The [scrollController] parameter is the scroll controller to be scrolled.
  /// The optional [duration] parameter is the duration of the scroll animation (default: 300 milliseconds).
  /// The optional [delay] parameter is the delay before starting the scroll animation (default: 50 milliseconds).
  /// The optional [to] parameter specifies the direction of the scroll animation (default: AxisDirection.up).
  ///
  /// Example usage:
  /// ```dart
  /// ScrollController controller = ScrollController();
  /// Utils.scrollTo(controller, duration: 500, delay: 100, to: AxisDirection.down);
  /// ```
  static scrollTo(ScrollController scrollController,
      {int duration = 300,
      int delay = 50,
      AxisDirection to = AxisDirection.up}) {
    Timer? timer;

    try {
      if (scrollController.hasClients) {
        timer = Timer(Duration(milliseconds: delay), () {
          scrollController.animateTo(
            to == AxisDirection.down
                ? scrollController.position.maxScrollExtent
                : 0,
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

  /// Check if the scroll position of the given [scrollController] has reached the maximum position.
  ///
  /// The [scrollController] parameter is the scroll controller to be checked.
  /// The [max] parameter defines the maximum scroll position. It can be either a single value or a list of two values [top, bottom].
  ///
  /// Example usage:
  /// ```dart
  /// ScrollController controller = ScrollController();
  /// bool hasMaxPosition = Utils.scrollHasMax(controller, [20, 50]);
  /// if (hasMaxPosition) {
  ///   // Do something when the scroll position reaches the maximum position
  /// }
  /// ```
  static bool scrollHasMax(ScrollController scrollController, dynamic max) {
    bool isMaxList = max is List;

    // If max is integer or double
    max = max is int ? max.toDouble() : max;

    if (isMaxList) {
      max as List;

      if (max.length == 1) max.add(max[0]);
      max = max.map((e) => e is int ? e.toDouble() : e).toList();
    }

    double maxT = isMaxList ? max[0] : max;
    double maxB = isMaxList ? max[1] : max;

    double pixel = scrollController.position.pixels;
    double maxPixel = scrollController.position.maxScrollExtent;
    return (pixel < -maxB || pixel > (maxPixel + maxT));
  }

  /// Set the preferred screen orientations for the application.
  ///
  /// The [orientations] parameter is a list of preferred device orientations (default: [DeviceOrientation.portraitUp]).
  ///
  /// Example usage:
  /// ```dart
  /// Utils.orientation([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  /// ```
  static void orientation(
      [List<DeviceOrientation> orientations = const [
        DeviceOrientation.portraitUp
      ]]) {
    SystemChrome.setPreferredOrientations(orientations);
  }

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
  static Future fileToBase64(File file) async {
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
  static Future uint8ListToFile(Uint8List value, {String? filename}) async {
    final Directory tempDir = await getTemporaryDirectory();
    File file = await File(
            '${tempDir.path}/${filename ?? DateTime.now().millisecondsSinceEpoch.toString()}.png')
        .create();
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
  static Future<File> base64ToFile(String base64) async {
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
  static Future<Image> base64ToImage(String base64) async {
    Uint8List uint8list = base64Decode(base64);
    return Image.memory(uint8list);
  }

  /// Download an image from the given [url] and save it as a [File].
  ///
  /// The [url] parameter is the URL of the image to be downloaded.
  /// The optional [format] parameter sets the file format (default: 'png').
  ///
  /// Example usage:
  /// ```dart
  /// String imageUrl = ... // The URL of the image
  /// File imageFile = await urlToFile(imageUrl, format: 'jpg');
  /// print(imageFile.path); // The path to the downloaded image file
  /// ```
  static Future<File> urlToFile(String url, {String format = 'png'}) async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    File file =
        File('$tempPath${DateTime.now().millisecondsSinceEpoch}.$format');
    http.Response response = await http.get(Uri.parse(url));
    await file.writeAsBytes(response.bodyBytes);
    return file;
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
  static Future<File> imageToFile(String path) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    ByteData bytes = await rootBundle.load('assets/$path');
    String tempPath = (await getTemporaryDirectory()).path;
    File file = File('$tempPath/$fileName.png');
    return await file.writeAsBytes(
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
  }

  /// Convert an HTML string to plain text.
  ///
  /// The [html] parameter is the HTML string to be converted.
  ///
  /// Example usage:
  /// ```dart
  /// String text = await Utils.htmlToText('<p>HTML</p>'); // Output: HTML
  /// print(text);
  /// ```
  static String htmlToText(String html) {
    // Define the HTML to plain text conversions
    Map<String, String> htmlToPlainText = {
      '<br />': '\n',
      '&ldquo;': '"',
      '&rdquo;': '"',
      '&lsquo;': "'",
      '&rsquo;': "'",
      '&amp;': '&',
      '&nbsp;': ' ',
      '&hellip;': '...',
      '&ndash;': '-',
      '&mdash;': '--',
      '&lt;': '<',
      '&gt;': '>',
      '&copy;': '©',
      '&reg;': '®',
      '&trade;': '™',
      '&euro;': '€',
      '&pound;': '£',
      '&yen;': '¥',
      '&cent;': '¢',
      '&sect;': '§',
      '&para;': '¶',
      '&deg;': '°',
      '&plusmn;': '±',
      '&sup2;': '²',
      '&sup3;': '³',
      '&frac14;': '¼',
      '&frac12;': '½',
      '&frac34;': '¾',
      '&times;': '×',
      '&divide;': '÷',
      '&micro;': 'µ',
      '&middot;': '·',
      '&bull;': '•',
    };

    // Replace HTML tags and entities with plain text
    String plainText = html;
    htmlToPlainText.forEach((key, value) {
      plainText = plainText.replaceAll(key, value);
    });

    // Remove any remaining HTML tags
    plainText = plainText.removeHtmlTag;

    return plainText;
  }

  /// Check if the given JSON data matches the structure defined in a model file.
  ///
  /// The [path] parameter is the path to the model file, which should be placed in the assets/models directory.
  /// The [jsonData] parameter is the JSON data to be checked against the model.
  /// The optional [ignoreNull] parameter determines whether to ignore null values in the JSON data (default: false).
  ///
  /// Example usage:
  /// ```dart
  /// String modelPath = 'users.json'; // The path to the model file
  /// Map<String, dynamic> jsonData = {'id': 1, 'name': 'John Doe'}; // The JSON data to be checked
  ///
  /// bool isModelValid = await Utils.checkModel(modelPath, jsonData);
  /// if (isModelValid) {
  ///   print('The model is valid.');
  /// } else {
  ///   print('The model is not valid.');
  /// }
  /// ```
  ///
  /// The method loads the model file from the assets/models directory and compares it with the provided JSON data.
  /// It checks if all the keys in the JSON data exist in the model and if their types match.
  /// If there are missing keys or wrong types, it logs the corresponding error messages.
  /// If the JSON data matches the model structure, it logs a success message indicating that the model is valid.
  /// The method returns a boolean value indicating whether the model is valid or not.
  static Future<bool> checkModel(String path, Map<String, dynamic> jsonData,
      {bool ignoreNull = false}) async {
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
          String modelType = colorize(
              model[e.keys.first].runtimeType.toString(), LogColor.yellow);
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
          message +=
              'You have ${wrongType.length} wrong type of data :\n$wrong';
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

  /// Scrolls the [controller] to the center of the widget identified by [key].
  ///
  /// The [screenWidth] is used to calculate the center position of the widget.
  /// The function first checks whether the widget can be found in the tree.
  /// If it exists, it gets the width of the widget and its horizontal position in the global coordinate space.
  /// It then calculates the desired scroll position to bring the widget to the center of the screen.
  ///
  /// If the desired position is less than 0, it scrolls to the start of the scroll view.
  /// If it's greater than the maximum scroll extent, it scrolls to the end.
  /// Otherwise, it scrolls to the calculated position.
  ///
  /// Example usage:
  /// ```dart
  /// scrollToWidget(myKey, myController, MediaQuery.of(context).size.width);
  /// ```
  static void scrollToWidget(
      GlobalKey key, ScrollController controller, double screenWidth) {
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
}
