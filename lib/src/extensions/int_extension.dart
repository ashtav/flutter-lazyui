part of extensions;

extension IntExtension on int? {
  String idr({String symbol = 'Rp', int decimalDigits = 0, String separator = '.'}) {
    return (this == null ? '0' : toString()).idr(symbol: symbol, decimalDigits: decimalDigits, separator: separator);
  }
}
