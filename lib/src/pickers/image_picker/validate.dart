import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mixins/mixins.dart';

import '../../widgets/widgets.dart';
import 'labels.dart';
import 'selection.dart';

class PickerValidateButton extends StatelessWidget {
  final ValueChanged<MediaPickerSelection> onValidate;

  const PickerValidateButton({
    super.key,
    required this.onValidate,
  });

  @override
  Widget build(BuildContext context) {
    final selection = MediaPickerSelection.of(context);
    final labels = MediaPickerLabels.of(context);

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: AnimatedBuilder(
        animation: selection,
        builder: (context, _) {
          return Container(
            margin: Ei.only(b: 15),
            decoration: BoxDecoration(border: Br.all(color: Colors.white), borderRadius: Br.radius(25)),
            child: ClipRRect(
              borderRadius: Br.radius(25),
              child: InkW(
                onTap: selection.selectedMedias.isNotEmpty ? () => onValidate(selection) : null,
                padding: Ei.sym(v: 10, h: 25),
                color: Colors.grey,
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 25.0,
                    sigmaY: 25.0,
                  ),
                  child: Text(
                    ' (${selection.selectedMedias.length}) ${labels.textConfirm}',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
