part of '../widget.dart';

/// A widget that displays a popover, which is a floating content box
/// that can be shown by clicking a child widget or by default.
///
/// The popover can be configured to display different content, background
/// color, radius, offset, and optional blur effect behind the popover.
class LzPopover extends StatelessWidget {
  /// The widget that triggers the popover when tapped.
  final Widget child;

  /// The content to be displayed inside the popover.
  final Widget content;

  /// Optional background color for the popover.
  final Color? background;

  /// Optional border radius for the popover corners.
  final BorderRadiusGeometry? radius;

  /// Optional offset to adjust the position of the popover.
  final Offset? offset;

  /// Optional flag to apply blur to the background when the popover is shown.
  final bool backBlur;

  /// An optional builder function to wrap the child widget inside custom widgets.
  final Widget Function(Widget child)? builder;

  /// Determines if the popover should be displayed by default without interaction.
  final bool isDefaultOpen;

  /// Creates a popover widget with the specified [child], [content],
  /// and optional customization options such as background color, radius, and more.
  const LzPopover({
    super.key,
    required this.child,
    required this.content,
    this.background,
    this.radius,
    this.offset,
    this.backBlur = false,
    this.builder,
    this.isDefaultOpen = false,
  });

  @override
  Widget build(BuildContext context) {
    /// Shows the popover at the calculated position based on the child's location.
    void showPopover() {
      final RenderBox renderBox = context.findRenderObject() as RenderBox;
      final Offset position = renderBox.localToGlobal(Offset.zero);
      final Size size = renderBox.size;

      context.dialog(
        SizedBox(
          width: context.width,
          child: _PopoverContent(
            position: position,
            size: size,
            content: content,
            background: background,
            radius: radius,
            offset: offset,
            builder: builder,
            child: child,
          ),
        ),
        backBlur: backBlur,
      );
    }

    /// Displays the popover if the [isDefaultOpen] is set to true
    /// after the widget is rendered.
    Bindings.onRendered(() {
      if (isDefaultOpen) {
        showPopover();
      }
    });

    /// The [GestureDetector] handles the tap event to show the popover.
    return GestureDetector(
      onTap: showPopover,
      child: child,
    );
  }
}

/// A widget that represents the content of a popover, positioned
/// relative to the trigger widget and customizable in appearance.
///
/// This widget is responsible for displaying the popover content
/// at a specific position on the screen, with an optional background,
/// radius, and offset adjustments.
class _PopoverContent extends StatefulWidget {
  /// The child widget that triggers the popover.
  final Widget child;

  /// The content to be displayed inside the popover.
  final Widget content;

  /// The position of the popover relative to the screen.
  final Offset position;

  /// The size of the trigger widget to help with positioning the popover.
  final Size size;

  /// Optional background color for the popover.
  final Color? background;

  /// Optional border radius for the popover corners.
  final BorderRadiusGeometry? radius;

  /// Optional offset to further adjust the position of the popover.
  final Offset? offset;

  /// An optional builder function to wrap the child widget inside custom widgets.
  final Widget Function(Widget child)? builder;

  /// Creates a popover content widget with the specified [child], [content],
  /// and its position, size, and optional customization options.
  const _PopoverContent({
    required this.child,
    required this.content,
    required this.position,
    required this.size,
    this.background,
    this.radius,
    this.offset,
    this.builder,
  });

  @override
  State<_PopoverContent> createState() => _PopoverContentState();
}

/// The state for the PopoverContent widget, responsible for positioning
/// and rendering the popover content dynamically based on the size and position
/// of the trigger widget.
class _PopoverContentState extends State<_PopoverContent> {
  GlobalKey keyContent = GlobalKey(); // Key to measure content size
  double contentHeight = 0;
  double contentWidth = 0;
  double caretHeight = 10;
  double caretWidth = 20;

  double triggerY = 0; // Position of the trigger widget (child)
  double popoverY = 0; // Position of the popover content

  double caretY = 0; // Position of the caret (arrow)
  double caretX = 0;

  bool isAbove =
      true; // Determines whether the popover is above or below the trigger
  bool showCaret = true; // Determines whether the caret should be displayed

  @override
  void initState() {
    super.initState();

    // Track the height after first layout
    WidgetsBinding.instance.addPostFrameCallback((_) {
      updateContentHeight();
    });
  }

  /// Updates the content height and determines the positioning of
  /// the popover and caret based on available space.
  void updateContentHeight() {
    if (keyContent.currentContext != null) {
      final RenderBox renderBox =
          keyContent.currentContext!.findRenderObject() as RenderBox;

      setState(() {
        contentHeight = renderBox.size.height + 10; // Adjust for padding
        contentWidth = renderBox.size.width;

        triggerY = widget.position.dy - context.windowPadding.top;
        popoverY = ((triggerY - contentHeight) - 10) - (widget.offset?.dy ?? 0);

        // Default caret position
        caretY = (triggerY - caretHeight - 11) - (widget.offset?.dy ?? 0);

        // Set x caret position
        double defaultCaretX =
            widget.position.dx + (widget.size.width / 2) - (caretWidth / 2);
        double centeredCaretX = (contentWidth / 2) - (caretWidth / 2);

        // Ensure caret stays within the content bounds
        if (defaultCaretX < 0 || defaultCaretX + caretWidth > contentWidth) {
          caretX = centeredCaretX; // Center caret if out of bounds
        } else {
          caretX = defaultCaretX; // Position caret relative to the trigger
        }
      });

      // Calculate available space below the trigger
      double availableHeightBelow = MediaQuery.of(context).size.height -
          (widget.position.dy + widget.size.height) -
          context.windowPadding.bottom;

      // Check if the popover is out of bounds
      bool isOutOfBounds = (popoverY < 0);

      // Adjust caret position
      if (caretX + caretWidth >= contentWidth - (widget.offset?.dx ?? 30)) {
        caretX = caretX - 20;
      }

      // Adjust popover position if there's not enough space
      if (isOutOfBounds ||
          (contentHeight + caretHeight > availableHeightBelow)) {
        setState(() {
          isAbove = false; // Show popover below the trigger
          popoverY = triggerY +
              widget.size.height +
              caretHeight +
              (widget.offset?.dy ?? 0) +
              10;
          caretY =
              triggerY + widget.size.height + (widget.offset?.dy ?? 0) + 11;
        });
      } else {
        setState(() {
          isAbove = true; // Show popover above the trigger
          popoverY =
              ((triggerY - contentHeight) - 10) - (widget.offset?.dy ?? 0);
          caretY = (triggerY - caretHeight - 11) - (widget.offset?.dy ?? 0);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    /// Measures the size of the content and updates positioning accordingly.
    Widget content = _MeasureSize(
      onChange: (size) {
        updateContentHeight();
      },
      child: Container(
        margin: EdgeInsets.only(left: widget.offset?.dx ?? 20),
        key: keyContent,
        decoration: BoxDecoration(
            borderRadius: widget.radius ?? BorderRadius.circular(10),
            color: widget.background ?? Colors.white),
        constraints: BoxConstraints(
            maxWidth: context.width - ((widget.offset?.dx ?? 20) * 2)),
        child: widget.content,
      ),
    );

    Widget trigger = SizedBox(width: widget.size.width, child: widget.child);

    return Stack(
      children: [
        // Keep the original widget in place
        Positioned(
            left: widget.position.dx,
            top: triggerY,
            child: widget.builder?.call(trigger) ?? trigger),

        // The caret (arrow) pointing to the trigger widget
        Positioned(
            left: caretX,
            top: caretY,
            child: Transform.rotate(
              angle: isAbove ? 0 : 3.14,
              child: CustomPaint(
                size: Size(caretWidth, caretHeight),
                painter: _CaretPainter(widget.background ?? Colors.white),
              ),
            )),

        // Popover content, dynamically positioned based on content height
        Positioned(left: 0, top: popoverY, child: content),
      ],
    );
  }
}

/// A widget that measures the size of its child and triggers a callback
/// whenever the size changes.
///
/// This is useful for scenarios where the size of a widget is dynamic
/// and needs to be monitored after layout.
class _MeasureSize extends StatefulWidget {
  /// The child widget whose size will be measured.
  final Widget child;

  /// Callback function that is triggered when the size of the child changes.
  /// The new size is passed as an argument.
  final ValueChanged<Size> onChange;

  /// Creates a [_MeasureSize] widget with a specified [child] and [onChange] callback.
  const _MeasureSize({required this.onChange, required this.child});

  @override
  State<_MeasureSize> createState() => _MeasureSizeState();
}

/// The state class for [_MeasureSize] that performs size measurement
/// and notifies the parent when a size change is detected.
class _MeasureSizeState extends State<_MeasureSize> {
  /// Stores the previous size of the widget to detect size changes.
  Size? _oldSize;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    return Container(child: widget.child);
  }

  /// Called after the widget layout is complete to check if the size has changed.
  void _afterLayout(_) {
    if (!mounted) return;
    final newSize = context.size;

    // Only call onChange if the size has actually changed
    if (_oldSize == null || newSize != _oldSize) {
      _oldSize = newSize;
      if (newSize != null) {
        widget.onChange(newSize);
      }
    }
  }
}

/// A custom painter that draws a filled caret (triangle) shape.
///
/// The caret is typically used to point from a popover or tooltip
/// to its associated trigger widget.
class _CaretPainter extends CustomPainter {
  /// The color of the caret (triangle).
  final Color color;

  /// Creates a [_CaretPainter] with the specified [color].
  _CaretPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    var path = Path();

    // Start at the top-left corner
    path.moveTo(0, 0);

    // Draw line to the bottom middle point of the triangle
    path.lineTo(size.width / 2, size.height);

    // Draw line to the top-right corner
    path.lineTo(size.width, 0);

    // Close the path to form the triangle
    path.close();

    // Draw the triangle on the canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // Since the color is not expected to change, no repaint is needed.
    return false;
  }
}

// class _ArrowLinePainter extends CustomPainter {
//   final Color backgroundColor;
//   final Offset contentOffset;
//   final Offset childOffset;

//   _ArrowLinePainter({
//     required this.backgroundColor,
//     required this.contentOffset,
//     required this.childOffset,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = backgroundColor
//       ..strokeWidth = 1.0
//       ..style = PaintingStyle.stroke;

//     // Menggambar garis dari childOffset ke contentOffset
//     final endPoint = Offset(childOffset.dx, childOffset.dy);
//     final startPoint = Offset(childOffset.dx - 0, contentOffset.dy);

//     // Menggambar garis antara startPoint dan endPoint
//     canvas.drawLine(startPoint, endPoint, paint);

//     // Menggambar kepala panah di endPoint
//     _drawArrowHead(canvas, paint, startPoint, endPoint);
//   }

//   // Fungsi untuk menggambar kepala panah
//   void _drawArrowHead(Canvas canvas, Paint paint, Offset startPoint, Offset endPoint) {
//     const arrowSize = 12.0; // Ukuran kepala segitiga
//     final direction = (endPoint - startPoint).direction; // Arah garis

//     // Membuat titik segitiga di sekitar endPoint
//     final arrowPoint1 = endPoint.translate(
//       -arrowSize * cos(direction + 1.4),
//       -arrowSize * sin(direction + 1.4),
//     );
//     final arrowPoint2 = endPoint.translate(
//       -arrowSize * cos(direction - 1.4),
//       -arrowSize * sin(direction - 1.4),
//     );

//     // Mengisi segitiga sebagai kepala panah
//     final path = Path()
//       ..moveTo(endPoint.dx, endPoint.dy)
//       ..lineTo(arrowPoint1.dx, arrowPoint1.dy)
//       ..lineTo(arrowPoint2.dx, arrowPoint2.dy)
//       ..close();

//     // Menggambar segitiga yang terisi
//     final arrowPaint = Paint()
//       ..color = backgroundColor
//       ..style = PaintingStyle.fill;

//     canvas.drawPath(path, arrowPaint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
