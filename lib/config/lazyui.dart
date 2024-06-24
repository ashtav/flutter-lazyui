import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazyui/src/enums/enum.dart';
import 'package:lazyui/src/utils/log.dart';
import 'package:lazyui/src/utils/utils.dart';

TextStyle _defaultTextStyle = const TextStyle();

class LazyUi {
  static void init({AppTheme? theme}) {
    WidgetsFlutterBinding.ensureInitialized();

    _defaultTextStyle = GoogleFonts.nunitoSans(fontSize: 15.5);

    // set app theme
    Utils.setSystemUI(
        navBarColor: theme == AppTheme.dark ? Colors.black : Colors.white);
    logg('LazyUI has been initialized.');
  }

  static TextStyle get font => _defaultTextStyle;
}
