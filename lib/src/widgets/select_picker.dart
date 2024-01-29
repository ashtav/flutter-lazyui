part of widget;

/// `SelectPicker` is a Flutter widget that provides a picker for selecting an option from a list of choices. It allows users to choose from a list of options and provides a callback function to handle the selected option.
///
/// Example usage:
/// ```dart
/// SelectPicker(
///   options: myOptions, // List of available options.
///   onSelect: (selectedOption) {
///     // Handle the selected option here.
///   },
///   initialValue: selectedOption, // Initial selected option (optional).
///   textConfirm: 'Confirm', // Text for the confirmation button (optional).
///   fullScreen: false, // Whether to display the picker in full screen (optional).
///   maxLines: 3, // Maximum number of lines for option text (optional).
/// )
/// ```
class SelectPicker {
  static show(BuildContext context,
      {required List<Option> options,
      Function(Option)? onSelect,
      Option? initialValue,
      String? textConfirm,
      bool fullScreen = false,
      bool withSearch = false,
      double? height,
      int maxLines = 1}) {
    context.bottomSheet(
        SelectPickerWidget(
            initialValue: initialValue,
            options: options,
            fullScreen: fullScreen,
            withSearch: withSearch,
            onSelect: onSelect,
            maxLines: maxLines,
            height: height),
        backgroundColor: Colors.transparent,
        safeArea: !fullScreen);
  }
}

class SelectPickerWidget extends StatefulWidget {
  /// List of available options to choose from.
  final List<Option> options;

  /// Callback function to handle the selected option.
  final Function(Option)? onSelect;

  /// Initial selected option (optional).
  final Option? initialValue;

  /// Text for the confirmation button (optional).
  final String? textConfirm;

  /// Whether to display the picker in full screen (optional).
  final bool fullScreen;

  /// Whether to display the search bar (optional).
  final bool withSearch;

  /// Maximum number of lines for option text (optional).
  final int? maxLines;

  /// Height of the picker (optional), minimum is 300.
  final double? height;

  const SelectPickerWidget(
      {Key? key,
      this.options = const [],
      this.onSelect,
      this.initialValue,
      this.textConfirm,
      this.fullScreen = false,
      this.withSearch = false,
      this.maxLines,
      this.height})
      : super(key: key);

  @override
  State<SelectPickerWidget> createState() => _SelectPickerWidgetState();
}

class _SelectPickerWidgetState extends State<SelectPickerWidget> {
  final notifier = SelectPickerNotifier();

  double radius = LazyUi.radius;
  BorderRadiusGeometry borderRadius = Br.radiusOnly(tl: 0, tr: 0);
  double magnification = 1,
      diameterRatio = 1,
      squeeze = 1,
      itemExtent = 40,
      height = 300,
      maxLines = 1;

  double toDecimal(double value) {
    return value >= 1000 ? .4 : value / pow(10, value.ceil().toString().length);
  }

  void onInitials() {
    borderRadius = Br.radiusOnly(tl: radius, tr: radius);

    int i = widget.options.indexWhere(
        (e) => e.toMap().toString() == widget.initialValue?.toMap().toString());
    i = (i == -1 ? 0 : i);

    // set initial index
    notifier.index = i;
    notifier.scroll = FixedExtentScrollController(initialItem: i);

    notifier.options = widget.options.map((e) => e.option).toList();
    notifier.values = widget.options.map((e) => e.value).toList();

    // set original data
    notifier.originalOptions = notifier.options;
    notifier.originalValues = notifier.values;

    notifier.result = notifier.values.isEmpty
        ? {'option': notifier.options.isEmpty ? null : notifier.options[i]}
        : {
            'option': notifier.options.isEmpty ? null : notifier.options[i],
            'value': notifier.values.isEmpty ? null : notifier.values[i]
          };

    maxLines = (widget.maxLines ?? 1).toDouble();

    if (maxLines >= 4) {
      maxLines = 4;
    }

    magnification = maxLines > 1
        ? 1
        : widget.fullScreen
            ? 1.5
            : 1.2;
    diameterRatio = widget.fullScreen ? 1 : .8;
    squeeze = 1.2;
    itemExtent = 40 * maxLines;

    height = widget.fullScreen ? context.height : 300;

    if (maxLines > 2) {
      height += (20 * maxLines);
    }

    if (widget.height != null && !widget.fullScreen) {
      height = widget.height! < 300 ? 300 : widget.height!;
    }

    notifier.setHeight(height);
  }

  @override
  void initState() {
    super.initState();

    onInitials();
  }

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = context.width < 600;

    return FractionallySizedBox(
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
                    height: state.height,
                    decoration: BoxDecoration(
                        color: Colors.white, borderRadius: borderRadius),
                    child: SafeArea(
                      top: false,
                      child: Column(
                        children: [
                          Expanded(
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
                                      border: Br.only(['b', 't'])),
                                ),

                                // This is called when selected item is changed.
                                onSelectedItemChanged: (int selectedItem) {
                                  if (widget.onSelect != null) {
                                    notifier.index = selectedItem;
                                    int i = notifier.index;

                                    if (notifier.values.isNotEmpty) {
                                      notifier.result = {
                                        'option': notifier.options[i],
                                        'value': notifier.values.length < i
                                            ? null
                                            : notifier.values[i]
                                      };
                                    } else {
                                      notifier.result = {
                                        'option': notifier.options[i]
                                      };
                                    }
                                  }
                                },
                                children: List<Widget>.generate(
                                    notifier.options.length, (int index) {
                                  return Center(
                                    child: Container(
                                      constraints: BoxConstraints(
                                          maxWidth: context.width * .75),
                                      child: Text(
                                        notifier.options[index],
                                        overflow: Tof.ellipsis,
                                        textAlign: Ta.center,
                                        maxLines: maxLines.toInt(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(fontSize: 16),
                                      ),
                                    ),
                                  );
                                })),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
            Positioned.fill(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: Maa.center,
                        children: [
                          const SizedBox(width: 60),
                          SlideUp(
                            delay: 300,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Utils.hex('fafafa'),
                                    spreadRadius: 15,
                                    blurRadius: 25,
                                    offset: const Offset(0, -5),
                                  ),
                                ],
                              ),
                              child: Builder(builder: (context) {
                                String confirm = widget.textConfirm ?? 'Select';

                                return InkTouch(
                                    onTap: () {
                                      if (widget.onSelect != null) {
                                        widget.onSelect?.call(
                                            Option.fromMap(notifier.result));
                                        Navigator.pop(context);
                                      }
                                    },
                                    padding: Ei.sym(
                                        v: 13,
                                        h: confirm.length > 25 ? 25 : 45),
                                    radius: Br.radius(25),
                                    color: Utils.hex('fff'),
                                    border: Br.all(),
                                    child: Container(
                                      constraints: BoxConstraints(
                                          maxWidth: context.width * .4),
                                      child: Text(
                                        confirm,
                                        textAlign: Ta.center,
                                        maxLines: 1,
                                        overflow: Tof.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              fontWeight: Fw.bold,
                                              color: LzColors.black,
                                            ),
                                      ),
                                    ));
                              }),
                            ),
                          ),
                          Touch(
                            onTap: () => context.lzPop(),
                            child: SlideUp(
                              delay: 400,
                              child: Iconr(
                                La.times,
                                padding: Ei.all(20),
                              ),
                            ),
                          )
                        ],
                      ).margin(b: 15, l: 0),
                    ))),

            // search bar
            Poslign(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Expanded(
                      child: LzTextField(
                    hint: 'Type to search',
                    controller: notifier.keyword,
                    listenKeyboard: (active) {
                      double newHeight = active ? (context.height) : height;
                      notifier.setHeight(newHeight);
                    },
                    onChange: (keyword) {
                      notifier.onSearch(keyword);
                    },
                    prefixIcon: const Iconr(
                      La.search,
                      flipX: true,
                    ),
                  )),
                  notifier.watch((state) => state.found == 0
                      ? const None()
                      : Textr(state.found.toString(), margin: Ei.only(r: 15)))
                ],
              ).margin(all: 5),
            )
          ],
        ),
      ),
    );
  }
}

// select picker notifier
class SelectPickerNotifier extends ChangeNotifier {
  double height = 300;
  TextEditingController keyword = TextEditingController();
  FixedExtentScrollController scroll =
      FixedExtentScrollController(initialItem: 0);

  List<String> options = [], originalOptions = [];
  List values = [], originalValues = [];
  Map<String, dynamic> result = {};
  int index = 0;
  int found = 0;

  void setHeight(double value) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      height = value;
      notifyListeners();
    });
  }

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

      logg(
          'o: ${options.length}, oo: ${originalOptions.length}, index: $index');
      notifyListeners();
    } catch (e, s) {
      Utils.errorCatcher(e, s);
    }
  }
}

// select picker seacrh widget

class SelectPickerSearchWidget extends StatelessWidget {
  const SelectPickerSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Option'),
      ),
    );
  }
}
