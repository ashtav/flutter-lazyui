import 'package:flutter/material.dart';
import 'package:lazyui/src/widgets/forms/notifier.dart';

class FormModel {
  @protected
  final FormNotifier notifier;

  @protected
  final GlobalKey key;

  const FormModel(this.notifier, this.key);
}

class FormValidation {
  final bool ok;
  final FormError error;
  final Map<String, dynamic> value;

  const FormValidation(this.ok,
      {this.error = const FormError('', ''), this.value = const {}});
}

class FormError {
  final String key;
  final String message;

  const FormError(this.key, this.message);

  @override
  String toString() {
    return 'key: $key, message: $message';
  }
}

enum FormFeedback { none, toast, text }

/// A class representing attributes for UI components.
class Attribute {
  final bool isGrouped;
  const Attribute({this.isGrouped = true});
}
