import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class Option {
  final String option;
  final dynamic value;
  final bool disabled;

  const Option({required this.option, this.value, this.disabled = false});

  factory Option.fromMap(Map<String, dynamic> map) {
    return Option(option: map['option'], value: map['value'], disabled: map['disabled'] ?? false);
  }

  Map<String, dynamic> toMap() {
    return {'option': option, 'value': value, 'disabled': disabled};
  }
}

class SelectPicker extends StatelessWidget {
  final List<Option> options;
  final Function(Option)? onSelect;
  final Option? initialValue;
  final String? textConfirm;

  const SelectPicker({Key? key, this.options = const [], this.onSelect, this.initialValue, this.textConfirm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int i = this.options.indexWhere((e) => e.toMap().toString() == initialValue?.toMap().toString());
    i = i == -1 ? 0 : i;

    List<String> options = this.options.map((e) => e.option).toList();
    List values = this.options.map((e) => e.value).toList();

    Map<String, dynamic> result = values.isEmpty
        ? {'option': options.isEmpty ? null : options[i]}
        : {'option': options.isEmpty ? null : options[i], 'value': values.isEmpty ? null : values[i]};

    Color primaryColor = LazyUi.getConfig.primaryColor;
    double radius = LazyUi.getConfig.radius;
    BorderRadiusGeometry borderRadius = Br.radiusOnly(tl: radius, tr: radius);

    bool isMobile = context.width < 600;

    double toDecimal(double value) {
      return value >= 1000 ? .4 : value / pow(10, value.ceil().toString().length);
    }

    return FractionallySizedBox(
      widthFactor: isMobile ? 1 : toDecimal(context.width),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            ScrollConfiguration(
              behavior: NoScrollGlow(),
              child: Container(
                height: isMobile ? 300 : context.height * .5,
                decoration: BoxDecoration(color: Colors.white, borderRadius: borderRadius),
                child: SafeArea(
                  top: false,
                  child: Column(
                    children: [
                      Expanded(
                        child: CupertinoPicker(
                            magnification: 1,
                            useMagnifier: false,
                            itemExtent: 40,
                            offAxisFraction: 0,
                            diameterRatio: 1,
                            scrollController: FixedExtentScrollController(initialItem: i),
                            selectionOverlay: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(border: Br.only(['b'])),
                            ),

                            // This is called when selected item is changed.
                            onSelectedItemChanged: (int selectedItem) {
                              if (onSelect != null) {
                                if (values.isNotEmpty) {
                                  result = {'option': options[selectedItem], 'value': values.length < selectedItem ? null : values[selectedItem]};
                                } else {
                                  result = {'option': options[selectedItem]};
                                }
                              }
                            },
                            children: List<Widget>.generate(options.length, (int index) {
                              return Center(
                                child: Text(
                                  options[index],
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
                                ),
                              );
                            })),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 25,
                      blurRadius: 20,
                      offset: Offset(0, -4), // changes position of shadow
                    ),
                  ],
                ),
                child: InkW(
                    onTap: () {
                      if (onSelect != null) {
                        onSelect?.call(Option.fromMap(result));
                        Navigator.pop(context);
                      }
                    },
                    margin: Ei.only(b: 20),
                    radius: Br.radius(50),
                    padding: Ei.sym(v: 10, h: 45),
                    color: Utils.hex('f1f5f9'),
                    child: Text(textConfirm ?? 'Select',
                        textAlign: Ta.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: primaryColor, fontWeight: Fw.bold, letterSpacing: 1))),
              ),
            )),
            Positioned.fill(
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Touch(
                      onTap: () => Navigator.pop(context),
                      child: Iconr(
                        La.angleDown,
                        color: Colors.black54,
                        padding: Ei.all(20),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
