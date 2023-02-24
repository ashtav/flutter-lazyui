import 'package:teledart/telegram.dart';

import 'error_handler.dart';

class Telebot {
  static Future<bool> sendMessage(String message, String token, String chatId) async {
    bool isOk = false;

    try {
      Telegram telegram = Telegram(token);
      bool ok = await telegram.sendMessage(chatId, message, parseMode: 'HTML').then((res) => true).catchError((err) {
        return false;
      });

      isOk = ok;
    } catch (e, s) {
      Errors.check(e, s);
    }

    return isOk;
  }
}
