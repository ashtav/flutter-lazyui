import 'package:lazyui/lazyui.dart';
import 'package:teledart/telegram.dart';

class Bot {
  static Future<bool> sendMessage(String message, String token, String chatId) async {
    bool isOk = false;

    try {
      // change < to &lt; and > to &gt; to avoid html tag on the message
      // if

      // message = message.replaceAll('<', '&lt;').replaceAll('>', '&gt;');

      List<String> allowed = ["b", "i", '/b', '/i'];

      // Generate a regular expression pattern to match all HTML tags except the allowed ones
      String pattern = "(</?(?!(${allowed.join('|')})\\b)[^>]+>)";

      // Replace all non-allowed HTML tags with an empty string
      message = message.replaceAllMapped(RegExp(pattern), (match) => '');

      Telegram telegram = Telegram(token);
      bool ok = await telegram.sendMessage(chatId, message, parseMode: 'HTML').then((res) => true).catchError((err) {
        logg('Bot.sendMessage : $err');
        return false;
      });

      isOk = ok;
    } catch (e, s) {
      Errors.check(e, s);
    }

    return isOk;
  }
}
