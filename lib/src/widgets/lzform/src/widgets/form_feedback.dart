import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../models/attribute.dart';

class FormFeedbackMessage extends StatelessWidget {
  /// Determines whether the feedback message should be displayed.
  final bool show;

  /// The message to be displayed as feedback.
  final String message;

  /// The attribute associated with the feedback message.
  final Attribute? attribute;

  /// Constructs a FormFeedbackMessage widget.
  const FormFeedbackMessage(
      {super.key, this.show = true, this.message = '', this.attribute});

  @override
  Widget build(BuildContext context) {
    TextStyle? style = Theme.of(context).textTheme.bodyMedium;
    bool isGrouped = attribute?.isGrouped ?? false;

    return ResizedSwitched(
      show: show,
      child: SizedBox(
        key: ValueKey(message),
        width: context.width,
        child: Textr(
          message,
          style: style?.copyWith(fontSize: 14, color: Colors.redAccent),
          padding: Ei.only(v: 5, l: isGrouped ? 16 : 0),
        ),
      ),
    );
  }
}
