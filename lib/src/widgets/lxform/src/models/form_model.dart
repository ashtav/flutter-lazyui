import 'package:flutter/material.dart';

import '../notifiers/form_notifier.dart';

/// A model class representing a form.
class LxFormModel {
  /// The controller for managing the form's input.
  final TextEditingController controller;

  /// The notifier for managing form state.
  @protected
  final LxFormNotifier notifier;

  /// The key associated with the form.
  final GlobalKey key;

  /// Constructs a [LxFormModel].
  ///
  /// [controller] : The controller for managing the form's input.
  ///
  /// [notifier] : The notifier for managing form state.
  ///
  /// [key] : The key associated with the form.
  LxFormModel(this.controller, this.notifier, this.key);
}
