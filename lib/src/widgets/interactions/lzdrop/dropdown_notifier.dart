import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

Offset _latestOffset = Offset.zero;

/// Notifier class for managing dropdown options and their positioning.
class DropdownNotifier extends ChangeNotifier {
  /// Controller for managing scrolling within the dropdown.
  ScrollController scroller = ScrollController();

  /// Alignment of the dropdown relative to its anchor.
  DropAlignment alignment = DropAlignment.left;

  /// Offset of the dropdown.
  Offset offset = _latestOffset;

  /// List of dropdown options.
  List<DropOption> options = [];

  /// Key for accessing the dropdown widget.
  late GlobalKey dropdownKey;

  /// Height of the status bar.
  double bar = 0;

  /// Target height for positioning the dropdown.
  double targetHeight = 0;

  /// Height of the screen.
  double screenHeight = 0;

  /// Height of the dropdown.
  double dropHeight = 0;

  /// Duration for dropdown animations.
  Duration duration = Duration.zero;

  /// Out of screen indicator
  bool outOfScreen = false;

  /// Adjusts the vertical position of the dropdown to ensure it fits within the screen.
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

  /// Sets the position of the dropdown based on the provided parameters.
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

      double margin = hasChild ? 0 : 20.0; // margin from screen

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
        outOfScreen = isOutOfY;

        if (isOutOfY) {
          // duration = 150.ms;
          // outOfScreen = true;

          // double remains = targetNDropPosition - screenHeight;
          // logg(remains);
          // dy = dy - (remains);
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

  /// Tracks the toggle state of sub-options within the dropdown.
  Map<String, bool> subOptionsToggle = {};

  /// Initializes the subOptionsToggle map based on the provided list of options.
  ///
  /// This method sets initial toggle states for sub-options to false.
  ///
  /// Parameters:
  /// - `options`: The list of DropOption objects to check for sub-options.
  void checkSubOptions(List<DropOption> options) {
    for (var item in options) {
      if (item.subOptions != null) {
        subOptionsToggle[item.label] = false;
      }
    }
  }

  /// Toggles the visibility of sub-options for a given label and ensures it's scrolled into view.
  ///
  /// This method toggles the visibility of sub-options identified by the `label`.
  /// It hides all other sub-options and scrolls the dropdown to ensure the toggled
  /// sub-options are visible.
  ///
  /// Parameters:
  /// - `label`: The label of the sub-options to toggle.
  /// - `key`: The GlobalKey associated with the sub-options widget to scroll to.
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
          // reArangeDropYPosition();
        }
      }
    }
  }
}
