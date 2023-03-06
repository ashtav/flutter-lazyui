import 'package:lazyui/lazyui.dart' as lz;

extension DynamicExtension on dynamic {
  /// ```dart
  /// 1500.idr() // Rp1.500
  /// 2500.7.idr() // Rp2.500,7
  /// '3500.4'.idr() // Rp3.500,4
  /// ```
  String idr({String symbol = 'Rp', int decimalDigits = 0, String separator = '.'}) {
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

      bool allowDecimal = runtimeType == int || runtimeType == String && !contains('.');

      String result =
          lz.NumberFormat.currency(locale: 'id_ID', decimalDigits: allowDecimal ? decimalDigits : 0, symbol: symbol).format(int.parse(num));

      return digits.isEmpty ? result : '$result,${digits.split('').take(decimalDigits).join('')}';
    } catch (e) {
      return 'Rp?';
    }
  }

  /// ``` dart
  /// print('a4'.isNumeric); // false
  /// print('99'.isNumeric); // true
  /// ```
  bool get isNumeric => double.tryParse('$this') != null;

  /// ``` dart
  /// String? data;
  /// print(data.isNull); // true
  /// ```
  bool get isNull => (this == null);

  /// ``` dart
  /// String? data;
  /// print(data.isNotNull); // false
  /// ```
  bool get isNotNull => (this != null);

  /// ``` dart
  /// String? name;
  /// name.orIf('-', [null, '']) // it's mean if name is null or empty, then return '-'
  /// ```
  ///
  T orIf<T>([dynamic value, List conditions = const [null, '']]) {
    Type type = runtimeType;
    dynamic result = '-';

    if (value == null) {
      if (type is int) {
        result = 0;
      } else if (type is double) {
        result = 0.0;
      } else if (type is bool) {
        result = false;
      }
    } else {
      result = value;
    }

    return conditions.contains(this) ? result : this;
  }

  /// ``` dart
  /// 'Hello World'.logg; // Print string in debug console
  /// ```
  ///
  // void get logg {
  //   lz.logg(this);
  // }
}
