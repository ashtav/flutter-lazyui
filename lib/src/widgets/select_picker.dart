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
class SelectPicker extends StatelessWidget {
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

  /// Maximum number of lines for option text (optional).
  final int? maxLines;

  const SelectPicker(
      {Key? key,
      this.options = const [],
      this.onSelect,
      this.initialValue,
      this.textConfirm,
      this.fullScreen = false,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int i = this.options.indexWhere(
        (e) => e.toMap().toString() == initialValue?.toMap().toString());
    i = i == -1 ? 0 : i;

    List<String> options = this.options.map((e) => e.option).toList();
    List values = this.options.map((e) => e.value).toList();

    Map<String, dynamic> result = values.isEmpty
        ? {'option': options.isEmpty ? null : options[i]}
        : {
            'option': options.isEmpty ? null : options[i],
            'value': values.isEmpty ? null : values[i]
          };

    double radius = LazyUi.radius;
    BorderRadiusGeometry borderRadius = Br.radiusOnly(tl: radius, tr: radius);

    bool isMobile = context.width < 600;

    double toDecimal(double value) {
      return value >= 1000
          ? .4
          : value / pow(10, value.ceil().toString().length);
    }

    double maxLines = (this.maxLines ?? 1).toDouble();

    if (maxLines >= 4) {
      maxLines = 4;
    }

    double magnification = maxLines > 1
        ? 1
        : fullScreen
            ? 1.5
            : 1.2;
    double diameterRatio = fullScreen ? 1 : .8;
    double squeeze = 1.2;
    double itemExtent = 40 * maxLines;

    double height = fullScreen
        ? context.height
        : isMobile
            ? 300
            : context.height * .5;

    if (maxLines > 2) {
      height += (20 * maxLines);
    }

    return FractionallySizedBox(
      widthFactor: isMobile ? 1 : toDecimal(context.width),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            ScrollConfiguration(
              behavior: Unglow(),
              child: Container(
                height: height,
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
                            scrollController:
                                FixedExtentScrollController(initialItem: i),
                            selectionOverlay: Container(
                              alignment: Alignment.center,
                              decoration:
                                  BoxDecoration(border: Br.only(['b', 't'])),
                            ),

                            // This is called when selected item is changed.
                            onSelectedItemChanged: (int selectedItem) {
                              if (onSelect != null) {
                                if (values.isNotEmpty) {
                                  result = {
                                    'option': options[selectedItem],
                                    'value': values.length < selectedItem
                                        ? null
                                        : values[selectedItem]
                                  };
                                } else {
                                  result = {'option': options[selectedItem]};
                                }
                              }
                            },
                            children: List<Widget>.generate(options.length,
                                (int index) {
                              return Center(
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: context.width * .75),
                                  child: Text(
                                    options[index],
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
              ),
            ),
            Positioned.fill(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: Maa.center,
                        children: [
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
                                String confirm = textConfirm ?? 'Select';

                                return InkTouch(
                                    onTap: () {
                                      if (onSelect != null) {
                                        onSelect?.call(Option.fromMap(result));
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
                            onTap: () => context.pop(),
                            child: SlideUp(
                              delay: 400,
                              child: Iconr(
                                La.times,
                                padding: Ei.all(20),
                              ),
                            ),
                          )
                        ],
                      ).margin(b: 15, l: 60),
                    ))),
          ],
        ),
      ),
    );
  }

  static show(BuildContext context,
      {required List<Option> options,
      Function(Option)? onSelect,
      Option? initialValue,
      String? textConfirm,
      bool fullScreen = false,
      int maxLines = 1}) {
    context.bottomSheet(
        SelectPicker(
            options: options,
            fullScreen: fullScreen,
            onSelect: onSelect,
            maxLines: maxLines),
        backgroundColor: Colors.transparent,
        useSafeArea: !fullScreen);
  }
}
