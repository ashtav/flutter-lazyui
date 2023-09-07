part of utils;

class InputFormat {
  static TextInputFormatter get strictNumeric =>
      FilteringTextInputFormatter.allow(RegExp("[0-9]"));
  static TextInputFormatter get numeric =>
      FilteringTextInputFormatter.allow(RegExp("[0-9,.]"));
  static TextInputFormatter get alpha =>
      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"));
  static TextInputFormatter get alphanumeric =>
      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9 ]"));

  static TextInputFormatter get lowercase => _LowerCaseTextFormatter();
  static TextInputFormatter get uppercase => _UpperCaseTextFormatter();
  static TextInputFormatter get ucwords => _UcwordsFormatter();
  static TextInputFormatter get ucfirst => _UcfirstFormatter();
  static TextInputFormatter currency([String separator = ',']) =>
      _ThousandFormatter(separator: separator);

  /// ```dart
  /// formatters: [
  ///   InputFormat.allowRegex('[a-zA-Z]')
  /// ]
  /// ```
  static TextInputFormatter allowRegex(String pattern) =>
      FilteringTextInputFormatter.allow(RegExp(pattern));
}

class _LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}

class _UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

// UCWORDS FORMATTER
class _UcwordsFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      int selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.extentOffset;
      String newString = newValue.text.ucwords;

      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndexFromTheRight,
        ),
      );
    } else {
      return newValue;
    }
  }
}

// UCFIRST FORMATTER
class _UcfirstFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      int selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.extentOffset;
      String newString = newValue.text.ucfirst;

      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndexFromTheRight,
        ),
      );
    } else {
      return newValue;
    }
  }
}

// THOUSAND FORMATTER
class _ThousandFormatter extends TextInputFormatter {
  final String separator;
  _ThousandFormatter({this.separator = ','});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      int max = 19;
      bool isMax = newValue.text.length >= max;

      int selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.extentOffset;

      String convert(String value) {
        return NumberFormat.currency(
                locale: 'id_ID', decimalDigits: 0, symbol: '')
            .format(value.getNumeric);
      }

      String newString =
          convert(isMax ? newValue.text.substring(0, max) : newValue.text);

      return TextEditingValue(
        text: newString.replaceAll('.', separator.isEmpty ? ',' : separator),
        selection: TextSelection.collapsed(
          offset: isMax
              ? newString.length
              : newString.length - selectionIndexFromTheRight,
        ),
      );
    } else {
      return newValue;
    }
  }
}
