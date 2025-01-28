import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lazyui/lazyui.dart';

import '../../models/device.dart';

DateTime get now => DateTime.now();

class Utils {
  Utils._();
  static final Utils instance = Utils._();

  /// Checks if the scroll position of the given [scrollController] has reached a specified maximum position.
  ///
  /// This method determines whether the current scroll position is at or beyond a defined maximum threshold.
  /// The [scrollController] parameter is the `ScrollController` to be checked.
  /// The [max] parameter defines the maximum scroll position thresholds. It can be either a single value
  /// representing a uniform threshold for both ends of the scroll view, or a list of two values
  /// specifying separate thresholds for the top and bottom of the scroll view.
  ///
  /// Example usage:
  /// ```dart
  /// ScrollController controller = ScrollController();
  /// bool hasMaxPosition = Utils.scrollHasMax(controller, [20, 50]);
  /// if (hasMaxPosition) {
  ///   // Actions to perform when the scroll position reaches the maximum position
  /// }
  /// ```
  ///
  /// The method interprets a single value as the threshold for both ends, and a list of two values
  /// as individual thresholds for the top (first value) and bottom (second value) of the scroll view.
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

  /// Fetches various pieces of information about the device.
  ///
  /// This function utilizes the `DeviceInfoPlugin` to gather device-specific
  /// information for either Android or iOS devices. The information collected
  /// includes the brand, model, system version, SDK version, and a unique identifier.
  ///
  /// Returns a [Device] object that holds the gathered information.
  ///
  /// Example usage:
  /// ```dart
  /// Device deviceInfo = await getDevice();
  /// print("Brand: ${deviceInfo.brand}");
  /// print("Model: ${deviceInfo.model}");
  /// print("System Version: ${deviceInfo.system}");
  /// print("SDK Version: ${deviceInfo.sdk}");
  /// print("Unique ID: ${deviceInfo.id}");
  /// ```
  ///
  /// This function requires the `DeviceInfoPlugin`, which needs to be imported and initialized.
  ///
  /// The unique identifier is platform-dependent:
  /// - On Android, it uses the `id` field from `AndroidDeviceInfo`.
  /// - On iOS, it uses the `identifierForVendor` field from `IosDeviceInfo`.
  ///
  /// Note: On iOS, the `identifierForVendor` will change if all apps from the same vendor are uninstalled.
  static Future<Device> getDevice() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? brand, model, system, sdk, id;

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      brand = androidInfo.brand.ucwords;
      model = androidInfo.model;
      system = androidInfo.version.release;
      sdk = androidInfo.version.sdkInt.toString();
      id = androidInfo.id;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

      brand = iosInfo.name;
      model = iosInfo.model;
      system = iosInfo.systemName;
      sdk = iosInfo.systemVersion;
      id = iosInfo.identifierForVendor;
    }

    return Device(brand: brand, model: model, system: system, sdk: sdk, id: id);
  }

  /// Converts a local phone number to an international format with the specified prefix.
  static String prefixPhone(String? phone, {String prefix = '62'}) {
    final cleanedPhone = phone?.replaceAll(RegExp(r'\D'), '') ?? '';
    return cleanedPhone.startsWith('0')
        ? '$prefix${cleanedPhone.substring(1)}'
        : cleanedPhone.startsWith(prefix)
            ? cleanedPhone
            : '$prefix$cleanedPhone';
  }

  /// Generate a random number within the specified range.
  /// The [min] and [max] parameters define the range of the random number.
  /// The function returns a random number within the specified range.
  /// The type of the returned value is the same as the type of the [min] and [max] parameters.
  /// Example usage:
  /// ```dart
  /// int randomInt = Utils.rangeOf(1, 10);
  /// double randomDouble = Utils.rangeOf<double>(1.0, 10.0);
  /// ```
  static T rangeOf<T>(T min, T max) {
    if (min is int && max is int) {
      return Random().nextInt(max - min) + min as T;
    } else if (min is double && max is double) {
      return Random().nextDouble() * (max - min) + min as T;
    } else {
      return min;
    }
  }

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

  /// Copy the specified [text] to the clipboard.
  ///
  /// Returns a [Future<bool>] indicating whether the text was successfully copied.
  ///
  /// Example usage:
  /// ```dart
  /// Utils.copy('YOUR TEXT');
  /// ```
  static Future<void> copy(String text, [String? message]) async {
    await Clipboard.setData(ClipboardData(text: text));

    if (message != null) {
      Toast.show(message);
    }
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
}
