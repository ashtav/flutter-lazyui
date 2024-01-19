import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class FormFeedbackMessage extends StatelessWidget {
  final bool show;
  final String message;
  const FormFeedbackMessage({super.key, this.show = true, this.message = ''});

  @override
  Widget build(BuildContext context) {
    TextStyle? style = Theme.of(context).textTheme.bodyMedium;

    return ResizedSwitched(
      show: show,
      child: SizedBox(
        key: ValueKey(message),
        width: context.width,
        child: Textr(
          message,
          style: style?.copyWith(fontSize: 14, color: Colors.redAccent),
          margin: Ei.only(t: 5),
        ),
      ),
    );
  }
}
