import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

/// A stateful widget for displaying a picker with a list of options.
class LzPickerOption extends StatefulWidget {
  /// The list of options to display in the picker.
  final List<Option> options;

  /// The initial selected option.
  final Option? initialValue;

  /// A function called when an option is selected.
  final Function(Option)? onSelect;

  /// The style configuration for the picker.
  final PickerStyle? style;

  /// Create widget
  const LzPickerOption({
    super.key,
    this.options = const [],
    this.initialValue,
    this.onSelect,
    this.style,
  });

  @override
  State<LzPickerOption> createState() => _LzPickerOptionState();
}

class _LzPickerOptionState extends State<LzPickerOption> {
  final notifier = SelectPickerNotifier();
  FocusNode focusNode = FocusNode();

  double radius = LazyUi.radius;
  BorderRadiusGeometry borderRadius = Br.radiusOnly(tl: 0, tr: 0);
  double magnification = 1,
      diameterRatio = 1,
      squeeze = 1,
      itemExtent = 40,
      maxLines = 1;
  bool fullScreen = false, withSearch = false;
  String confirmText = 'Select';

  double toDecimal(double value) {
    return value >= 1000 ? .4 : value / pow(10, value.ceil().toString().length);
  }

  void onInitialized() {
    fullScreen = widget.style?.fullScreen ?? false;
    withSearch = widget.style?.withSearch ?? false;
    maxLines = (widget.style?.maxLines ?? 1).toDouble();
    confirmText = widget.style?.confirmText ?? 'Select';

    borderRadius = Br.radiusOnly(tl: radius, tr: radius);

    int i = widget.options.indexWhere(
        (e) => e.toMap().toString() == widget.initialValue?.toMap().toString());
    i = (i == -1 ? 0 : i);

    // set initial index
    notifier.index = i;
    notifier.scroll = FixedExtentScrollController(initialItem: i);

    notifier.options = widget.options.map((e) => e.label).toList();
    notifier.values = widget.options.map((e) => e.value).toList();

    // set original data
    notifier.originalOptions = notifier.options;
    notifier.originalValues = notifier.values;

    notifier.result = notifier.values.isEmpty
        ? {'label': notifier.options.isEmpty ? null : notifier.options[i]}
        : {
            'label': notifier.options.isEmpty ? null : notifier.options[i],
            'value': notifier.values.isEmpty ? null : notifier.values[i]
          };

    // get current option and check disabled
    if (widget.options.isNotEmpty) {
      final option = widget.options[i];
      notifier.setDisabled(option.disabled);
    }
  }

  void setHeight() {
    magnification = maxLines > 1
        ? 1
        : fullScreen
            ? 1.5
            : 1.2;
    diameterRatio = fullScreen ? 1 : .8;
    squeeze = 1.2;

    double defaultHeight = widget.style?.height ?? (context.height / 2) - 100;
    double height = fullScreen
        ? context.height
        : defaultHeight > context.height
            ? context.height
            : defaultHeight < 310
                ? 310
                : defaultHeight;

    if (maxLines > 2) {
      height += (20 * maxLines);
    }

    if (!fullScreen) {
      height = height < defaultHeight ? defaultHeight : height;
    }

    notifier.defaultHeight = height;
    notifier.setHeight(height);
  }

  @override
  void initState() {
    super.initState();
    onInitialized();

    Bindings.onRendered(() {
      setHeight();
    });
  }

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = context.width < 600;

    bool isLineAwesome = LazyUi.iconType == IconType.lineAwesome;
    IconData searchIcon = isLineAwesome ? La.search : Ti.search;

    maxLines = maxLines >= 4 ? 4 : maxLines;
    itemExtent = 40 * maxLines;

    Color backgroundColor = lzDarkMode ? '333'.hex : 'f1f1f1'.hex;
    final font = Gfont.style(context);

    return Wrapper(
      child: FractionallySizedBox(
        widthFactor: isMobile ? 1 : toDecimal(context.width),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              ScrollConfiguration(
                behavior: Unglow(),
                child: notifier.watch((state) => AnimatedContainer(
                      duration: 150.ms,
                      decoration: BoxDecoration(
                          color: backgroundColor, borderRadius: borderRadius),
                      height: state.height,
                      padding:
                          Ei.only(b: state.isExpanded ? state.height / 4 : 0),
                      child: SafeArea(
                        top: false,
                        child: CupertinoPicker(
                            magnification: magnification,
                            useMagnifier: false,
                            itemExtent: itemExtent,
                            offAxisFraction: 0,
                            diameterRatio: diameterRatio,
                            squeeze: squeeze,
                            scrollController: notifier.scroll,
                            selectionOverlay: Container(
                              alignment: Alignment.center,
                              decoration:
                                  BoxDecoration(border: Br.only(['b', 't'])),
                            ),

                            // This is called when selected item is changed.
                            onSelectedItemChanged: (int selectedItem) {
                              if (widget.onSelect != null) {
                                notifier.index = selectedItem;
                                int i = notifier.index;

                                if (notifier.values.isNotEmpty) {
                                  notifier.result = {
                                    'label': notifier.options[i],
                                    'value': notifier.values.length < i
                                        ? null
                                        : notifier.values[i]
                                  };
                                } else {
                                  notifier.result = {
                                    'label': notifier.options[i]
                                  };
                                }
                              }

                              notifier.setDisabled(
                                  widget.options[selectedItem].disabled);
                            },
                            children: notifier.options.generate((item, i) {
                              final option = widget.options[i];
                              bool disabled = option.disabled;

                              return Center(
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: context.width * .75),
                                  child: Text(
                                    item,
                                    overflow: Tof.ellipsis,
                                    textAlign: Ta.center,
                                    maxLines: maxLines.toInt(),
                                    style: LazyUi.font.copyWith(
                                      color: disabled
                                          ? Colors.black12.adaptWithTheme
                                          : Colors.black87.adaptWithTheme,
                                    ),
                                  ),
                                ),
                              );
                            })),
                      ),
                    )),
              ),

              // confirm button
              Poslign(
                  alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: Maa.center,
                      children: [
                        const SizedBox(
                            width: 60), // empty space to center the button
                        SlideAnimate(
                          delay: 300,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: lzDarkMode ? '333'.hex : 'fafafa'.hex,
                                  spreadRadius: 15,
                                  blurRadius: 25,
                                  offset: const Offset(0, -5),
                                ),
                              ],
                            ),
                            child: Builder(builder: (context) {
                              return notifier.watch((state) => ConfirmButton(
                                    confirmText,
                                    disabled: state.disabled,
                                    onTap: state.disabled
                                        ? null
                                        : () {
                                            widget.onSelect?.call(
                                                Option.fromMap(
                                                    notifier.result));
                                            Navigator.pop(context);
                                          },
                                  ));
                            }),
                          ),
                        ),
                        SlideAnimate(
                          delay: 400,
                          child: Iconr(
                            La.times,
                            padding: Ei.all(20),
                          ).onTap(() => context.lz.pop()),
                        )
                      ],
                    ).margin(b: 15, l: 0),
                  )),

              // search bar widget
              Poslign(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    if (withSearch)
                      Expanded(
                          child: LzTextField(
                        hint: 'Type to search',
                        controller: notifier.keyword,
                        listenKeyboard: (active) {
                          double newHeight = active
                              ? (context.height)
                              : notifier.defaultHeight;
                          notifier.setHeight(newHeight);
                        },
                        onChange: (keyword) {
                          notifier.onSearch(keyword);
                        },
                        node: focusNode,
                        onSubmit: (_) {
                          focusNode.unfocus();
                        },
                        prefixIcon: Iconr(
                          searchIcon,
                          flipX: isLineAwesome,
                          size: 16,
                        ),
                      )),
                    notifier.watch((state) => state.found == 0
                        ? const None()
                        : Textr(state.found.toString(), margin: Ei.only(r: 15)))
                  ],
                ).margin(all: 5),
              ),

              // title & description
              if (widget.style?.title != null &&
                  widget.style?.withSearch == false)
                Poslign(
                    alignment: Alignment.topLeft,
                    margin: Ei.all(20),
                    child: Column(
                      children: [
                        Text(widget.style!.title!, style: font.bold),
                        if (widget.style?.description != null)
                          Text(widget.style!.description!,
                              style: font.fs14.muted),
                      ],
                    ).start.gap(2).lz.ignore())
            ],
          ),
        ),
      ),
    );
  }
}

/// A button widget for confirming actions.
class ConfirmButton extends StatelessWidget {
  /// The text displayed on the button.
  final String text;

  /// A function called when the button is tapped.
  final Function()? onTap;

  /// A flag indicating whether the button is disabled.
  final bool disabled;

  /// Create widget
  const ConfirmButton(this.text,
      {super.key, this.onTap, this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return InkTouch(
        onTap: onTap,
        padding: Ei.sym(v: 11, h: text.length > 25 ? 25 : 45),
        radius: Br.radius(50),
        color: lzDarkMode
            ? '222'.hex
            : disabled
                ? 'f5f5f5'.hex
                : Colors.white,
        border: Br.all(),
        child: Container(
          constraints: BoxConstraints(maxWidth: context.width * .4),
          child: Text(
            text,
            textAlign: Ta.center,
            maxLines: 1,
            overflow: Tof.ellipsis,
            style: LazyUi.font.copyWith(
                fontWeight: Fw.bold, color: Colors.black87.adaptWithTheme),
          ),
        )).lz.disabled(disabled);
  }
}

/// A notifier for managing state related to a select picker.
class SelectPickerNotifier extends ChangeNotifier {
  /// A controller for handling the keyword input.
  TextEditingController keyword = TextEditingController();

  /// A controller for handling scrolling within the picker.
  FixedExtentScrollController scroll =
      FixedExtentScrollController(initialItem: 0);

  /// A list of options available for selection.
  List<String> options = [];

  /// A copy of the original list of options.
  List<String> originalOptions = [];

  /// A list of selected values.
  List<dynamic> values = [];

  /// A copy of the original list of values.
  List<dynamic> originalValues = [];

  /// A map containing the result of the selection.
  Map<String, dynamic> result = {};

  /// The default height of the picker.
  double defaultHeight = 300;

  /// The current height of the picker.
  double height = 300;

  /// The index of the selected option.
  int index = 0;

  /// The number of options found.
  int found = 0;

  /// This is used to disabled item in select picker
  bool disabled = false, isExpanded = false;

  /// Set disabled
  void setDisabled(bool value) {
    disabled = value;
    notifyListeners();
  }

  /// Set height
  void setHeight(double value) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      height = value;
      isExpanded = value > defaultHeight;
      notifyListeners();
    });
  }

  /// Do search
  void onSearch(String value) {
    try {
      // if (value.isEmpty) {
      //   options = originalOptions;
      //   values = originalValues;
      //   index = 0;
      // } else {
      //   options = originalOptions.where((element) => element.toLowerCase().contains(value.toLowerCase())).toList();
      //   values =
      //       originalValues.where((element) => element.toString().toLowerCase().contains(value.toLowerCase())).toList();

      //   index = options.indexWhere((e) => e.toLowerCase().contains(value.toLowerCase()));
      // }

      // result = values.isEmpty
      //     ? {'option': options.isEmpty ? null : options[index]}
      //     : {'option': options.isEmpty ? null : options[index], 'value': values.isEmpty ? null : values[index]};

      // more efficient is to use this
      found = value.trim().isEmpty
          ? 0
          : options
              .where((e) => e.toLowerCase().contains(value.toLowerCase()))
              .length;
      index = options
          .indexWhere((e) => e.toLowerCase().contains(value.toLowerCase()));
      scroll.animateToItem(index, duration: 250.ms, curve: Curves.easeInOut);

      notifyListeners();
    } catch (e, s) {
      Utils.errorCatcher(e, s);
    }
  }
}
