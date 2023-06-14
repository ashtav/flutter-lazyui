part of widgets;

class SelectPicker extends StatelessWidget {
  final List<Option> options;
  final Function(Option)? onSelect;
  final Option? initialValue;
  final String? textConfirm;
  final bool fullScreen;

  const SelectPicker({Key? key, this.options = const [], this.onSelect, this.initialValue, this.textConfirm, this.fullScreen = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int i = this.options.indexWhere((e) => e.toMap().toString() == initialValue?.toMap().toString());
    i = i == -1 ? 0 : i;

    List<String> options = this.options.map((e) => e.option).toList();
    List values = this.options.map((e) => e.value).toList();

    Map<String, dynamic> result = values.isEmpty
        ? {'option': options.isEmpty ? null : options[i]}
        : {'option': options.isEmpty ? null : options[i], 'value': values.isEmpty ? null : values[i]};

    double radius = LazyUi.getConfig.radius;
    BorderRadiusGeometry borderRadius = Br.radiusOnly(tl: radius, tr: radius);

    bool isMobile = context.width < 600;

    double toDecimal(double value) {
      return value >= 1000 ? .4 : value / pow(10, value.ceil().toString().length);
    }

    double magnification = fullScreen ? 1.5 : 1.2;
    double diameterRatio = fullScreen ? .5 : .8;
    double squeeze = fullScreen ? .5 : 1;

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
                height: fullScreen
                    ? context.height
                    : isMobile
                        ? 300
                        : context.height * .5,
                decoration: BoxDecoration(color: Colors.white, borderRadius: borderRadius),
                child: SafeArea(
                  top: false,
                  child: Column(
                    children: [
                      Expanded(
                        child: CupertinoPicker(
                            magnification: magnification,
                            useMagnifier: false,
                            itemExtent: 40,
                            offAxisFraction: 0,
                            diameterRatio: diameterRatio,
                            squeeze: squeeze,
                            scrollController: FixedExtentScrollController(initialItem: i),
                            selectionOverlay: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(border: Br.only(['b', 't'])),
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
                                child: Container(
                                  constraints: BoxConstraints(maxWidth: context.width * .75),
                                  child: Text(
                                    options[index],
                                    overflow: Tof.ellipsis,
                                    textAlign: Ta.center,
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
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

                                return InkW(
                                    onTap: () {
                                      if (onSelect != null) {
                                        onSelect?.call(Option.fromMap(result));
                                        Navigator.pop(context);
                                      }
                                    },
                                    padding: Ei.sym(v: 13, h: confirm.length > 25 ? 25 : 45),
                                    radius: Br.radius(25),
                                    color: Utils.hex('fff'),
                                    border: Br.all(),
                                    child: Container(
                                      constraints: BoxConstraints(maxWidth: context.width * .4),
                                      child: Text(
                                        confirm,
                                        textAlign: Ta.center,
                                        maxLines: 1,
                                        overflow: Tof.ellipsis,
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
      {required List<Option> options, Function(Option)? onSelect, Option? initialValue, String? textConfirm, bool fullScreen = false}) {
    context.bottomSheet(SelectPicker(options: options, fullScreen: fullScreen, onSelect: onSelect),
        backgroundColor: Colors.transparent, useSafeArea: !fullScreen);
  }
}
