part of 'form.dart';

/// An extension on `Map<String, FormModel>` that provides convenient accessors
/// for retrieving form values and controllers.
///
/// Provides:
/// - [value]: Returns a map of key-value pairs where each key is the form field name
///   and the value is the current text in the corresponding form field's controller.
/// - [get]: Retrieves and logs the current text value of the form field associated with the given key.
///
/// Example usage:
/// ```dart
/// final formValues = formModelMap.value;
/// formModelMap.get('email');
/// ```
extension FormModelExtension on Map<String, FormModel> {
  Map<String, dynamic> get value => {
        for (var k in keys)
          // ignore: invalid_use_of_protected_member
          k: this[k]!.notifier.controller.text,
      };

  dynamic get(String key) {
    // ignore: invalid_use_of_protected_member
    final notifier = this[key]!.notifier;
    final controller = notifier.controller;

    logg(controller.text);
  }
}
