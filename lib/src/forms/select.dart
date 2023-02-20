import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class Option {
  final String? option;
  final dynamic value;

  const Option({this.option, this.value});

  factory Option.fromMap(Map<String, dynamic> map) {
    return Option(option: map['option'], value: map['value']);
  }
}

class Select extends StatelessWidget {
  final String label;
  final IconData? icon;
  final String? hint;
  final bool enabled;
  final int? maxLines;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final Function(TextEditingController? form, Option? option)? onSelect;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final List<Option> options;

  const Select({
    Key? key,
    required this.label,
    this.icon,
    this.hint,
    this.maxLines,
    this.enabled = true,
    this.borderRadius,
    this.border,
    this.margin,
    this.onSelect,
    this.controller,
    this.textStyle,
    this.options = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectWidget(
        label: label,
        hint: hint,
        maxLines: maxLines,
        enabled: enabled,
        borderRadius: borderRadius,
        border: border,
        onSelect: onSelect,
        controller: controller,
        textStyle: textStyle,
        options: options,
        margin: margin,
        onTap: (Option? option, Function(Option) action) {
          open(context, option, onSelect: (o) => action(o));
        });
  }

  Future open(BuildContext context, Option? option, {required Function(Option) onSelect}) async {
    if (options.isEmpty) return;
    FocusScope.of(context).unfocus();
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: ((context) => SelectPicker(
            initialValue: option,
            options: options,
            onSelect: (option) {
              this.onSelect?.call(controller, option);
              controller?.text = option.option ?? '';
              onSelect.call(option);
            })));
  }

  Select copyWith({EdgeInsetsGeometry? margin, BoxBorder? border, BorderRadius? borderRadius, String? hint, TextEditingController? controller}) {
    return Select(
        label: label,
        icon: icon,
        hint: hint,
        maxLines: maxLines,
        enabled: enabled,
        borderRadius: borderRadius,
        border: border,
        margin: margin,
        controller: controller,
        textStyle: textStyle,
        options: options,
        onSelect: onSelect);
  }
}

class SelectPicker extends StatelessWidget {
  final List<Option> options;
  final Function(Option)? onSelect;
  final Option? initialValue;

  const SelectPicker({Key? key, this.options = const [], this.onSelect, this.initialValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int i = this.options.indexWhere((e) => e.value == null ? e.option == initialValue?.option : e.value == initialValue?.value);
    i = i == -1 ? 0 : i;

    List<String> options = this.options.map((e) => e.option ?? '').toList();
    List values = this.options.map((e) => e.value).toList();

    Map<String, dynamic> result = values.isEmpty
        ? {'option': options.isEmpty ? null : options[i]}
        : {'option': options.isEmpty ? null : options[i], 'value': values.isEmpty ? null : values[i]};

    Color primaryColor = LazyConfig.getConfig.primaryColor;
    double radius = LazyConfig.getConfig.radius;
    BorderRadiusGeometry borderRadius = Br.radiusOnly(tl: radius, tr: radius);

    return ClipRRect(
      borderRadius: borderRadius,
      child: Stack(
        children: [
          ScrollConfiguration(
            behavior: NoScrollGlow(),
            child: Container(
              height: 300,
              color: Colors.white,
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
                  child: Text('Select',
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
                      La.bars,
                      color: Colors.black54,
                      padding: Ei.all(20),
                    ),
                  )))
        ],
      ),
    );
  }
}

class SelectWidget extends StatefulWidget {
  final String label;
  final IconData? icon;
  final String? hint;
  final bool enabled;
  final int? maxLines;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final Function(TextEditingController? form, Option? option)? onSelect;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final List<Option> options;
  final Function(Option?, void Function(Option))? onTap;

  const SelectWidget(
      {Key? key,
      required this.label,
      this.icon,
      this.hint,
      this.maxLines,
      this.enabled = true,
      this.borderRadius,
      this.border,
      this.margin,
      this.onSelect,
      this.controller,
      this.textStyle,
      this.options = const [],
      this.onTap})
      : super(key: key);

  @override
  State<SelectWidget> createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  Option? option;

  void setValue(Option o) {
    option = o;
  }

  @override
  Widget build(BuildContext context) {
    double configRadius = LazyConfig.getConfig.radius;

    return Container(
        margin: widget.margin ?? Ei.only(b: 15),
        child: ClipRRect(
          borderRadius: widget.borderRadius ?? Br.radius(configRadius),
          child: InkW(
            onTap: () {
              widget.onTap?.call(option, setValue);
            },
            color: Colors.white,
            child: Container(
              padding: Ei.only(l: 15, r: 15, t: 15, b: 10),
              decoration: BoxDecoration(
                  border: widget.border ?? Border.all(color: Colors.black12, width: .7),
                  borderRadius: widget.borderRadius ?? Br.radius(configRadius)),
              child: Col(children: [
                Container(
                  margin: Ei.only(b: 2, l: 0),
                  child: Row(
                    mainAxisAlignment: Maa.spaceBetween,
                    children: [
                      Text(widget.label, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14)),
                    ],
                  ),
                ),
                SizedBox(
                    child: Row(
                  children: [
                    Expanded(
                      child: Row(children: [
                        widget.icon.isNull ? const None() : Iconr(widget.icon!, color: Colors.white38, margin: Ei.only(r: 15, b: 15)),
                        Expanded(
                            child: TextInputTransparent(
                          hint: widget.hint,
                          enabled: false,
                          controller: widget.controller,
                          maxLines: widget.maxLines,
                          hintStyle: const TextStyle(color: Colors.black45),
                          textStyle: widget.textStyle,
                          contentPadding: Ei.sym(v: 5),
                        )),
                      ]),
                    ),
                    const Icon(
                      La.angle_down,
                    )
                  ],
                ))
              ]),
            ),
          ),
        ));
  }
}
