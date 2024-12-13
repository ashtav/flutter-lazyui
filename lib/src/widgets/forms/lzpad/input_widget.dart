import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

/// Represents a widget for entering a passcode.
class PasscodeInput extends StatelessWidget {
  /// Whether to use a filled (rounded) or outlined style for the input field (defaults to `false`).
  final bool filled;

  /// Creates a new `PasscodeInput` instance.
  const PasscodeInput({super.key, this.filled = false});

  @override
  Widget build(BuildContext context) {
    double width = 25;
    double height = 25;

    return SizedBox(
      width: width + 10,
      height: height + 10,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          AnimatedContainer(
              duration: 150.ms,
              width: filled ? width : 5,
              height: filled ? height : 5,
              margin: Ei.sym(h: 5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green.withValues(alpha: filled ? .3 : 0))),
          Container(
              width: width - 10,
              height: height - 10,
              margin: Ei.sym(h: 5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: filled ? Colors.green : Colors.grey)),
        ],
      ),
    );
  }
}
