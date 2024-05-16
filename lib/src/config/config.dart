import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazyui/src/constants/enum.dart';
import 'package:lazyui/src/widgets/lztoast/src/loading.dart';

import '../utils/util.dart';

TextStyle _defaultTextStyle = const TextStyle();
IconType _defaultIconType = IconType.tablerIcon;
double _defaultSpace = 20.0;
double _defaultRadius = 7.0;

class LazyUi {
  static TextStyle get font => _defaultTextStyle;
  static IconType get iconType => _defaultIconType;
  static double get space => _defaultSpace;
  static double get radius => _defaultRadius;

  static void config(
      {AppTheme theme = AppTheme.light,
      IconType icon = IconType.tablerIcon,
      TextStyle? font,
      double? space,
      double? radius,
      bool alwaysPortrait = true}) {
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

    _defaultTextStyle = font ?? GoogleFonts.nunitoSans(fontSize: 15.5);
    _defaultIconType = icon;
    _defaultSpace = space ?? _defaultSpace;
    _defaultRadius = radius ?? _defaultRadius;
  }

  static Widget builder(BuildContext context, Widget? child,
      {double? maxScalingFontSize, bool useLzToast = true}) {
    _defaultTextStyle = _getFontStyle(context);

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
      child: useLzToast
          ? LzToastOverlay(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), child: child))
          : child ?? const SizedBox.shrink(),
    );
  }
}

TextStyle _getFontStyle(BuildContext context) {
  TextStyle? style = Theme.of(context).textTheme.bodyMedium;
  return _defaultTextStyle.copyWith(color: style?.color);
}
