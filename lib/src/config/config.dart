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

/// A utility class for configuring lazy UI settings and styles.
class LazyUi {
  /// The default font style.
  static TextStyle get font => _defaultTextStyle;

  /// The default icon type.
  static IconType get iconType => _defaultIconType;

  /// The default spacing value.
  static double get space => _defaultSpace;

  /// The default border radius value.
  static double get radius => _defaultRadius;

  /// Initializes LazyUi with optional configuration parameters.
  static void init({
    AppTheme theme = AppTheme.light,
    TextStyle? font,
    IconType? icon,
    double? space,
    double? radius,
    bool alwaysPortrait = true,
  }) {
    WidgetsFlutterBinding.ensureInitialized();

    // Set app theme
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
      Utils.orientation([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    }

    _defaultTextStyle = font ?? GoogleFonts.nunitoSans(fontSize: 15.5);
    _defaultIconType = icon ?? IconType.tablerIcon;
    _defaultSpace = space ?? _defaultSpace;
    _defaultRadius = radius ?? _defaultRadius;

    // This callback function handles Flutter errors.
    // If the error occurs in the image resource service and is a 404 error (image not found),
    // it silently ignores the error. Otherwise, it presents the error to the user.
    FlutterError.onError = (FlutterErrorDetails details) {
      if (details.library == 'image resource service' && details.exception.toString().contains('404')) {
        return;
      }

      FlutterError.presentError(details);
    };
  }

  /// Builds a widget with lazy UI configurations applied.
  ///
  /// - [context]: The build context.
  /// - [child]: The child widget.
  /// - [maxScalingFontSize]: Maximum font scaling factor.
  /// - [useLzToast]: Whether to use LazyToast overlay.
  static Widget builder(BuildContext context, Widget? child, {double? maxScalingFontSize, bool useLzToast = true}) {
    _defaultTextStyle = _getFontStyle(context);

    double maxScalingFactor = MediaQuery.textScalerOf(context).scale(1);

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
          textScaler: TextScaler.linear(
              maxScalingFontSize != null ? maxScalingFactor : maxScalingFactor.clamp(1.0, maxScalingFontSize ?? 1))),
      child: useLzToast
          ? LzToastOverlay(child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), child: child))
          : child ?? const SizedBox.shrink(),
    );
  }
}

TextStyle _getFontStyle(BuildContext context) {
  TextStyle? style = Theme.of(context).textTheme.bodyMedium;
  return _defaultTextStyle.copyWith(color: style?.color);
}
