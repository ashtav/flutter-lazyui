import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazyui/src/constants/enum.dart';

import '../constants/color.dart';
import '../utils/utils.dart';
import '../widgets/lazytoast/lazytoast.dart';

TextStyle? _defaultTextStyle;
IconType _defaultIconType = IconType.tablerIcon;
double _defaultSpace = 20.0;
double _defaultRadius = 7.0;

/// `LazyUi` is a utility class in the LazyUI framework providing a set of configurable
/// defaults and utilities for Flutter UI development.
///
/// This class allows for easy configuration and standardization of styles such as
/// text, icons, spacing, and corner radii across the app.
///
/// Example usage:
/// ```dart
/// LazyUi.config(
///   theme: AppTheme.dark,
///   icon: IconType.materialIcon,
///   font: GoogleFonts.roboto(fontSize: 16.0, color: Colors.black),
///   space: 15.0,
///   radius: 10.0,
///   alwaysPortrait: true
/// );
/// ```
class LazyUi {
  /// Returns the default text style for the app. If not set, it defaults to Nunito Sans font style.
  static TextStyle get font =>
      _defaultTextStyle ??
      GoogleFonts.nunitoSans(fontSize: 15.5, color: LzColors.black);

  /// Returns the default icon type set for the app. The default is [IconType.tablerIcon].
  static IconType get iconType => _defaultIconType;

  /// Returns the default spacing value used throughout the app. The default is 20.0.
  static double get space => _defaultSpace;

  /// Returns the default radius for rounded corners in the app. The default is 7.0.
  static double get radius => _defaultRadius;

  /// Configures the global settings for the app, including theme, icon type, font style, spacing, and radius.
  ///
  /// [theme]: The overall theme of the application (dark or light).
  /// [icon]: The default icon style for the app.
  /// [font]: The default text style for the app.
  /// [space]: The default spacing value.
  /// [radius]: The default radius for rounded corners.
  /// [alwaysPortrait]: Forces the app to always display in portrait mode if set to true.
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

    _defaultTextStyle = font;

    _defaultIconType = icon;

    _defaultSpace = space ?? _defaultSpace;

    _defaultRadius = radius ?? _defaultRadius;
  }

  /// A builder function that wraps the provided [child] widget with a `MediaQuery` and optionally with `LzToastOverlay`.
  ///
  /// This function allows for fine control over the text scaling factor and the usage of the LazyToast feature.
  ///
  /// [context]: The build context.
  /// [child]: The widget to be wrapped and displayed.
  /// [maxScalingFontSize]: The maximum font size scaling factor. If provided, scales text up to this maximum value.
  /// [useLazyToast]: If true, wraps the [child] with `LzToastOverlay` for toast notifications.
  static Widget builder(BuildContext context, Widget? child,
      {double? maxScalingFontSize, bool useLazyToast = true}) {
    // ignore: deprecated_member_uselzf
    double maxScalingFactor = MediaQuery.of(context).textScaleFactor;

    //   data: MediaQuery.of(context).copyWith(
    //   textScaler: maxScalingFontSize == null
    //       ? TextScaler.noScaling
    //       : TextScaler.linear(maxScalingFontSize),
    // ),

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        // ignore: deprecated_member_use
        textScaleFactor: maxScalingFontSize == null
            ? maxScalingFactor
            : maxScalingFactor.clamp(1.0, maxScalingFontSize),
      ),
      child: useLazyToast
          ? LzToastOverlay(child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), child: child))
          : child ?? const SizedBox.shrink(),
    );
  }
}
