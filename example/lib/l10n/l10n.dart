import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('id'),
  ];
}

extension LangContextExtension on BuildContext {
  AppLocalizations get lang => AppLocalizations.of(this)!;
}

/// ``` dart
/// // import:
/// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
/// import 'package:flutter_localizations/flutter_localizations.dart';
/// ```
///
///
/// ``` dart
/// // usage:
/// MaterialApp(
///   localizationsDelegates: const [
///     AppLocalizations.delegate,
///     GlobalMaterialLocalizations.delegate,
///     GlobalWidgetsLocalizations.delegate,
///     GlobalCupertinoLocalizations.delegate,
///   ],
///   supportedLocales: [
///     Locale('en'),
///     Locale('id'),
///   ],
///   locale: Locale('en')
/// );
/// ```
class L10nNotifier extends ChangeNotifier {
  Locale lang = Locale('en');

  void changeLanguage(Locale data) {
    lang = data;
    notifyListeners();
  }
}

final li10 = L10nNotifier();

// example:
// Text(context.lang.welcome_message),

// set lang: li10.changeLanguage(Locale('id'))
