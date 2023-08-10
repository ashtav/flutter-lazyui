part of widgets;

class LzDropdownController {
  final Option option;
  final void Function() back;

  LzDropdownController({required this.option, required this.back});
}

class CustomOffset {
  final double? ty, by, dx;
  const CustomOffset({this.ty, this.by, this.dx});
}

@Deprecated('Use [DropX] instead')
class LzDropdownOption {
  static Future show(
    BuildContext? context, {
    required List<Option> options,
    final Map<int, List<Option>> subOptions = const {},
    Function(LzDropdownController)? onSelect,
    final CustomOffset? offset,
    final LzDropdownStyle? style,
    final bool dismissOnSelect = true,
    final MainAxisSize mainAxisSize = Mas.min,
  }) async {
    if (context == null) {
      logg('Context not found!');
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
          dismissOnSelect: dismissOnSelect,
          mainAxisSize: mainAxisSize),
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
  final CustomOffset? offset;
  final Function(LzDropdownController)? onSelect;
  final LzDropdownStyle? style;
  final bool dismissOnSelect;
  final MainAxisSize mainAxisSize;

  const _LzDropdownWidget(
      {required this.context,
      required this.options,
      this.subOptions = const {},
      this.offset,
      this.onSelect,
      this.style,
      this.dismissOnSelect = true,
      this.mainAxisSize = Mas.min});

  @override
  Widget build(BuildContext context) {
    final dropdownKey = GlobalKey();
    final controller = StreamController<Offset>();
    final caretController = StreamController<CaretValue>();
    final notifier = LzDropdownNotifier();

    final offsetTy = offset?.ty ?? 0;
    final offsetBy = offset?.by ?? 0;
    final offsetDx = offset?.dx ?? 20;

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

      // get size of widget
      double itemHeight = box?.size.height ?? 0;
      double itemWidth = box?.size.width ?? 0;

      // get size of dropdown
      final localBox =
          dropdownKey.currentContext?.findRenderObject() as RenderBox?;
      double ddWidth = localBox?.size.width ?? 0;
      double ddHeight = localBox?.size.height ?? 0;
      double ddPosY = dy + itemHeight;

      // get status bar height
      // double statusBarHeight = context.windowPadding.top;

      // set x position of dropdown ------------------------------------------------------------------------------------
      if ((dx + ddWidth + offsetDx) > context.width) {
        dx = (context.width - ddWidth - (offsetDx));
      } else if (dx <= 0) {
        dx = (0 + offsetDx);
      }

      // set y position of dropdown ------------------------------------------------------------------------------------

      // // determine screen out
      if ((ddPosY + ddHeight + itemHeight) > context.height) {
        isOut = true;
        // dy = (dy - (ddHeight + (itemHeight / 2)));
        dy = dy - (ddHeight + itemHeight / 2) - offsetBy;
      } else {
        dy += (itemHeight / 2);
      }

      // dy += isOut ? (offset.dy + 7) : offset.dy - 17;
      controller.sink.add(Offset(dx, dy));

      // set caret position --------------------------------------------------------------------------------------------
      double dxCaret = (o?.dx ?? 0);

      // caret position if item width >= screen width
      double caretPosMax = (context.width - (offsetDx));

      // care position if is out of screen
      double caretYPosOut = (dy - (offsetTy + 1)) + (ddHeight);
      double caretXPos = dxCaret + (itemWidth / 2) - 10; // 10 = caret width

      double cx = itemWidth >= context.width ? caretPosMax : caretXPos;
      double cy = isOut ? caretYPosOut : dy - 9;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        // get final dropdown position
        final finalDropdown =
            dropdownKey.currentContext?.findRenderObject() as RenderBox?;
        final ddOffset = finalDropdown?.localToGlobal(Offset.zero);

        double ddXleft = ddOffset?.dx ?? 0;
        double ddXRight = (ddXleft + ddWidth - offsetDx);

        if (cx > ddXRight) {
          cx = ddXRight - 15;
        } else if (cx < ddXleft + 10) {
          cx = ddXleft + 15;
        }

        caretController.sink
            .add(CaretValue(flip: isOut, offset: Offset(cx, cy)));
      });

      // note: 17 = (5 + content margin)
      // logg(
      //     'dx: $dx, dy: $dy, ddWidth: $ddWidth, ddHeight: $ddHeight, itemHeight: $itemHeight, itemWidth: $itemWidth, statusBarHeight: $statusBarHeight, screenWidth: ${context.width}, screenHeight: ${context.height}, isOut: $isOut');
    });

    /* ---------------------------------------------------------------------------------
    | Caret Widget
    | */

    Widget caretWidget = StreamBuilder<CaretValue>(
        stream: caretController.stream,
        builder: (_, snap) {
          CaretValue value =
              snap.data ?? CaretValue(flip: false, offset: Offset.zero);

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
      // margin: Ei.only(v: 12),
      decoration:
          BoxDecoration(color: Colors.white, borderRadius: Br.radius(5)),
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

                  Widget child = InkTouch(
                    onTap: disabled
                        ? null
                        : () {
                            // check sub options
                            if (subOptions[i] != null && notifier.level == 0) {
                              notifier.setOptions(subOptions[i] ?? [],
                                  level: 1);
                            } else {
                              if (dismissOnSelect && notifier.level == 0) {
                                context.pop();
                              }

                              final selected = Option.fromMap(
                                  {...option.toMap(), 'index': i});
                              onSelect?.call(LzDropdownController(
                                  option: selected,
                                  back: () {
                                    notifier.setOptions(this.options, level: 0);
                                  }));
                            }
                          },
                    padding: Ei.sym(v: 15, h: 20),
                    border: Br.only(['t'],
                        except:
                            useBorder ? i == 0 : !separators.contains(i - 1),
                        width:
                            separators.contains(i - 1) ? separatorHeight : 1),
                    child: Opacity(
                      opacity: disabled ? .4 : 1,
                      child: Container(
                        constraints:
                            const BoxConstraints(minWidth: 200, maxWidth: 250),
                        child: Row(
                          mainAxisSize: mainAxisSize,
                          children: [
                            if (icon != null)
                              Iconr(icon,
                                  margin: Ei.only(r: 15),
                                  color: option.style?.color ?? LzColors.dark),
                            Flexible(
                                child: Text(
                              optionName,
                              style: Lazy.font.copyWith(
                                  color: option.style?.color ?? LzColors.dark,
                                  fontWeight: (option.style?.bold ?? false)
                                      ? Fw.bold
                                      : Fw.normal),
                            )),
                          ],
                        ),
                      ),
                    ),
                  );

                  return SlideUp(
                      key: UniqueKey(), delay: i * 100, child: child);
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

// DropX -----------------------------------------------------------------------------------------------

/// ```dart
/// final options = ['Edit', 'Delete'].options(icons: [La.pen, La.trash],
///   dangers: [1],
///   options: {
///     1: ['Cancel', 'Confirm', 'Sub Option A', 'Sub Option B'].options(pops: [0],
///       options: {
///         2: ['Sub A1', 'Sub A2', 'Sub A3'].options(pops: [0], disableds: [2]),
///         3: ['Sub B1', 'Sub B2'].options(pops: [0])
///       })
///   });
///
/// DropX.show([14, 10].contains(index) ? key : context, options: options, onSelect: (value) {
///   logg(value.toMap());
/// });
/// ```

class DropX {
  static Future show<T>(T key,
      {List<Option> options = const [],
      Offset? offset,
      bool useCaret = true,
      bool dismissOnTap = true,
      Function(Option)? onSelect}) async {
    if ([BuildContext, GlobalKey].contains(key.runtimeType)) {
      return logg('Context is invalid!');
    }

    BuildContext context =
        key is GlobalKey ? key.currentContext! : key as BuildContext;

    if (options.isEmpty) {
      return logg('Options can not be empty');
    }

    return showDialog(
        context: context,
        builder: (_) => _DropXWidget(
              context: context,
              options: options,
              offset: offset,
              isContext: key is BuildContext,
              useCaret: useCaret,
              dismissOnTap: dismissOnTap,
              onSelect: onSelect,
            ));
  }
}

class _Data {
  final double x, y;
  final double cx, cy;
  final bool flip;

  _Data(this.x, this.y, this.cx, this.cy, this.flip);
}

class _DropXWidget extends StatelessWidget {
  final BuildContext context;
  final List<Option> options;
  final Offset? offset;
  final bool isContext, useCaret, dismissOnTap;
  final Function(Option)? onSelect;
  const _DropXWidget(
      {required this.context,
      this.options = const [],
      this.offset,
      this.isContext = false,
      this.useCaret = false,
      this.dismissOnTap = true,
      this.onSelect});

  @override
  Widget build(BuildContext context) {
    final dropdownKey = GlobalKey();
    final controller = StreamController<_Data>();
    final notifier = DropXNotifier();

    // do initializations here
    notifier.optionsOrigin = options;
    notifier.options = options;

    // create a method to adjust dropdown position
    void adjustDropdown() {
      // offset digunakan untuk memberikan jarak (margin) antara dropdown dengan screen atau box
      Offset offset = this.offset ?? const Offset(20, 0);

      // data screen, status bar
      double screenH = this.context.height, screenW = this.context.width;
      double bar = this.context.windowPadding.top;
      bool isOutOfScreen = false;

      // basic position ------------------------------------------------------------------------------------------------

      // render box of the widget
      final box = this.context.findRenderObject() as RenderBox?;
      final o = box?.localToGlobal(Offset.zero);

      // dapatkan posisi (x, y)
      double dx = o?.dx ?? 0;
      double dy = o?.dy ?? 0;

      // dapatkan ukuran box (w, h)
      // double boxW = box?.size.width ?? 0;
      double boxH = box?.size.height ?? 0;

      // adjust dropdown position --------------------------------------------------------------------------------------

      final dropdown = dropdownKey.context?.findRenderObject() as RenderBox?;
      double ddWidth = dropdown?.size.width ?? 0;
      double ddHeight = dropdown?.size.height ?? 0;

      // untuk memeriksa apakah dropdown yang akan ditampilkan melebihi batas screen
      // kita perlu mendapatkan posisi dropdown (x, y)
      // tapi itu hanya bisa dilakukan jika dropdown sudah ditampilkan
      // alternatif lain adalah, dengan mengambil posisi (x, y) dari box

      double ddPosY = dy + ddHeight;
      // double ddPosX = dx + ddWidth;

      // jika dropdown melebihi batas screen Y
      // maka dropdown akan ditampilkan di atas widget

      if ((ddPosY + (bar * 2)) > screenH) {
        dy = dy - ddHeight;
        dy = dy - (!isContext ? (boxH * 2) + boxH : boxH / 2);
        dy -= offset.dy;

        isOutOfScreen = true;
      } else {
        dy = dy + (boxH / 2) + offset.dy;
      }

      // jika dropdown melebihi batas screen X
      // maka dropdown akan ditampilkan di kiri widget

      double ddRightX = dx + ddWidth; // posisi dropdown dari kanan

      if ((ddRightX + offset.dx) >= screenW) {
        dx = dx - (ddRightX - screenW) - offset.dx;
        // dx = dx - (screenW - ddPosX) - offset.dx;
      }

      // jika dropdown kurang dari 0
      // maka dropdown akan ditampilkan di 0

      if ((dx - offset.dx) <= 0) {
        dx = 0 + offset.dx;
      }

      // adjust caret position -----------------------------------------------------------------------------------------

      double cx = o?.dx ?? 0, cy = isOutOfScreen ? (dy + ddHeight - 1) : dy - 9;
      cx += 20;

      if ((cx + 40) >= screenW) {
        cx = screenW - 60;
      } else if ((cx - 40) <= 0) {
        cx = 40;
      }

      // logg(
      //     'x: ${o?.dx}, y: ${o?.dy}, dx: $dx, dy: $dy, cx: $cx, cy: $cy, boxW: $boxW, boxH: $boxH, ddWidth: $ddWidth, ddHeight: $ddHeight, ddPosY: $ddPosY, ddPosX: $ddPosX, screenW: $screenW, screenH: $screenH');

      // set stream data
      controller.add(_Data(dx, dy, cx, cy, isOutOfScreen));
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!this.context.mounted) {
        return;
      }

      adjustDropdown();
    });

    return StreamBuilder<_Data>(
        stream: controller.stream,
        builder: (_, stream) {
          final data = stream.data;

          double x = data?.x ?? 0, cx = data?.cx ?? 0;
          double y = data?.y ?? 0, cy = data?.cy ?? 0;
          bool flip = data?.flip ?? false;

          return Stack(
            children: [
              // caret widget
              Positioned(
                  top: cy,
                  left: cx,
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
                  )),

              // dropdown widget
              Positioned(
                top: y,
                left: x,
                child: Container(
                  key: dropdownKey,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: Br.radius(Lazy.getRadius)),
                  constraints: BoxConstraints(
                      maxHeight: context.height * 0.5, maxWidth: 240),
                  child: SingleChildScrollView(
                      physics: BounceScroll(),
                      child: notifier.watch((state) => Col(
                            children: state.options.generate((item, i) {
                              bool disabled = item.disabled;
                              bool danger = item.danger;

                              // get icon data
                              IconData? icon = item.icon;

                              return SlideUp(
                                key: UniqueKey(),
                                delay: (i + 1) * 100,
                                child: InkTouch(
                                  onTap: disabled
                                      ? null
                                      : () {
                                          List<Option> subOptions =
                                              item.options ?? [];

                                          if (subOptions.isNotEmpty) {
                                            state.setOptions(subOptions);

                                            Utils.timer(() {
                                              adjustDropdown();
                                            }, 5.ms);

                                            return;
                                          }

                                          if (item.pop) {
                                            state.backToPrev();

                                            Utils.timer(() {
                                              adjustDropdown();
                                            }, 5.ms);
                                            return;
                                          }

                                          onSelect?.call(item);

                                          if (dismissOnTap) {
                                            context.pop();
                                          }
                                        },
                                  padding: Ei.sym(v: 15, h: 20),
                                  border: Br.only(['t'], except: i == 0),
                                  child: Row(
                                    children: [
                                      Textr(item.option,
                                              style: Gfont.color(danger
                                                  ? Colors.redAccent
                                                  : LzColors.black),
                                              icon: icon)
                                          .flexible(),
                                    ],
                                  ).opacity(disabled ? 0.5 : 1),
                                ),
                              );
                            }),
                          ))),
                ),
              ),
            ],
          );
        });
  }
}

class DropXNotifier extends ChangeNotifier {
  List<Option> optionsOrigin = [];
  List<Option> options = [];
  List treeOptions = [];

  int index = 0;

  void setOptions(List<Option> options) {
    this.options = options;
    treeOptions.add(options);
    index++;
    notifyListeners();
  }

  void backToPrev() {
    index--;
    treeOptions.removeLast();

    if (treeOptions.isEmpty) {
      options = optionsOrigin;
      notifyListeners();
      return;
    }

    options = treeOptions[index - 1];
    notifyListeners();
  }
}
