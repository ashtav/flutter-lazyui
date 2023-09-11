part of utils;

/// The `InputFormat` class provides a set of predefined input formatters for text input fields.
///
/// You can use these formatters to restrict and format the input entered by users.
class InputFormat {
  /// Returns a text input formatter that allows only strict numeric input (0-9).
  static TextInputFormatter get strictNumeric =>
      FilteringTextInputFormatter.allow(RegExp("[0-9]"));

  /// Returns a text input formatter that allows numeric input (0-9), including commas and periods.
  static TextInputFormatter get numeric =>
      FilteringTextInputFormatter.allow(RegExp("[0-9,.]"));

  /// Returns a text input formatter that allows only alphabetic characters (a-zA-Z) and spaces.
  static TextInputFormatter get alpha =>
      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"));

  /// Returns a text input formatter that allows alphanumeric characters (a-zA-Z0-9) and spaces.
  static TextInputFormatter get alphanumeric =>
      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9 ]"));

  /// Returns a text input formatter that converts input to lowercase.
  static TextInputFormatter get lowercase => _LowerCaseTextFormatter();

  /// Returns a text input formatter that converts input to uppercase.
  static TextInputFormatter get uppercase => _UpperCaseTextFormatter();

  /// Returns a text input formatter that capitalizes the first letter of each word (title case).
  static TextInputFormatter get ucwords => _UcwordsFormatter();

  /// Returns a text input formatter that capitalizes the first letter of the input (sentence case).
  static TextInputFormatter get ucfirst => _UcfirstFormatter();

  /// Returns a text input formatter for formatting currency values.
  ///
  /// The `separator` parameter specifies the character used as a thousands separator (default is `,`).
  ///
  /// Example:
  /// ```dart
  /// // Applying currency formatting to an input field
  /// TextField(
  ///   inputFormatters: [InputFormat.currency()],
  /// )
  /// ```
  static TextInputFormatter currency([String separator = ',']) =>
      _ThousandFormatter(separator: separator);

  /// Returns a text input formatter that allows input based on a custom regular expression pattern.
  ///
  /// The `pattern` parameter is the regular expression pattern to be allowed.
  ///
  /// Example:
  /// ```dart
  /// // Allowing only alphabetic characters using a custom regular expression
  /// TextField(
  ///   inputFormatters: [InputFormat.allowRegex('[a-zA-Z]')],
  /// )
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
