import 'package:flutter/material.dart';

import '../../shortcut.dart';
import '../../widgets/widgets.dart';

class Selectable extends StatelessWidget {
  final bool isSelected;
  final int number;
  final Widget child;

  const Selectable({
    Key? key,
    required this.isSelected,
    required this.number,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double minScale = 1.0;
    const Duration duration = Duration(milliseconds: 200);
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final translate = isSelected ? constraints.maxWidth * (1.0 - minScale) * 0.5 : 0.0;
        return AnimatedContainer(
          duration: duration,
          curve: Curves.easeInOutCubic,
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..translate(translate, translate)
            ..scale(isSelected ? minScale : 1.0),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: child,
              ),
              Positioned.fill(
                child: AnimatedContainer(
                  duration: duration,
                  curve: Curves.easeInOut,
                  color: theme.colorScheme.secondary.withOpacity(isSelected ? 0.4 : 0),
                ),
              ),
              Positioned.fill(
                  child: Align(
                alignment: Alignment.topLeft,
                child: AnimatedOpacity(
                  duration: duration,
                  opacity: isSelected ? 1.0 : 0.0,
                  child: number == 0
                      ? const None()
                      : Container(
                          margin: Ei.only(l: 4, t: number > 9 ? 4 : 0),
                          decoration: BoxDecoration(color: theme.colorScheme.secondary, shape: BoxShape.circle, border: Br.all(color: Colors.white)),
                          padding: Ei.all(number > 9 ? 3.0 : 7.0),
                          child: Text('$number', style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.white, fontSize: 14)),
                        ),
                ),
              ))
            ],
          ),
        );
      },
    );
  }
}
