import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/config.dart';
import 'package:lazyui/src/icons/icons_map.dart';
import 'package:lazyui/src/theme/color.dart';

import '../date/date_picker.dart';
import 'notifier.dart';

/// A stateful widget for displaying a picker with a list of options.
class PickerOptionWidget extends StatefulWidget {
  /// The list of options to display in the picker.
  final List<Option> options;

  /// The initial selected option.
  final Option? initialValue;

  /// A function called when an option is selected.
  final void Function(Option)? onSelect;

  /// The style configuration for the picker.
  final OptionPickerStyle? style;

  /// Create widget
  const PickerOptionWidget({
    super.key,
    this.options = const [],
    this.initialValue,
    this.onSelect,
    this.style,
  });

  @override
  State<PickerOptionWidget> createState() => _PickerOptionWidgetState();
}

class _PickerOptionWidgetState extends State<PickerOptionWidget> {
  final notifier = OptionPickerNotifier();
  FocusNode focusNode = FocusNode();

  double radius = config.borderRadius;
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

    double defaultHeight = widget.style?.height ?? (context.height * .5);
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

    maxLines = maxLines >= 4 ? 4 : maxLines;
    itemExtent = 40 * maxLines;

    return SafeArea(
      child: Unfocuser(
        child: FractionallySizedBox(
          widthFactor: isMobile ? 1 : toDecimal(context.width),
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                ScrollGlowless(
                  child: notifier.watch((state) => AnimatedContainer(
                        duration: 150.ms,
                        decoration: BoxDecoration(
                            color: context.isDarkMode
                                ? darkAppbarColor
                                : scaffoldBackgroundColor),
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
                                decoration: BoxDecoration(
                                    color: Colors.black
                                        .applyOpacity(.03)
                                        .themeify),
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

                                Color textColor = (context.isDarkMode
                                        ? Colors.white
                                        : Colors.black)
                                    .applyOpacity(disabled ? .2 : 1);

                                return Center(
                                  child: Container(
                                    constraints: BoxConstraints(
                                        maxWidth: context.width * .75),
                                    child: Text(item,
                                        overflow: Tof.ellipsis,
                                        textAlign: Ta.center,
                                        maxLines: maxLines.toInt(),
                                        style: config.font
                                            .copyWith(color: textColor)),
                                  ),
                                );
                              })),
                        ),
                      )),
                ),

                // confirm button
                notifier.watch((state) => ConfirmButton(
                      confirmText: widget.style?.confirmText ?? 'Select',
                      confirmTextColor: widget.style?.confirmTextColor,
                      buttonColor: widget.style?.buttonColor,
                      onConfirm: () {
                        widget.onSelect?.call(Option.fromMap(notifier.result));
                        context.lz.pop();
                      },
                      onCancel: () => context.lz.pop(),
                      disabled: state.disabled,
                    )),

                // search bar widget
                if (withSearch)
                  Poslign(
                    alignment: Alignment.topLeft,
                    child: notifier.watch((state) => AnimatedContainer(
                          duration: 250.ms,
                          padding: Ei.only(
                              t: state.isExpanded ||
                                      widget.style?.fullScreen == true
                                  ? context.windowPadding.top
                                  : 0),
                          child: LzTextField(
                            hint: 'Type to search',
                            border: InputBorder.none,
                            controller: notifier.keyword,
                            onFocus: (value) {
                              double newHeight = value
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
                            prefixIcon: Icon(ConfigIcon.get(IconSet.search)),
                          ),
                        )),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
