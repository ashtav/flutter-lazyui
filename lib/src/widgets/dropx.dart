part of widget;

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
      touchBased,
      bool useCaret = true,
      bool dismissOnTap = true,
      int? duration,
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
              touchBased: touchBased,
              isContext: key is BuildContext,
              useCaret: useCaret,
              dismissOnTap: dismissOnTap,
              duration: duration ?? 50,
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
  final Offset? offset, touchBased;
  final bool isContext, useCaret, dismissOnTap;
  final int duration;
  final Function(Option)? onSelect;
  const _DropXWidget(
      {required this.context,
      this.options = const [],
      this.offset,
      this.touchBased,
      this.isContext = false,
      this.useCaret = false,
      this.dismissOnTap = true,
      this.duration = 50,
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

      // get (x, y) position of the widget
      double dx = touchBased?.dx ?? o?.dx ?? 0;
      double dy = touchBased?.dy ?? o?.dy ?? 0;

      // get size of the box (w, h)
      // double boxW = box?.size.width ?? 0;
      double boxH = box?.size.height ?? 0;

      // adjust dropdown position --------------------------------------------------------------------------------------

      final dropdown = dropdownKey.context?.findRenderObject() as RenderBox?;
      double ddWidth = dropdown?.size.width ?? 0;
      double ddHeight = dropdown?.size.height ?? 0;

      // to check if dropdown is out of screen
      // we need to get dropdown position (x, y)
      // but it can only be done if the dropdown is already displayed
      // another alternative is, by getting the position (x, y) from the box

      double ddPosY = dy + ddHeight;
      // double ddPosX = dx + ddWidth;

      // if dropdown is out of screen Y
      // then dropdown will be displayed above the widget

      if ((ddPosY + (bar * 2)) > screenH) {
        dy = dy - ddHeight;
        dy = dy - (!isContext ? (boxH * 2) + boxH : boxH / 2);
        // dy -= offset.dy;

        if (offset.dy < 0) {
          dy = dy - offset.dy;
        } else {
          dy = dy + offset.dy;
        }

        isOutOfScreen = true;
      } else {
        dy = dy + (boxH / 2) + offset.dy;
      }

      // if dropdown is out of screen X
      // then dropdown will be displayed on the left of the widget

      double ddRightX = dx + ddWidth; // posisi dropdown dari kanan

      if ((ddRightX + offset.dx) >= screenW) {
        dx = dx - (ddRightX - screenW) - offset.dx;
        // dx = dx - (screenW - ddPosX) - offset.dx;
      }

      // if dropdown is less than 0
      // then dropdown will be displayed at 0

      if ((dx - offset.dx) <= 0) {
        dx = 0 + offset.dx;
      }

      // adjust caret position -----------------------------------------------------------------------------------------

      double cx = (touchBased?.dx ?? o?.dx) ?? 0,
          cy = isOutOfScreen ? (dy + ddHeight - 1) : dy - 9;
      cx += 20;

      if ((cx + 40) >= screenW) {
        cx = screenW - 60;
      } else if ((cx - 40) <= 0) {
        cx = 40;
      }

      if (cx + offset.dx + 40 >= screenW) {
        cx -= offset.dx;
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
              if (useCaret)
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
                      borderRadius: Br.radius(LazyUi.radius)),
                  constraints: BoxConstraints(
                      maxHeight: context.height * 0.7, maxWidth: 240),
                  child: SingleChildScrollView(
                      physics: BounceScroll(),
                      child: notifier.watch((state) => Column(
                            crossAxisAlignment: Caa.start,
                            mainAxisSize: Mas.min,
                            children: state.options.generate((item, i) {
                              bool disabled = item.disabled;
                              bool danger = item.danger;

                              // get icon data
                              IconData? icon = item.icon;

                              return SlideUp(
                                key: UniqueKey(),
                                delay: (i + 1) * duration,
                                child: InkTouch(
                                  onTap: disabled
                                      ? null
                                      : () {
                                          List<Option> subOptions =
                                              item.options ?? [];

                                          if (dismissOnTap &&
                                              subOptions.isEmpty &&
                                              !item.pop) {
                                            // close stream
                                            controller.close();
                                            context.pop();
                                          }

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

class CaretValue {
  final bool flip;
  final Offset offset;

  CaretValue({this.flip = false, this.offset = Offset.zero});
}
