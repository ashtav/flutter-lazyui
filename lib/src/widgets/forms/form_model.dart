import 'package:flutter/material.dart';
import 'package:lazyui/src/widgets/forms/notifier.dart';

/// A model class that holds a [FormNotifier] and a [GlobalKey] for managing form state.
///
/// The [FormModel] is typically used to encapsulate the logic and key associated with a form widget.
class FormModel {
  @protected
  final FormNotifier notifier;

  @protected
  final GlobalKey key;

  const FormModel(this.notifier, this.key);
}

/// Represents the result of a form validation process.
///
/// Contains information about whether the validation was successful,
/// any associated error, and the validated values.
///
/// - [ok]: Indicates if the form validation passed.
/// - [error]: Contains details about the validation error, if any.
/// - [value]: A map holding the validated form values.
class FormValidation {
  final bool ok;
  final FormError error;
  final Map<String, dynamic> value;

  const FormValidation(this.ok,
      {this.error = const FormError('', ''), this.value = const {}});
}

/// Represents an error associated with a form field.
///
/// Contains a [key] identifying the form field and a [message]
/// describing the error.
class FormError {
  final String key;
  final String message;

  const FormError(this.key, this.message);

  @override
  String toString() {
    return 'key: $key, message: $message';
  }
}

/// Defines the types of feedback that can be provided by a form.
///
/// - [none]: No feedback will be shown.
/// - [toast]: Feedback will be displayed as a toast notification.
/// - [text]: Feedback will be shown as inline text.
enum FormFeedback { none, toast, text }

/// A class representing attributes for UI components.
class Attribute {
  final bool isGrouped;
  const Attribute({this.isGrouped = true});
}
