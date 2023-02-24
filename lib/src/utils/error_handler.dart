import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:lazyui/lazyui.dart';

Map<String, dynamic> _errorConfig = {
  'bot': {'token': '', 'chat_id': '', 'active': true},
  'track_device': true,
};

class Errors {
  static void config({String? botToken, String? chatId, bool useBot = true, bool trackDevice = true}) {
    try {
      _errorConfig['bot']['token'] = botToken;
      _errorConfig['bot']['chat_id'] = chatId;
      _errorConfig['bot']['active'] = useBot;

      _errorConfig['track_device'] = trackDevice;
    } catch (e, s) {
      Utils.errorCatcher(e, s);
    }
  }

  static check(e, StackTrace s, {bool track = false, bool disabledBot = false}) async {
    try {
      // ---------------------------------------------------------------------
      // Check Errors Caused by Internet Connection

      List<String> failsNetwork = ['SocketException', 'Failed host lookup', 'NetworkException'];
      String? errorMessage;

      if (failsNetwork.any((n) => e.toString().contains(n))) {
        logg('Network error, $e', name: 'ERROR');
      } else {
        // ---------------------------------------------------------------------
        // Check Errors Caused by Code, Etc

        final frames = Trace.from(s).terse.frames;

        if (track) {
          List<String> members = frames.take(4).map((e) => '${e.member ?? 'Unknown'} (${e.line}:${e.column})').toList();
          String member = members.join(', ');

          String message = '''$e
Try to check [$member]''';

          logg(message, name: 'ERROR');
          errorMessage = message;
        } else {
          for (Frame f in frames.take(1)) {
            int? line = f.line, col = f.column;
            String location = f.uri.toString().replaceAll('package:', ''), member = f.member ?? 'Unknown';

            String message = '''Error on $member ($line:$col), $e 
                              File location: $location''';

            logg(message, name: 'ERROR');
            errorMessage = message;
          }
        }

        // ---------------------------------------------------------------------
        // Bot Usage

        String botToken = _errorConfig['bot']['token'] ?? '';
        String chatId = _errorConfig['bot']['chat_id'] ?? '';
        bool isUseBot = _errorConfig['bot']['active'] ?? false;

        if (isUseBot && botToken.isNotEmpty && chatId.isNotEmpty && !disabledBot) {
          DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
          String? brand, model, system, sdk;

          if (Platform.isAndroid) {
            AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

            brand = androidInfo.brand;
            model = androidInfo.model;
            system = androidInfo.version.release;
            sdk = androidInfo.version.sdkInt.toString();
          } else if (Platform.isIOS) {
            IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

            brand = iosInfo.name;
            model = iosInfo.model;
            system = iosInfo.systemName;
            sdk = iosInfo.systemVersion;
          }

          String device = '$brand $model ($system $sdk)';

          String message = '''$errorMessage

<b>Details</b>
$device''';

          await Telebot.sendMessage(message, botToken, chatId);
        }
      }
    } catch (e, s) {
      logg('-- Errors.check : $e $s');
    }
  }
}
