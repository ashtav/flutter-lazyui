import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazyui/src/constants/enum.dart';

import '../constants/color.dart';
import '../utils/utils.dart';
import '../widgets/lazytoast/lazytoast.dart';

// variables
TextStyle? _defaultTextStyle;
IconType _defaultIconType = IconType.tablerIcon;
double _defaultSpace = 20.0;
double _defaultRadius = 7.0;

// lazy ui
class LazyUi {
  // get default text style
  static TextStyle get font =>
      _defaultTextStyle ??
      GoogleFonts.nunitoSans(fontSize: 15.5, color: LzColors.black);

  // get default icon type
  static IconType get iconType => _defaultIconType;

  // get default spacing
  static double get space => _defaultSpace;

  // get default radius
  static double get radius => _defaultRadius;

  /// Initialize configurations for the application.
  ///
  /// This function allows you to configure various aspects of the application, including
  /// the theme, icon type, default font style, spacing, radius, and orientation behavior.
  ///
  /// - [theme]: The application theme to set. It can be [AppTheme.light] or [AppTheme.dark].
  ///   Setting the theme will also adjust the system UI elements accordingly.
  ///
  /// - [icon]: The default icon type to use throughout the application. You can specify
  ///   [IconType.tablerIcon] or another appropriate value.
  ///
  /// - [font]: An optional TextStyle to set as the default text style for the application.
  ///
  /// - [space]: An optional value to set as the default spacing between elements.
  ///
  /// - [radius]: An optional value to set as the default border radius for elements.
  ///
  /// - [alwaysPortrait]: A flag to determine whether the application should always be in portrait
  ///   orientation. If set to true, the application will lock into portrait mode.

  static void config(
      {AppTheme theme = AppTheme.light,
      IconType icon = IconType.tablerIcon,
      TextStyle? font,
      double? space,
      double? radius,
      bool alwaysPortrait = false}) {
    // set app theme
    switch (theme) {
      case AppTheme.dark:
        Utils.setSystemUI(navBarColor: Colors.black);
        break;

      case AppTheme.light:
        Utils.setSystemUI(navBarColor: Colors.white);
        break;
      default:
        Utils.setSystemUI();
    }

    if (alwaysPortrait) {
      Utils.orientation(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    }

    // set default text style
    _defaultTextStyle = font;

    // set default icon type
    _defaultIconType = icon;

    // set default spacing
    _defaultSpace = space ?? _defaultSpace;

    // set default radius
    _defaultRadius = radius ?? _defaultRadius;
  }

  /// A utility function to build a widget with text scaling and optional toast overlay.
  ///
  /// This function takes a [BuildContext] [context], a [Widget] [widget], an optional
  /// [maxScalingFontSize], and an optional [useLazyToast] flag to customize the behavior
  /// of the widget.
  ///
  /// - [context]: The build context for the widget.
  /// - [widget]: The widget to wrap or modify. If not provided, it defaults to [SizedBox.shrink()].
  /// - [maxScalingFontSize]: The maximum font size for text scaling within the widget.
  ///   If not provided, text scaling is disabled.
  /// - [useLazyToast]: A flag to determine whether to use lazy toast overlay. If set to true,
  ///   a [LzToastOverlay] is applied to the widget. The default value is true.
  ///
  /// Returns a [MediaQuery] widget with the specified configurations and the provided
  /// child widget (or [SizedBox.shrink()] if no child widget is provided).
  ///
  /// Example Usage:
  ///
  /// ```dart
  /// return MaterialApp(
  ///    builder: (BuildContext context, Widget? widget) {
  ///      // use LazyUi.builder to wrap your widget
  ///      // so that you can use LzToast, setting maxScalingFontSize
  ///      return LazyUi.builder(context, widget, maxScalingFontSize: 1.1);
  ///    },
  /// );
  /// ```
  ///
  /// In this example, the [builder] function is used to create a widget with custom text scaling
  /// and without lazy toast overlay.
  ///
  /// Notes:
  ///
  /// - The [builder] function is typically used to customize the behavior of a widget based
  ///   on the provided parameters, such as controlling text scaling or adding a toast overlay.
  ///
  /// - You can adjust the [maxScalingFontSize] parameter to control the maximum font size for text
  ///   within the widget when text scaling is enabled.
  ///
  /// - The [useLazyToast] parameter allows you to toggle the use of lazy toast overlay, which may
  ///   affect the visual presentation of the widget.

  static Widget builder(BuildContext context, Widget? widget,
      {double? maxScalingFontSize, bool useLazyToast = true}) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: maxScalingFontSize == null
            ? TextScaler.noScaling
            : TextScaler.linear(maxScalingFontSize),
      ),
      child: useLazyToast
          ? LzToastOverlay(child: widget)
          : widget ?? const SizedBox.shrink(),
    );
  }
}
