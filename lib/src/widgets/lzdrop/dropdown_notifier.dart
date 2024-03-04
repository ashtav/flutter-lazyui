import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

Offset _latestOffset = Offset.zero;

class DropdownNotifier extends ChangeNotifier {
  ScrollController scroller = ScrollController();
  DropAlignment alignment = DropAlignment.left;

  Offset offset = _latestOffset;
  List<DropOption> options = [];

  late GlobalKey dropdownKey;
  double bar = 0, targetHeight = 0, screenHeight = 0, dropHeight = 0;
  Duration duration = 0.ms;

  void reArangeDropYPosition() {
    // render box of the dropdown
    final dropBox =
        dropdownKey.currentContext?.findRenderObject() as RenderBox?;
    final dropSize = dropBox?.size;
    final dropHeight = dropSize?.height ?? 0;

    // adjust drop y position if it's out of screen
    double dy = offset.dy;
    double dropYPosition = dy + dropHeight; // current drop y position

    dy = dropYPosition + (bar + targetHeight) > screenHeight
        ? dy - (dropHeight - this.dropHeight)
        : dy;

    offset = Offset(offset.dx, dy);
    _latestOffset = offset;

//     logg('''
// dy: $dy, bar: $bar, dropHeight: $dropHeight, dropYPosition: $dropYPosition,
// screenHeight: $screenHeight, targetHeight: $targetHeight''');

    notifyListeners();
  }

  void setPosition(Offset target, RenderBox? box, BuildContext context,
      double dropWidth, GlobalKey dropdownKey, bool hasChild) {
    Bindings.onRendered(() async {
      this.dropdownKey = dropdownKey;

      // render box of the dropdown
      final dropBox =
          dropdownKey.currentContext?.findRenderObject() as RenderBox?;
      final dropSize = dropBox?.size;
      final dropHeight = dropSize?.height ?? 0;

      this.dropHeight = dropHeight;

      double bar = context.windowPadding.top;
      this.bar = bar;

      double margin = 20.0; // margin from screen

      // get size of screen
      double screenWidth = context.width;
      double screenHeight = context.height;
      this.screenHeight = screenHeight;

      // get size of the target
      final size = box?.size;
      double targetHeight = size?.height ?? 0;
      double targetWidth = size?.width ?? 0;

      this.targetHeight = targetHeight;

      // set offset based on default calculation
      double dx = target.dx;
      double dy = hasChild ? target.dy - (targetHeight) : target.dy;

      // adjust drop position if it's out of screen
      double dropXPosition = dx + dropWidth; // current drop x position
      double dropYPosition = dy + dropHeight; // current drop y position

      // adjust drop x position based on alignment
      if (alignment == DropAlignment.right) {
        dropXPosition = dx;
        dx = dx - (dropWidth - targetWidth);
        dx = dx + dropWidth + margin > screenWidth
            ? (screenWidth - dropWidth) - margin
            : dx;
      }

      dx =
          dropXPosition > screenWidth ? (screenWidth - dropWidth) - margin : dx;
      dx = dx < margin ? margin : dx;

      // dy = dropYPosition + (bar + targetHeight) > screenHeight ? (screenHeight - dropHeight) - (margin + bar) : dy;

      if (!hasChild) {
        dy = dy < bar ? (bar + margin) : dy;
        dy = dy - bar;
        dy = dy + targetHeight; // put drop below the target

        bool isOutOfY = dropYPosition + (bar + targetHeight) > screenHeight;

        // if drop is out of screen, put it above the target
        dy = isOutOfY ? dy - (dropHeight + targetHeight) : dy;
      } else {
        duration = 0.ms;
        dy = dy + targetHeight < bar ? (bar) : (dy - bar) + targetHeight;

        double targetNDropPosition =
            target.dy + targetHeight + dropHeight + bar;
        bool isOutOfY = targetNDropPosition >= screenHeight + bar;

        if (isOutOfY) {
          duration = 150.ms;

          double remains = targetNDropPosition - screenHeight;
          dy = dy - (remains);
        }
      }

      final result = Offset(dx, dy);

//       logg('''
// dx: $dx, dy: $dy, bar: $bar, dropWidth: $dropWidth, dropHeight: $dropHeight,
// result: $result, target: $target, size: $size, screenWidth: $screenWidth,
// screenHeight: $screenHeight, targetHeight: $targetHeight, targetWidth: $targetWidth,
// dropXPosition: $dropXPosition, dropYPosition: $dropYPosition''');

      offset = result;
      _latestOffset = result;

      notifyListeners();
    });
  }

  // sub options
  Map<String, bool> subOptionsToggle = {};

  void checkSubOptions(List<DropOption> options) {
    for (var item in options) {
      if (item.subOptions != null) {
        subOptionsToggle[item.label] = false;
      }
    }
  }

  void toggleSubOptions(String label, GlobalKey key) async {
    // hide all sub options
    for (var item in subOptionsToggle.keys) {
      if (item != label) {
        subOptionsToggle[item] = false;
      }
    }

    // toggle sub options
    if (subOptionsToggle[label] != null) {
      subOptionsToggle[label] = !subOptionsToggle[label]!;
      notifyListeners();

      await Future.delayed(250.ms);

      // scroll to specific position
      if (subOptionsToggle[label] == true) {
        if (key.currentContext != null) {
          Scrollable.ensureVisible(key.currentContext!,
              duration: const Duration(milliseconds: 300), alignment: .0);
          reArangeDropYPosition();
        }
      }
    }
  }
}
