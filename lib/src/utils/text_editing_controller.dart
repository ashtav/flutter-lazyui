part of utils;

/// `TecValidation` - A class to handle validation results in technical processes.
///
/// This class is used to encapsulate the result of a validation process,
/// providing details about any errors that occurred and a flag indicating
/// whether the validation was successful or not.
///
/// Parameters:
///   - `error`: A `String` that describes the error encountered during
///     validation. It is expected to be informative and concise.
///   - `ok`: A `bool` that indicates whether the validation was successful.
///     `true` implies successful validation, and `false` implies a failure.
///
class TecValidation {
  final String error;
  final bool ok;

  TecValidation({required this.error, required this.ok});
}

/// Extension `MapTextEditingControllerExtension` on `Map<String, TextEditingController>`
///
/// This extension provides additional functionality to a map of `TextEditingController`s,
/// allowing for easier extraction of values and validation of form fields.
///
/// Functions:
///   - `value`: A getter that converts the `TextEditingController`s in the map to
///     a `Map<String, String>`. This is useful for retrieving the text values from
///     all controllers in a form-like structure.
///
///   - `validate`: A method that validates the fields in the map based on the required
///     fields specified. It supports general validation like checking if a field is empty
///     and required.
///
///     Parameters:
///       - `required`: A list of strings representing the keys of the fields that are required.
///         Special handling for '*' is included:
///         - If the list contains only '*', then all fields are considered required.
///         - If '*' is present with other keys, it treats all fields as required except
///           the ones explicitly listed.
///
///     Returns:
///       - `TecValidation`: An instance representing the outcome of the validation.
///         It contains a boolean indicating if the validation passed and an error message
///         if it failed.
extension MapTextEditingControllerExtension
    on Map<String, TextEditingController> {
  Map<String, String> get value {
    return entries.fold({}, (Map<String, String> previousValue, element) {
      previousValue[element.key] = element.value.text;
      return previousValue;
    });
  }

  TecValidation validate({List<String> required = const []}) {
    try {
      final Map<String, String> value = this.value;
      final List<Map<String, dynamic>> errors = [];

      bool isRequiredAll = required.length == 1 && required.contains('*');
      bool isRequiredAllExcept = required.length > 1 && required.contains('*');

      if (isRequiredAll) {
        required = value.keys.toList();
      } else if (isRequiredAllExcept) {
        required.remove('*');
        required = value.keys.toList()
          ..removeWhere((e) => required.contains(e));
      }

      final formKeys = value.keys.toList();

      for (String key in formKeys) {
        // Required
        if (value[key] != null &&
            value[key]!.trim().isEmpty &&
            required.contains(key)) {
          errors.add({
            'key': key,
            'type': 'required',
            'message': 'Field $key is required'
          });
        }
      }

      return TecValidation(
          error: errors.isEmpty ? '' : errors.first['message'],
          ok: errors.isEmpty);
    } catch (e, s) {
      Utils.errorCatcher(e, s);
      return TecValidation(error: 'Error validating form', ok: false);
    }
  }
}

/// Extension `TextEditingControllerExtension` on `String`
///
/// This extension provides a convenient way to create a `TextEditingController`
/// from a `String` instance. It's particularly useful in scenarios where you
/// want to initialize a `TextEditingController` with a default value.
///
/// Function:
///   - `tec`: A getter that creates and returns a `TextEditingController` with
///     its `text` property set to the current `String` value.
///
/// Example Usage:
///   ```dart
///   var initialText = "Hello, World!";
///   var textController = initialText.tec;
///   ```
///
/// This extension simplifies the creation of `TextEditingController` instances
/// with predefined values, enhancing code readability and reducing boilerplate
/// in UI code, especially in form-related widgets in Flutter.

extension TextEditingControllerExtension on String {
  TextEditingController get tec => TextEditingController(text: this);
}

/// `TEC` - A utility class for creating `TextEditingController` instances.
///
/// This class provides a static method to easily create a map of `TextEditingController`
/// instances associated with given keys. It's especially useful in form handling
/// where multiple text fields are involved.
///
/// Method:
///   - `make`: A static method that takes a list of string keys and returns a
///     map where each key is associated with a new `TextEditingController`.
///
///     Parameters:
///       - `keys`: A list of strings representing the keys for which
///         `TextEditingController` instances need to be created.
///
///     Returns:
///       - `Map<String, TextEditingController>`: A map where each key from the input list
///         is associated with a newly created `TextEditingController`.
///
/// Example Usage:
///   ```dart
///   var fields = ["username", "email", "password"];
///   var controllers = TEC.make(fields);
///   // Now, controllers['username'], controllers['email'], and controllers['password']
///   // are all initialized TextEditingController instances.
///   ```
///
/// This class is particularly handy in scenarios involving dynamic form creation
/// where the fields are not known beforehand or change frequently.
class TEC {
  static Map<String, TextEditingController> make(List<String> keys) {
    return keys.fold({},
        (Map<String, TextEditingController> previousValue, key) {
      previousValue[key] = TextEditingController();
      return previousValue;
    });
  }
}
