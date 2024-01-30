import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../models/attribute.dart';

class FormFeedbackMessage extends StatelessWidget {
  final bool show;
  final String message;
  final Attribute? attribute;
  const FormFeedbackMessage({super.key, this.show = true, this.message = '', this.attribute});

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
