import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lazyui/src/utils/log.dart';
import 'package:stack_trace/stack_trace.dart';

class Utils {
  static void errorCatcher(Object e, StackTrace s, {bool verbose = false}) {
    final frames = Trace.from(s).terse.frames;
    final location = verbose
        ? frames.take(5).map((e) => '${e.member ?? 'Unknown'}(${e.line}:${e.column})').join(', ')
        : '${frames.isNotEmpty ? frames[1].member : 'Unknown location'} (Line ${frames.isNotEmpty ? frames[1].line : 'Unknown'})';
    logg('-- Error on $location, $e', name: 'ERROR');
  }

  static void setSystemUI({
    Brightness brightness = Brightness.dark,
    Color? statusBarColor,
    Color? navDividerColor,
    Brightness? navBarIconColor,
    Color? navBarColor,
  }) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: navBarIconColor ?? Brightness.dark,
      statusBarIconBrightness: brightness,
      statusBarColor: statusBarColor ?? Colors.transparent,
      systemNavigationBarDividerColor: navDividerColor,
      systemNavigationBarColor: navBarColor,
    ));
  }
}
