part of utils;

/// Error Configuration
///
/// The variable [_errorConfig] is used to configure error handling.
/// It contains several key elements:
///
/// - `'bot'`: This key has a value of a `Map` object with several properties, including `'token'`, `'chat_id'`, and `'active'`.
///   This is used for configuring error message bots.
///   - `'token'`: Represents the bot token used to send error messages (can be filled with a Telegram bot token, for example).
///   - `'chat_id'`: Represents the chat ID where error messages will be sent (e.g., Telegram chat ID).
///   - `'active'`: Indicates whether the sending of error messages by the bot is currently active (can be `true` or `false`).
///
/// - `'use_list'`: This is a boolean key that indicates whether a list should be used in error handling (`true` if yes, `false` if not).
///
/// - `'error_info'`: This is a key that can contain additional error information in the form of an object, but is initially set to `null`.
///
Map<String, dynamic> _errorConfig = {
  'bot': {'token': '', 'chat_id': '', 'active': true},
  'use_list': false,
  'error_info': null
};

/// ErrorInfo Class
///
/// [ErrorInfo] is a class used to represent information about the error that occurred.
/// It has several properties:
///
/// - `device`: An optional String that represents the device associated with the error.
/// - `botToken`: An optional String that represents the bot token used to send error messages.
/// - `chatId`: An optional String that represents the chat ID where error messages will be sent.
/// - `error`: A String that is the message or description of the error that occurred.
/// - `networkError`: An object of [NetworkError] used to store additional information about network errors (optional).
///
class ErrorInfo {
  final String? device, botToken, chatId;
  final String error;
  final NetworkError? networkError;

  ErrorInfo(
      {this.device,
      this.botToken,
      this.chatId,
      required this.error,
      this.networkError});
}

/// NetworkError Class
///
/// [NetworkError] is a class used to represent errors related to the network.
/// It has several properties:
///
/// - `baseUrl`: An optional String representing the base URL associated with the network error.
/// - `path`: An optional String representing the path or URL endpoint that caused the network error.
/// - `error`: A String that is the message or description of the network error that occurred.
///
class NetworkError {
  final String? baseUrl, path, error;
  NetworkError({this.baseUrl, this.path, this.error});
}

class Errors {
  static void config(
      {String? botToken,
      String? chatId,
      bool useBot = true,
      bool useList = false,
      Function(ErrorInfo info)? errorBuilder}) {
    try {
      _errorConfig['bot']['token'] = botToken;
      _errorConfig['bot']['chat_id'] = chatId;
      _errorConfig['bot']['active'] = useBot;

      _errorConfig['use_list'] = useList;
      _errorConfig['error_info'] = errorBuilder;
    } catch (e, s) {
      Utils.errorCatcher(e, s);
    }
  }

  /// ```dart
  /// Errors.check(e, s, useList: true);
  /// ```
  /// `useList` = `true`, will show the list of function that related to the error

  static check(e, StackTrace s,
      {bool? useList,
      bool disabledBot = false,
      NetworkError? networkError}) async {
    try {
      // ---------------------------------------------------------------------
      // Check Errors Caused by Internet Connection

      List<String> failsNetwork = [
        'SocketException',
        'Failed host lookup',
        'NetworkException'
      ];
      String errorMessage = '-';

      if (failsNetwork.any((n) => e.toString().contains(n))) {
        logg('Network error, $e', name: 'ERROR');
      } else {
        // ---------------------------------------------------------------------
        // Check Errors Caused by Code, Etc

        final frames = Trace.from(s).terse.frames;

        if (useList ?? _errorConfig['use_list']) {
          List<String> members = frames
              .take(4)
              .map((e) => '${e.member ?? 'Unknown'} (${e.line}:${e.column})')
              .toList();
          String member = members.join(', ');

          String message = '''$e
Try to check [$member]''';

          logg(message, name: 'ERROR');
          errorMessage = message;
        } else {
          for (Frame f in frames.take(1)) {
            int? line = f.line, col = f.column;
            String location = f.uri.toString().replaceAll('package:', ''),
                member = f.member ?? 'Unknown';

            String message = '''Error on $member ($line:$col), $e 
                              File location: $location''';

            logg(message, name: 'ERROR');
            errorMessage = message;
          }
        }

        // ---------------------------------------------------------------------
        // Check Connection Timeout
        bool isTimeOut = errorMessage.contains('connectTimeout');

        if (isTimeOut) {
          if (networkError != null) {
            String baseUrl = networkError.baseUrl ?? '';
            String path = networkError.path ?? '';

            return logg('Connection timeout, $baseUrl/$path', name: 'ERROR');
          }

          return logg('Connection timeout', name: 'ERROR');
        }

        // ---------------------------------------------------------------------
        // Bot Usage

        String botToken = _errorConfig['bot']['token'] ?? '';
        String chatId = _errorConfig['bot']['chat_id'] ?? '';
        bool isUseBot = _errorConfig['bot']['active'] ?? false;

        if (isUseBot &&
            botToken.isNotEmpty &&
            chatId.isNotEmpty &&
            !disabledBot) {
          DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
          String? brand, model, system, sdk;

          if (Platform.isAndroid) {
            AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

            brand = androidInfo.brand.ucwords;
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

          // clear message from space, \n
          errorMessage = errorMessage.replaceAll('\n', ' ').trim();

          String device = '$brand $model ($system, $sdk)';
          List<String> messages = [errorMessage, '\n<b>Details</b>', device];

          if (networkError != null) {
            String baseUrl = networkError.baseUrl ?? '';
            String path = networkError.path ?? '';
            String error = networkError.error ?? '';

            messages[0] = error;
            messages.insert(2, '$baseUrl\n$path');
          }

          // join messages
          String message = messages.join('\n');

          if (_errorConfig['error_info'] != null) {
            void Function(ErrorInfo info) errorBuilder =
                _errorConfig['error_info'];
            ErrorInfo info = ErrorInfo(
                device: device,
                error: errorMessage.toString(),
                botToken: botToken,
                chatId: chatId,
                networkError: networkError);

            errorBuilder(info);
          } else {
            await Bot.sendMessage(message, botToken, chatId);
          }
        }
      }
    } catch (e, s) {
      Utils.errorCatcher(e, s, tracing: true);
    }
  }
}
