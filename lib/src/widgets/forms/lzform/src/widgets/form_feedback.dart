import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../models/attribute.dart';

/// Widget for displaying feedback messages related to form validation or input status.
class FormFeedbackMessage extends StatelessWidget {
  /// Determines whether to display the feedback message.
  final bool show;

  /// The message to be displayed.
  final String message;

  /// Additional styling attributes for the message.
  final Attribute? attribute;

  /// Feedback background color
  final Color? backgroundColor;

  /// Create widget
  const FormFeedbackMessage(
      {super.key,
      this.show = true,
      this.message = '',
      this.attribute,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    TextStyle? style = Theme.of(context).textTheme.bodyMedium;
    bool isGrouped = attribute?.isGrouped ?? false;

    return ResizedSwitcher(
      show: show,
      child: SizedBox(
        key: ValueKey(message),
        width: context.width,
        child: Textr(
          message,
          color: backgroundColor ?? Colors.orange.withValues(alpha: .05),
          style: style?.copyWith(fontSize: 14, color: Colors.redAccent),
          padding: Ei.only(v: 5, l: isGrouped ? 16 : 0),
        ),
      ),
    );
  }
}
