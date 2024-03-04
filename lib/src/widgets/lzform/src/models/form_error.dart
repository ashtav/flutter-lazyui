/// A class representing an error in a form field.
class FormError {
  /// The key identifying the form field where the error occurred.
  final String? key;

  /// The error message describing the issue.
  final String? message;

  /// The type of error, if applicable.
  final String? type;

  /// Constructs a [FormError].
  ///
  /// [key] : The key identifying the form field where the error occurred.
  ///
  /// [message] : The error message describing the issue.
  ///
  /// [type] : The type of error, if applicable.
  FormError({this.key, this.message, this.type});
}
