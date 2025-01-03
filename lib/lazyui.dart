import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'src/colors/color.dart';
import 'src/config/config.dart';
import 'src/icons/icons.dart';
import 'src/models/lazy_config.dart';

export 'src/extensions/extension.dart';
export 'src/icons/icons.dart';
export 'src/models/icon_style.dart';
export 'src/theme/font.dart';
export 'src/theme/theme.dart';
export 'src/utilities/utilities.dart';
export 'src/widgets/widget.dart';

class Lz {
  static LzColor get color => LzColor();
}

class LazyUi {
  static void init(
      {TextStyle? font,
      IconType icon = IconType.huge,
      String? locale,
      bool alwaysPortrait = true,
      bool backBlur = true}) {
    WidgetsFlutterBinding.ensureInitialized();

    // Set configuration
    config = LazyConfig(font: font, icon: icon, locale: locale, backBlur: backBlur);

    // Initialize locale for date formatting if provided
    if (locale != null) {
      initializeDateFormatting(locale);
    }

    // Lock device orientation to portrait if alwaysPortrait is true
    if (alwaysPortrait) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    }

    // Override default Flutter error handler for specific cases (e.g., image resource errors)
    FlutterError.onError = (FlutterErrorDetails details) {
      if (details.library == 'image resource service' || details.exception.toString().contains('404')) {
        return;
      }

      FlutterError.presentError(details);
    };
  }
}
