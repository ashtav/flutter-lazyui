import 'package:flutter/material.dart';

import 'src/colors/color.dart';
import 'src/config/config.dart';
import 'src/dialogs/confirmation.dart';
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
  static LzDialog get dialog => LzDialog();
}

class LazyUi {
  static void init({TextStyle? font, IconType? icon}) {
    WidgetsFlutterBinding.ensureInitialized();

    // set configuration
    config = LazyConfig(font: font);
  }
}
