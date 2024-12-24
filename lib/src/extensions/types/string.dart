part of '../extension.dart';

extension CustomStringExtension on String {
  Color get hex {
    String color = replaceAll('#', '');
    if (color.length == 3) {
      color = color.split('').map((c) => '$c$c').join();
    }
    return Color(int.tryParse('0xff$color') ?? 0xff000000);
  }

  /// Capitalizes the first letter of each word in a string.
  ///
  /// Example:
  /// ```dart
  /// print('john doe'.ucwords); // John Doe
  /// ```
  String get ucwords => isEmpty
      ? ''
      : split(' ').map((word) => word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : '').join(' ');

  /// Capitalizes the first letter of the string.
  ///
  /// Example:
  /// ```dart
  /// print('john'.ucfirst); // John
  /// ```
  String get ucfirst => isEmpty ? '' : this[0].toUpperCase() + substring(1);

  /// Extracts the numeric value from the string.
  ///
  /// Example:
  /// ```dart
  /// print('abc123'.numeric ); // 123
  /// ```
  int get numeric => int.tryParse(replaceAll(RegExp(r'[^0-9-]'), '')) ?? 0;

  /// Removes HTML tags from the string.
  ///
  /// Example:
  /// ```dart
  /// print('<p>Test</p>'.removeHtml); // Test
  /// ```
  String get removeHtml => replaceAll(RegExp(r'<[^>]*>'), '').replaceAll('&nbsp;', '');

  /// Checks if the string is a valid JSON.
  ///
  /// Example:
  /// ```dart
  /// '{}'.isJson; // true
  /// ```
  bool get isJson {
    try {
      final decoded = json.decode(this);
      return decoded is Map || decoded is List; // Checks if it's a valid Map or List
    } catch (e) {
      return false;
    }
  }
}

extension LzNullableStringExtension on String? {
  /// Formats the value as Indonesian Rupiah (IDR).
  ///
  /// Example:
  /// ```dart
  /// '1000'.idr(); // Rp1.000
  /// ```
  String idr({String prefix = 'Rp', int decimalDigits = 0, String separator = '.'}) =>
      (this ?? '0').currency(prefix: prefix, decimalDigits: decimalDigits, separator: separator);

  /// Formats the string value as currency.
  ///
  /// Example usage:
  /// ```dart
  /// String price = '15000'.currency(); // $15,000
  /// String priceWithDecimal = '25000.50'.currency(decimalDigits: 2); // $25,000.50
  /// ```
  String currency({String prefix = '\$', int decimalDigits = 0, String separator = ','}) {
    try {
      String num = '0', digits = '';

      switch (runtimeType.toString()) {
        case 'int':
          num = toString();
          break;

        case 'double':
        case 'String':
          if (toString().contains('.') || toString().contains(',')) {
            // Identify the decimal separator dynamically
            var decimalSeparator = toString().contains('.') ? '.' : ',';
            num = toString().split(decimalSeparator)[0];
            digits = toString().split(decimalSeparator)[1];
          } else {
            num = toString();
          }
          break;

        default:
          return '${prefix}0';
      }

      // Clean only the integer part of non-numeric characters
      num = num.replaceAll(RegExp(r'[^0-9]'), '');

      String result = NumberFormat.currency(
        locale: 'id_ID',
        decimalDigits: 0, // Only format the integer part to avoid rounding
        symbol: prefix,
      ).format(int.parse(num));

      result = result.replaceAll('.', separator); // Use the separator for thousands

      // Determine the correct separator for the decimal part
      String decimalSeparator = separator == ',' ? '.' : ',';

      // Append the decimal part manually if it exists
      return digits.isEmpty
          ? result
          : '$result$decimalSeparator${digits.padRight(decimalDigits, '0').substring(0, decimalDigits)}';
    } catch (e) {
      return '${prefix}0';
    }
  }

  /// Converts a date string in various formats to a DateTime object.
  ///
  /// Example usage:
  /// ```dart
  /// "2023-02-10 00:00:00".toDate(); // DateTime(2023, 2, 10, 0, 0, 0)
  /// "10-02-2023 00:00:00".toDate(); // DateTime(2023, 2, 10, 0, 0, 0)
  /// ```
  DateTime toDate({bool toLocal = false}) {
    try {
      String detectAndFormatDate(String dateString) {
        // Define regex for different date formats
        Map<String, RegExp> formatRegexMap = {
          'y-m-d': RegExp(r'^\d{4}-\d{2}-\d{2}$'),
          'd-m-y': RegExp(r'^\d{2}-\d{2}-\d{4}$'),
          'y.m.d': RegExp(r'^\d{4}\.\d{2}\.\d{2}$'),
          'y/m/d': RegExp(r'^\d{4}/\d{2}/\d{2}$'),
          'd/m/y': RegExp(r'^\d{2}/\d{2}/\d{4}$'),
          'd.m.y': RegExp(r'^\d{2}\.\d{2}\.\d{4}$'),
        };

        // Iterate through the formats and convert to 'y-m-d'
        for (String format in formatRegexMap.keys) {
          RegExp regex = formatRegexMap[format]!;
          if (regex.hasMatch(dateString)) {
            // Replace delimiters with '-' and split the date string into parts
            List<String> parts = dateString.replaceAll(RegExp(r'[^\d]'), '-').split('-');

            // Check if month is greater than 12, if so, set it to 12
            if (int.parse(parts[1]) > 12) {
              parts[1] = '12'; // Set month to December if it's greater than 12
            }

            // Return in 'y-m-d' format
            if (format == 'd-m-y' || format == 'd/m/y' || format == 'd.m.y') {
              return '${parts[2]}-${parts[1]}-${parts[0]}'; // d-m-y to y-m-d
            } else {
              return '${parts[0]}-${parts[1]}-${parts[2]}'; // y-m-d format stays the same
            }
          }
        }

        return 'Invalid format'; // If no matching format is found
      }

      if (['', null].contains(this)) {
        return DateTime.now();
      }

      // check if string contains :
      List<String> dates = this!.split(':');

      String date = dates[0];

      if (dates.length > 1) {
        date = '${dates[0]} ${dates[1]}';
      }

      DateTime result = DateTime.parse(detectAndFormatDate(date));
      return toLocal ? result.toLocal() : result;
    } catch (e, s) {
      Print.error('Error $e, $s');
      return DateTime.now();
    }
  }
}
