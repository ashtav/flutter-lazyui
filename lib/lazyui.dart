import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:lazyui/lazyui.dart';

import 'src/config/config.dart';
import 'src/models/lazy_config.dart';
import 'src/utilities/lz/color.dart';
import 'src/utilities/lz/file.dart';

export 'package:google_fonts/google_fonts.dart';

export 'src/extensions/extension.dart';
export 'src/icons/icons.dart';
export 'src/models/icon_style.dart';
export 'src/theme/font.dart';
export 'src/theme/theme.dart';
export 'src/utilities/utilities.dart';
export 'src/widgets/widget.dart';

/// The `Lz` class provides convenient static accessors for commonly used utilities in the package.
///
/// - [color]: Returns an instance of [LzColor] for color-related utilities.
/// - [file]: Returns an instance of [Files] for file-related operations.
class Lz {
  static LzColor get color => LzColor();
  static Files get file => Files();
}

/// Initializes the LazyUi package with optional configuration parameters.
///
/// - [font]: The default [TextStyle] to be used throughout the application.
/// - [icon]: The default [IconType] to be used. Defaults to [IconType.huge].
/// - [locale]: The locale to be used for localization purposes.
/// - [alwaysPortrait]: If true, the application will be locked in portrait mode. Defaults to true.
/// - [backBlur]: If true, enables background blur effects. Defaults to true.
/// - [primaryColor]: The primary [Color] to be used for theming.
class LazyUi {
  static void init(
      {TextStyle? font,
      IconType icon = IconType.huge,
      String? locale,
      bool alwaysPortrait = true,
      bool backBlur = true,
      Color? primaryColor}) {
    WidgetsFlutterBinding.ensureInitialized();

    // Set configuration
    config = LazyConfig(
        font: font,
        icon: icon,
        locale: locale,
        backBlur: backBlur,
        primaryColor: primaryColor ?? Colors.blueAccent);

    // Initialize locale for date formatting if provided
    if (locale != null) {
      initializeDateFormatting(locale);
    }

    // Lock device orientation to portrait if alwaysPortrait is true
    if (alwaysPortrait) {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    }

    // Override default Flutter error handler for specific cases (e.g., image resource errors)
    FlutterError.onError = (FlutterErrorDetails details) {
      if (details.library == 'image resource service' ||
          details.exception.toString().contains('404')) {
        return;
      }

      FlutterError.presentError(details);
    };
  }
}

/// A widget that constrains the text scaling factor to a maximum value.
///
/// This widget is useful when you want to limit how much text scales
/// based on the user's device settings. It ensures that the text scaling
/// does not exceed the specified [max] value.
///
/// Example usage:
/// ```dart
/// FontScaling(
///   max: 1.2,
///   child: Text('This text scaling is limited to 1.2x'),
/// )
/// ```
class FontScaling extends StatelessWidget {
  /// The maximum text scaling factor allowed.
  ///
  /// If `null`, there is no limit, and the system's text scaling factor is used.
  final double? max;

  /// The child widget that will inherit the modified text scaling settings.
  final Widget? child;

  /// Creates a [FontScaling] widget.
  ///
  /// The [max] parameter specifies the maximum allowed text scaling factor.
  /// Defaults to `1.0`.
  const FontScaling({super.key, this.max = 1, this.child});

  @override
  Widget build(BuildContext context) {
    // Get the text scaling factor based on device settings
    double maxScalingFactor = MediaQuery.textScalerOf(context).scale(1);

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: TextScaler.linear(
          max != null
              ? maxScalingFactor.clamp(1.0, max ?? 1)
              : maxScalingFactor,
        ),
      ),
      child: child ?? const SizedBox.shrink(),
    );
  }
}
