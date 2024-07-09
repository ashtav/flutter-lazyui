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
  ///
  /// This method, by default, runs `WidgetsFlutterBinding.ensureInitialized()`.
  ///
  /// - [theme]: The theme mode for the app.
  /// - [style]: The default style configuration.
  /// - [alwaysPortrait]: Whether to enforce portrait mode.
  static void init({
    AppTheme theme = AppTheme.light,
    LzStyle? style,
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
      Utils.orientation(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    }

    _defaultTextStyle = style?.font ?? GoogleFonts.nunitoSans(fontSize: 15.5);
    _defaultIconType = style?.icon ?? IconType.tablerIcon;
    _defaultSpace = style?.space ?? _defaultSpace;
    _defaultRadius = style?.radius ?? _defaultRadius;
  }

  /// Builds a widget with lazy UI configurations applied.
  ///
  /// - [context]: The build context.
  /// - [child]: The child widget.
  /// - [maxScalingFontSize]: Maximum font scaling factor.
  /// - [useLzToast]: Whether to use LazyToast overlay.
  static Widget builder(BuildContext context, Widget? child,
      {double? maxScalingFontSize, bool useLzToast = true}) {
    _defaultTextStyle = _getFontStyle(context);

    double maxScalingFactor = MediaQuery.of(context).textScaleFactor;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
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

/// A class for configuring custom styles in LazyUi.
///
/// This class allows you to customize various UI elements within the LazyUi
/// framework, including font styles, border radii, spacing, and icon types.
class LzStyle {
  /// The font style to be used.
  ///
  /// This can be any [TextStyle] object. If not specified, the default
  /// font style defined in LazyUi will be used.
  final TextStyle? font;

  /// The border radius value to be used.
  ///
  /// This is a double value representing the radius of borders. If not
  /// specified, the default border radius defined in LazyUi will be used.
  final double? radius;

  /// The spacing value to be used.
  ///
  /// This is a double value representing the spacing between UI elements.
  /// If not specified, the default spacing defined in LazyUi will be used.
  final double? space;

  /// The icon type to be used.
  ///
  /// This can be any [IconType] object. If not specified, the default
  /// icon type defined in LazyUi will be used.
  final IconType? icon;

  /// Creates an instance of [LzStyle].
  ///
  /// You can specify custom values for [font], [radius], [space], and [icon].
  /// If any of these values are not specified, the defaults defined in LazyUi
  /// will be used.
  ///
  /// Example:
  /// ```dart
  /// LzStyle(
  ///   font: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  ///   radius: 10.0,
  ///   space: 15.0,
  ///   icon: IconType.tablerIcon,
  /// );
  /// ```
  const LzStyle({
    this.font,
    this.radius,
    this.space,
    this.icon,
  });
}
