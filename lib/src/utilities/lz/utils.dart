import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/theme/color.dart';

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
  static Future<void> copy(String? text, [String? message]) async {
    await Clipboard.setData(ClipboardData(text: text.toString()));

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

  /// Sets the system navigation bar and status bar UI based on the given theme mode.
  ///
  /// This method updates the system UI overlay style, modifying the navigation bar color,
  /// icon brightness, and status bar appearance.
  static void navbarUi({ThemeMode? theme, Color? color}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: null,
      statusBarColor: const Color.fromARGB(0, 184, 174, 174),
      systemNavigationBarDividerColor: null,
      systemNavigationBarColor: color ??
          (theme == ThemeMode.dark ? darkBackgroundColor : backgroundColor),
    ));
  }
}

class Date {
  /// Calculates the number of full days between two dates.
  ///
  /// If either `start` or `end` is `null`, the function returns `0`.
  /// The difference is calculated based on full days, ignoring hours, minutes, and seconds.
  ///
  /// ### Example:
  ///
  /// ```dart
  /// DateTime startDate = DateTime(2024, 2, 1);
  /// DateTime endDate = DateTime(2024, 2, 10);
  /// int days = daysBetween(startDate, endDate);
  /// print(days); // Output: 9
  /// ```
  ///
  /// - [start]: The starting date.
  /// - [end]: The ending date.
  /// - Returns the number of full days between `start` and `end`.
  static int daysBetween(DateTime? start, DateTime? end) {
    if (start == null || end == null) {
      return 0;
    }

    Duration difference = end.difference(start);
    int daysLeft = difference.inDays;

    return daysLeft;
  }

  /// Calculates the exact age from a given birth date to the current date,
  /// including years, months, days, hours, minutes, and seconds.
  ///
  /// The method accounts for negative values and adjusts the components accordingly.
  ///
  /// - [birthDate]: The `DateTime` representing the birth date.
  ///
  /// Returns an `Age` object containing the detailed breakdown of age.
  static Age calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();

    int year = currentDate.year - birthDate.year;
    int month = currentDate.month - birthDate.month;
    int day = currentDate.day - birthDate.day;
    int hour = currentDate.hour - birthDate.hour;
    int minute = currentDate.minute - birthDate.minute;
    int second = currentDate.second - birthDate.second;

    // Adjust for negative values
    if (second < 0) {
      second += 60;
      minute--;
    }
    if (minute < 0) {
      minute += 60;
      hour--;
    }
    if (hour < 0) {
      hour += 24;
      day--;
    }
    if (day < 0) {
      final previousMonth = DateTime(currentDate.year, currentDate.month, 0);
      day += previousMonth.day;
      month--;
    }
    if (month < 0) {
      month += 12;
      year--;
    }

    return Age(
      year: year,
      month: month,
      day: day,
      hour: hour,
      minute: minute,
      second: second,
    );
  }

  /// Returns a human-readable string representing the time difference between two dates.
  ///
  /// - [fromDate]: The earlier date.
  /// - [toDate]: The later date.
  ///
  /// The output will be formatted as:
  /// - "Today" if the dates are the same.
  /// - "Yesterday" if the difference is one day.
  /// - "{x} days ago" if the difference is less than a week.
  /// - "{x} weeks ago" if the difference is less than a month.
  /// - "{x} months ago" if the difference is less than a year.
  /// - "{x} years ago" or "{x} years and {y} months ago" if more than a year.
  ///
  /// Returns a formatted `String` describing how long ago `fromDate` was relative to `toDate`.
  static String timeAgo(DateTime fromDate, DateTime toDate) {
    // Extract only the date (ignoring time)
    DateTime fromDateOnly =
        DateTime(fromDate.year, fromDate.month, fromDate.day);
    DateTime toDateOnly = DateTime(toDate.year, toDate.month, toDate.day);

    int daysDifference = toDateOnly.difference(fromDateOnly).inDays;

    if (daysDifference == 0) {
      return "Today";
    } else if (daysDifference == 1) {
      return "Yesterday";
    } else if (daysDifference < 7) {
      return "$daysDifference days ago";
    } else if (daysDifference < 30) {
      int weeks = (daysDifference / 7).floor();
      return "$weeks weeks ago";
    } else if (daysDifference < 365) {
      int months = (daysDifference / 30).floor();
      return "$months months ago";
    } else {
      int years = (daysDifference / 365).floor();
      int remainingMonths = ((daysDifference % 365) / 30).floor();
      if (remainingMonths > 0) {
        return "$years years and $remainingMonths months ago";
      } else {
        return "$years years ago";
      }
    }
  }

  /// Checks if the given year is a leap year.
  ///
  /// - [year]: The year to check.
  /// - Returns `true` if the year is a leap year, otherwise `false`.
  static bool isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }
}

class Age {
  final int year;
  final int month;
  final int day;
  final int hour;
  final int minute;
  final int second;

  Age({
    this.year = 0,
    this.month = 0,
    this.day = 0,
    this.hour = 0,
    this.minute = 0,
    this.second = 0,
  });

  @override
  String toString() {
    return '$year years, $month months, $day days, $hour hours, $minute minutes, $second seconds';
  }
}
