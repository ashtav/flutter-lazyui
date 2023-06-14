part of widgets;

class LzDropdownController {
  final Option option;
  final void Function() back;

  LzDropdownController({required this.option, required this.back});
}

class LzDropdownOption {
  static Future show(
    BuildContext? context, {
    required List<Option> options,
    final Map<int, List<Option>> subOptions = const {},
    Function(LzDropdownController)? onSelect,
    final Offset offset = const Offset(20, 0),
    final LzDropdownStyle? style,
    final bool dismissOnSelect = true,
  }) async {
    if (context == null) {
      logg('Context cannot be null');
      return;
    }

    await showDialog(
      context: context,
      builder: (_) => _LzDropdownWidget(
          context: context,
          options: options,
          subOptions: subOptions,
          offset: offset,
          onSelect: onSelect,
          style: style,
          dismissOnSelect: dismissOnSelect),
    );
  }
}

class LzDropdownStyle {
  final bool useBorder;
  final List<int> separators;
  final double separatorHeight;

  const LzDropdownStyle({
    this.useBorder = true,
    this.separators = const [],
    this.separatorHeight = 1,
  });
}

class _LzDropdownWidget extends StatelessWidget {
  final BuildContext context;
  final List<Option> options;
  final Map<int, List<Option>> subOptions;
  final Offset offset;
  final Function(LzDropdownController)? onSelect;
  final LzDropdownStyle? style;
  final bool dismissOnSelect;

  const _LzDropdownWidget(
      {required this.context,
      required this.options,
      this.subOptions = const {},
      this.offset = Offset.zero,
      this.onSelect,
      this.style,
      this.dismissOnSelect = true});

  @override
  Widget build(BuildContext context) {
    final dropdownKey = GlobalKey();
    final controller = StreamController<Offset>();
    final caretController = StreamController<CaretValue>();
    final notifier = LzDropdownNotifier();

    notifier.setOptions(options);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!this.context.mounted) {
        return;
      }

      // content is out of screen
      bool isOut = false;

      // render box of the widget
      final box = this.context.findRenderObject() as RenderBox?;
      final o = box?.localToGlobal(Offset.zero);

      // get x and y values
      double dx = o?.dx ?? 0;
      double dy = o?.dy ?? 0;

      // get height of the widget (not dropdown item / content)
      double itemHeight = box?.size.height ?? 0;
      double itemWidth = box?.size.width ?? 0;

      // get dropdown width
      final localBox = dropdownKey.currentContext?.findRenderObject() as RenderBox?;
      double ddWidth = localBox?.size.width ?? 0;
      double ddHeight = localBox?.size.height ?? 0;

      // get status bar height
      double statusBarHeight = context.windowPadding.top;

      // reinitialize y value
      dy += statusBarHeight;

      if (itemWidth >= context.width) {
        dx += itemWidth;
      }

      // prevent dx from going out of screen
      if (dx < 0) dx = (0 + offset.dx);
      if ((dx + ddWidth + offset.dx) > context.width) {
        dx = (context.width - ddWidth - (offset.dx));
      }

      // prevent dy from going out of screen
      if (dy + ddHeight > context.height) {
        dy = dy - ddHeight - itemHeight;
        isOut = true;
      }

      if (dx <= 0) {
        dx += offset.dx;
      }

      dy += isOut ? (offset.dy + 7) : offset.dy - 17;
      controller.sink.add(Offset(dx, dy));

      // set caret position
      double dxCaret = (o?.dx ?? 0);
      double dyCaret = (o?.dy ?? 0);

      // caret position if item width >= screen width
      double caretPosMax = (context.width - (30 + offset.dx));

      // care position if is out of screen
      double caretYPosOut = (dyCaret - (30 + offset.dy + 5));
      double caretXPos = dxCaret + (itemWidth / 2) - 10; // 10 = caret width

      double cx = itemWidth >= context.width ? caretPosMax : caretXPos;
      double cy = isOut ? caretYPosOut : dyCaret + 20;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        // get final dropdown position
        final finalDropdown = dropdownKey.currentContext?.findRenderObject() as RenderBox?;
        final ddOffset = finalDropdown?.localToGlobal(Offset.zero);

        double ddXleft = ddOffset?.dx ?? 0;
        double ddXRight = (ddXleft + ddWidth - offset.dx);

        if (cx > ddXRight) {
          cx = ddXRight - 15;
        } else if (cx < ddXleft) {
          cx = ddXleft + 15;
        }

        caretController.sink.add(CaretValue(flip: isOut, offset: Offset(cx, cy)));
      });

      // note: 17 = (5 + content margin)
      // logg(
      //     'dx: $dx, dy: $dy, ddWidth: $ddWidth, ddHeight: $ddHeight, itemHeight: $itemHeight, itemWidth: $itemWidth, statusBarHeight: $statusBarHeight, screenWidth: ${context.width}, isOut: $isOut');
    });

    /* ---------------------------------------------------------------------------------
    | Caret Widget
    | */

    Widget caretWidget = StreamBuilder<CaretValue>(
        stream: caretController.stream,
        builder: (_, snap) {
          CaretValue value = snap.data ?? CaretValue(flip: false, offset: Offset.zero);

          bool flip = value.flip;
          Offset offset = value.offset;

          double dx = offset.dx, dy = offset.dy;

          return Positioned(
              top: dy,
              left: dx,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(flip ? 180 / 360 : 0),
                child: CustomPaint(
                  painter: CaretPainter(
                    strokeColor: Colors.white,
                    paintingStyle: PaintingStyle.fill,
                    skew: 2,
                  ),
                  child: const SizedBox(
                    height: 10,
                    width: 20,
                  ),
                ),
              ));
        });

    /* ---------------------------------------------------------------------------------
    | Content
    | */

    bool useBorder = style?.useBorder ?? true;
    List<int> separators = style?.separators ?? [];
    double separatorHeight = style?.separatorHeight ?? 1;

    if (separatorHeight > 5) separatorHeight = 5;

    Widget content = Container(
      key: dropdownKey,
      margin: Ei.only(v: 12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: Br.radius(5)),
      constraints: BoxConstraints(maxHeight: context.height * .6),
      child: SingleChildScrollView(
          physics: BounceScroll(),
          child: notifier.watch(
            (_) {
              final options = notifier.options;

              return Col(
                children: List.generate(options.length, (i) {
                  final option = options[i];

                  String optionName = option.option;
                  IconData? icon = option.icon;

                  bool disabled = option.disabled;

                  Widget child = InkW(
                    onTap: disabled
                        ? null
                        : () {
                            // check sub options
                            if (subOptions[i] != null && notifier.level == 0) {
                              notifier.setOptions(subOptions[i] ?? [], level: 1);
                            } else {
                              if (dismissOnSelect) context.pop();

                              final selected = Option.fromMap({...option.toMap(), 'index': i});
                              onSelect?.call(LzDropdownController(
                                  option: selected,
                                  back: () {
                                    notifier.setOptions(this.options, level: 0);
                                  }));
                            }
                          },
                    padding: Ei.sym(v: 15, h: 20),
                    border: Br.only(['t'],
                        except: useBorder ? i == 0 : !separators.contains(i - 1), width: separators.contains(i - 1) ? separatorHeight : 1),
                    child: Opacity(
                      opacity: disabled ? .4 : 1,
                      child: Container(
                        constraints: const BoxConstraints(minWidth: 200, maxWidth: 250),
                        child: Row(
                          mainAxisSize: Mas.min,
                          children: [
                            if (icon != null) Iconr(icon, margin: Ei.only(r: 15), color: option.style?.color ?? LzColors.dark),
                            Flexible(
                                child: Text(
                              optionName,
                              style: LazyUi.getConfig.textStyle?.copyWith(
                                  color: option.style?.color ?? LzColors.dark, fontWeight: (option.style?.bold ?? false) ? Fw.bold : Fw.normal),
                            )),
                          ],
                        ),
                      ),
                    ),
                  );

                  return SlideUp(key: UniqueKey(), delay: i * 100, child: child);
                }),
              );
            },
          )),
    );

    return Stack(
      children: [
        caretWidget,
        StreamBuilder(
            stream: controller.stream,
            builder: (_, snap) => Positioned(
                left: snap.data?.dx,
                // right: axis == AxisX.right ? snap.data?.dx : null,
                top: snap.data?.dy,
                child: content))
      ],
    );
  }
}

class CaretValue {
  final bool flip;
  final Offset offset;

  CaretValue({this.flip = false, this.offset = Offset.zero});
}

class LzDropdownNotifier extends ChangeNotifier {
  List<Option> mainOptions = [];
  List<Option> options = [];
  int level = 0;

  void setOptions(List<Option> options, {int level = 0}) {
    if (level == 0) mainOptions = options;

    this.options = options;
    this.level = level;
    notifyListeners();
  }
}
