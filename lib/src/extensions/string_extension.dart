part of extensions;

extension StringExtension on String {
  /// ``` dart
  /// print('john doe'.ucwords); // John Doe
  /// ```
  String get ucwords {
    try {
      String str = this;

      if (str.trim().isEmpty) return '';

      List<String> split = str.split(' ');
      for (int i = 0; i < split.length; i++) {
        if (split[i] != '') {
          split[i] = split[i][0].toUpperCase() + split[i].substring(1);
        }
      }

      return split.join(' ');
    } catch (e) {
      return '';
    }
  }

  /// ``` dart
  /// print('john doe'.ucfirst); // John doe
  /// ```
  String get ucfirst {
    try {
      String str = this;
      if (str.trim() == '') return '';
      return str[0].toUpperCase() + str.substring(1);
    } catch (e) {
      return '';
    }
  }

  /// ``` dart
  /// 'John Doe'.initials(length = 2); // JD
  /// ```
  String initials({bool firstUppercase = true, int length = 2}) {
    String result = '';

    try {
      List<String> char = trim().split(' ');
      char
          .take(length)
          .forEach((e) => result += firstUppercase ? e[0].ucwords : e[0]);
      return result;
    } catch (e) {
      return '';
    }
  }

  /// ``` dart
  /// print('lipsum99'.getNumeric); // 99
  /// ```
  int get getNumeric {
    try {
      if (trim().isEmpty) return 0;
      String number = replaceAll(RegExp(r'-(?=\D|$)'), '');
      return int.parse(number.replaceAll(RegExp(r'[^0-9-]'), ''));
    } catch (e) {
      return 0;
    }
  }

  /// ``` dart
  /// '<h1>Hello World</h1>'.removeHtmlTag; // Hello World
  /// ```
  String get removeHtmlTag {
    try {
      RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
      return replaceAll(exp, '').replaceAll('&nbsp;', '');
    } catch (e) {
      return '!';
    }
  }

  /// ``` dart
  /// '{}'.isJson; // true
  /// ```
  bool get isJson {
    try {
      json.decode(this);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get isEmail => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(this);

  bool get isUrl => RegExp(
          r'^(http|https|ftp):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$')
      .hasMatch(this);

  /// Format the given value as Indonesian Rupiah (IDR) currency string.
  ///
  /// The [symbol] parameter sets the currency symbol (default: 'Rp').
  /// The [decimalDigits] parameter sets the number of decimal digits to display (default: 0).
  /// The [separator] parameter sets the thousands separator (default: '.').
  ///
  /// Example usage:
  /// ```dart
  /// String price = idr(15000);
  /// print(price); // Rp15.000
  ///
  /// String priceWithDecimal = idr(25000.50, decimalDigits: 2);
  /// print(priceWithDecimal); // Rp25.000,50
  /// ```
  String idr(
      {String symbol = 'Rp', int decimalDigits = 0, String separator = '.'}) {
    try {
      String num = '0', digits = '';

      switch (runtimeType) {
        case int:
          num = toString();
          break;

        case double:
        case String:
          if (toString().contains(separator)) {
            num = toString().split(separator)[0];
            digits = toString().split(separator)[1];
          } else {
            num = toString();
          }
          break;

        default:
          return 'Rp?';
      }

      bool allowDecimal = runtimeType == int ||
          (runtimeType == String && !toString().contains(separator));

      String result = NumberFormat.currency(
        locale: 'id_ID',
        decimalDigits: allowDecimal ? decimalDigits : 0,
        symbol: symbol,
      ).format(int.parse(num));

      result = result.replaceAll('.', separator);
      return digits.isEmpty
          ? result
          : '$result,${digits.split('').take(decimalDigits).join('')}';
    } catch (e) {
      return 'Rp?';
    }
  }
}

extension NullableStringExtension on String? {
  /// ``` dart
  /// "2023-02-10 00:00:00".toDate(); // DateTime(2023, 2, 10, 0, 0, 0)
  /// "10-02-2023 00:00:00".toDate(); // DateTime(2023, 2, 10, 0, 0, 0)
  /// // Support yyyy-MM-dd and dd-MM-yyyy format
  /// ```
  DateTime toDate({bool toLocal = false}) {
    try {
      String? dateString = this;

      String? getDateStringFormat(String dateString) {
        Map<String, RegExp> formatRegexMap = {
          'y-m-d': RegExp(r'^\d{4}-\d{2}-\d{2}$'),
          'd-m-y': RegExp(r'^\d{2}-\d{2}-\d{4}$'),
          'y.m.d': RegExp(r'^\d{4}\.\d{2}\.\d{2}$'),
          'y/m/d': RegExp(r'^\d{4}/\d{2}/\d{2}$'),
          'd/m/y': RegExp(r'^\d{2}/\d{2}/\d{4}$'),
          'd.m.y': RegExp(r'^\d{2}\.\d{2}\.\d{4}$'),
          'ymd': RegExp(r'^\d{4}\d{2}\d{2}$'),
          'dmy': RegExp(r'^\d{2}\d{2}\d{4}$'),
        };

        String? result;

        for (String format in formatRegexMap.keys) {
          RegExp? r = formatRegexMap[format];

          if (dateString.contains(' ')) {
            dateString =
                dateString.split(' ')[0]; // extract date portion of string
          } else {
            dateString = dateString;
          }

          if (r != null && r.hasMatch(dateString)) {
            result = format;
            break; // exit loop when match is found
          }
        }

        return result;
      }

      if (dateString != null) {
        String? format = getDateStringFormat(dateString);
        DateTime result = DateTime.now();

        if (format != null && format == 'd-m-y') {
          RegExp regex = RegExp(r'^(\d{2})-(\d{2})-(\d{4})$');
          List<String> dateParts =
              (regex.firstMatch(dateString.split(' ')[0])?.groups([3, 2, 1]) ??
                      [])
                  .cast();
          String ymd = '${dateParts[0]}-${dateParts[1]}-${dateParts[2]}';

          result = DateTime.parse(ymd);
        } else {
          result = DateTime.parse(dateString);
        }

        return toLocal ? result.toLocal() : result;
      }

      return DateTime.now();
    } catch (e, s) {
      Utils.errorCatcher(e, s);
      return DateTime.now();
    }
  }
}
