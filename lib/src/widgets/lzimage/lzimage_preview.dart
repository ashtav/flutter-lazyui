import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

/// A stateful widget for displaying an image with zooming capabilities.
class LzImageViewer<T> extends StatefulWidget {
  /// The image to be displayed.
  final T image;

  /// A tag to identify the image viewer.
  final Object tag;

  /// Creates a LzImageViewer widget.
  const LzImageViewer(this.image, {Key? key, required this.tag})
      : super(key: key);

  @override
  State<LzImageViewer> createState() => _LzImageViewerState();
}

class _LzImageViewerState extends State<LzImageViewer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Matrix4> _animation;
  late TransformationController controller;

  TapDownDetails? _doubleTapDetails;

  @override
  void initState() {
    super.initState();
    controller = TransformationController();
    _animationController = AnimationController(vsync: this, duration: 250.ms);
    _animationController.addListener(() {
      controller.value = _animation.value;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleDoubleTap() {
    // get current transformation matrix
    final double currentScale = controller.value.getMaxScaleOnAxis();

    // scale we want to zoom to
    double scale = 1.0;

    if (currentScale > scale) {
      scale = 1.0;
    } else {
      scale = 2.0;

      // get tap position in the coordinate system of the image
      final tapPosition = _doubleTapDetails!.localPosition;

      // translate tap position to the center of the viewport
      final Matrix4 transform = Matrix4.identity()
        ..translate(-tapPosition.dx, -tapPosition.dy)
        ..scale(scale);

      return _animateToMatrix(transform);
    }

    final targetMatrix = Matrix4.identity();
    _animateToMatrix(targetMatrix);
  }

  void _animateToMatrix(Matrix4 targetMatrix) {
    _animation = Matrix4Tween(
      begin: controller.value,
      end: targetMatrix,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Hero(
              tag: widget.tag,
              child: InteractiveViewer(
                  transformationController: controller,
                  child: GestureDetector(
                      onDoubleTapDown: (details) => _doubleTapDetails = details,
                      onDoubleTap: () => _handleDoubleTap(),
                      child: LzImage(widget.image,
                          radius: 0,
                          fit: BoxFit.contain,
                          size: [context.width, context.height]))),
            ),

            // close button
            Poslign(
                alignment: Alignment.topRight,
                child: Container(
                    margin: Ei.only(t: context.viewInsets.top + 30),
                    padding: Ei.all(20),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 25,
                            spreadRadius: 7)
                      ],
                    ),
                    child: const Icon(
                      La.times,
                      color: Colors.white,
                      size: 23,
                    )).onTap(
                  () => context.lz.pop(),
                ))
          ],
        ));
  }
}
