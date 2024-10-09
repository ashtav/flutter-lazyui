part of 'util.dart';

/// The `Bot` class provides a method for sending messages using the Telegram Bot API.
///
/// You can use the `sendMessage` method to send messages with custom formatting to a
/// specified chat using a Telegram bot.
///
class Bot {
  /// Sends a message with custom formatting to a specified chat using a Telegram bot.
  ///
  /// The `message` parameter represents the content of the message to be sent.
  /// The `token` parameter is the Telegram bot token used for authentication.
  /// The `chatId` parameter is the ID of the chat where the message will be sent.
  ///
  /// This method performs HTML tag filtering to ensure that only allowed HTML tags
  /// are included in the message content.
  ///
  /// Example:
  /// ```dart
  /// // Sending a message using a Telegram bot
  /// bool messageSent = await Bot.sendMessage(
  ///   'Hello <b>World</b>!',
  ///   'your_bot_token_here',
  ///   'your_chat_id_here',
  /// );
  ///
  /// if (messageSent) {
  ///   print('Message sent successfully.');
  /// } else {
  ///   print('Message sending failed.');
  /// }
  /// ```

  static Future<bool> sendMessage(
      String message, String token, String chatId) async {
    bool isOk = false;

    try {
      // change < to &lt; and > to &gt; to avoid html tag on the message
      // if

      // message = message.replaceAll('<', '&lt;').replaceAll('>', '&gt;');

      List<String> allowed = ['b', 'i', '/b', '/i'];

      // Generate a regular expression pattern to match all HTML tags except the allowed ones
      String pattern = "(</?(?!(${allowed.join('|')})\\b)[^>]+>)";

      // Replace all non-allowed HTML tags with an empty string
      message = message.replaceAllMapped(RegExp(pattern), (match) => '');

      Telegram telegram = Telegram(token);
      bool ok = await telegram
          .sendMessage(chatId, message, parseMode: 'HTML')
          .then((res) => true)
          .catchError((err) {
        logg('Bot.sendMessage : $err');
        return false;
      });

      isOk = ok;
    } catch (e, s) {
      Utils.errorCatcher(e, s);
    }

    return isOk;
  }
}
