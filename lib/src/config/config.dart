import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:lazyui/src/constants/enum.dart';
import 'package:lazyui/src/widgets/feedback/lztoast/src/loading.dart';

import '../utils/util.dart';

/// Default text style used throughout the application.
TextStyle _defaultTextStyle = const TextStyle();

/// Default icon type used throughout the application.
IconType _defaultIconType = IconType.tabler;

/// Default border radius used in the UI components.
double _defaultRadius = 7.0;

/// A utility class to manage theme, font, and icon settings for the LazyUi package.
class LazyUi {
  /// Returns the default text style used in the app.
  static TextStyle get font => _defaultTextStyle;

  /// Returns the default icon type used in the app.
  static IconType get iconType => _defaultIconType;

  /// Returns the default spacing value used in the app.

  /// Returns the default border radius used in the app.
  static double get radius => _defaultRadius;

  /// Initializes the LazyUi with optional parameters to customize theme, font, icon, space, radius, orientation, and locale.
  ///
  /// Parameters:
  /// - [font]: Custom [TextStyle] for the font, default is `Nunito Sans` with font size 15.5.
  /// - [icon]: Custom [IconType] for the icons, default is [IconType.tablerIcon].
  /// - [radius]: Custom border radius value, default is 7.0.
  /// - [alwaysPortrait]: Boolean to lock orientation to portrait mode, default is `true`.
  /// - [locale]: Optional locale for date formatting.
  static void init(
      {TextStyle? font,
      IconType? icon,
      double? radius,
      bool alwaysPortrait = true,
      String? locale}) {
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize locale for date formatting if provided
    if (locale != null) {
      initializeDateFormatting(locale);
    }

    // Lock device orientation to portrait if alwaysPortrait is true
    if (alwaysPortrait) {
      Utils.orientation(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    }

    // Set default values for font, icon, space, and radius if they are not provided
    _defaultTextStyle = font ?? GoogleFonts.nunitoSans(fontSize: 15.5);
    _defaultIconType = icon ?? IconType.tabler;
    _defaultRadius = radius ?? _defaultRadius;

    // Override default Flutter error handler for specific cases (e.g., image resource errors)
    FlutterError.onError = (FlutterErrorDetails details) {
      if (details.library == 'image resource service' ||
          details.exception.toString().contains('404')) {
        return;
      }

      FlutterError.presentError(details);
    };
  }

  /// Wraps the app's widget tree with configurations like font scaling and toast overlay.
  ///
  /// Parameters:
  /// - [context]: The [BuildContext] used to retrieve current theme and settings.
  /// - [child]: The main widget of the app to be displayed.
  /// - [maxScalingFontSize]: The maximum font scaling factor.
  /// - [useLzToast]: Whether to use LazyUi's toast system, default is `true`.
  ///
  /// Returns a widget that applies media query adjustments and optional toast overlay.
  static Widget builder(BuildContext context, Widget? child,
      {double? maxScalingFontSize}) {
    TextStyle? style = Theme.of(context).textTheme.bodyMedium;
    style = style?.copyWith(color: style.color);

    _defaultTextStyle = style!;

    // Get the text scaling factor based on device settings
    double maxScalingFactor = MediaQuery.textScalerOf(context).scale(1);

    return MediaQuery(
        data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(maxScalingFontSize != null
                ? maxScalingFactor
                : maxScalingFactor.clamp(1.0, maxScalingFontSize ?? 1))),
        child: LzToastOverlay(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), child: child)));
  }
}
