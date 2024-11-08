/// A class representing messages for different types of form validations.
class FormMessage {
  /// Messages for required field validation.
  final Map<String, dynamic>? required;

  /// Messages for minimum value validation.
  final Map<String, dynamic>? min;

  /// Messages for maximum value validation.
  final Map<String, dynamic>? max;

  /// Messages for email format validation.
  final Map<String, dynamic>? email;

  /// Messages for match field validation.
  final Map<String, dynamic>? match;

  /// Constructs a [FormMessage].
  ///
  /// [required] : Messages for required field validation.
  ///
  /// [min] : Messages for minimum value validation.
  ///
  /// [max] : Messages for maximum value validation.
  ///
  /// [email] : Messages for email format validation.
  FormMessage({this.required, this.min, this.max, this.email, this.match});

  /// Retrieves a message based on the type of validation and the key.
  ///
  /// [type] : The type of validation ('required', 'min', 'max', or 'email').
  ///
  /// [key] : The key to retrieve the message for.
  ///
  /// Returns the message corresponding to the type and key, or null if not found.
  String? get(String type, String key) {
    switch (type) {
      case 'required':
        return required?[key];
      case 'min':
        return min?[key];
      case 'max':
        return max?[key];
      case 'email':
        return email?[key];

      case 'match':
        return match?[key];
      default:
        return null;
    }
  }
}
