part of '../widget.dart';

/// A versatile widget for displaying images from multiple sources and formats.
///
/// The [LzImage] widget supports various image formats such as JPG, PNG, GIF,
/// and SVG. It also accepts multiple input types, including URLs, local asset
/// paths, file paths, [File] objects, [Uint8List], or [Image] widgets.
/// Additional features include optional preview functionality, alignment, and radius for rounded corners.
class LzImage<T> extends StatelessWidget {
  /// The source of the image. Can be a URL, local asset path, file path, [File],
  /// [Uint8List], or an [Image] widget.
  final T src;

  /// The size of the image. Can accept dynamic values such as [double],
  /// [Size], or other dimensions depending on usage.
  final dynamic size;

  /// The fit type of the image, which determines how the image should be
  /// resized to fit its container. Defaults to [BoxFit.cover].
  final BoxFit fit;

  /// The alignment of the image within its container. Defaults to [Alignment.center].
  final Alignment alignment;

  /// The background color of the image's container. Optional.
  final Color? background;

  /// The border radius of the image for creating rounded corners. Optional.
  final double? radius;

  /// Whether the image is previewable. If true, tapping the image opens a
  /// preview in a new page. Defaults to `false`.
  final bool previewable;

  /// The context to use for navigation when previewing the image. If not
  /// provided, the nearest context will be used.
  final BuildContext? context;

  /// Creates an [LzImage] widget.
  const LzImage(
    this.src, {
    super.key,
    this.size,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.background,
    this.radius,
    this.previewable = false,
    this.context,
  });

  @override
  Widget build(BuildContext context) {
    Widget image = const None();

    // get image size
    double? width = _getImageSize(size, 'width');
    double? height = _getImageSize(size, 'height');

    // loading
    Widget placeholder = Shimmer(
      size: [width ?? 50, height ?? 50],
      radius: Br.radius(radius ?? config.borderRadius),
    );

    // error
    Widget errorWidget = Container(
        width: width, height: height, color: Colors.black12, child: const Center(child: Icon(Hi.alertSquare)));

    // image string
    if (src is String && ![''].contains('$src'.trim())) {
      String src = this.src.toString();

      // image URL
      if (src.toString().isURL) {
        // SVG
        if (src.endsWith('.svg')) {
          image = SvgPicture.network(src,
              fit: fit,
              width: width,
              height: height,
              alignment: alignment,
              placeholderBuilder: (context) => placeholder);
        }

        // JPG, JPEG, PNG, GIF
        else {
          image = CachedNetworkImage(
            imageUrl: src,
            fit: fit,
            width: width,
            height: height,
            alignment: alignment,
            progressIndicatorBuilder: (context, url, downloadProgress) => placeholder,
            errorWidget: (context, url, error) => errorWidget,
          );
        }
      }

      // image path
      else if (src.toString().isPath) {
        // file path
        if (src.isFilePath) {
          image = Image.file(File(src),
              fit: fit,
              width: width,
              height: height,
              alignment: alignment,
              frameBuilder: (context, child, __, ok) => ok ? child : placeholder,
              errorBuilder: (_, e, s) => errorWidget);
        }
      }

      // image path local asset
      else {
        // local assets path
        src = src.contains(':') ? src.replaceAll(':', '') : 'assets/images/$src';

        // svg asset image
        if (src.endsWith('.svg')) {
          image = SvgPicture.asset(src,
              fit: fit, width: width, height: height, alignment: alignment, placeholderBuilder: (_) => placeholder);
        }

        // jpg, jpeg, png, gif, etc..
        else {
          image = Image.asset(src,
              fit: fit,
              width: width,
              height: height,
              alignment: alignment,
              // frameBuilder: (context, child, __, ok) => ok ? child : placeholder,
              errorBuilder: (_, e, s) => errorWidget);
        }
      }
    }

    // image file
    else if (src is File) {
      image = Image.file(src as File,
          fit: fit,
          width: width,
          height: height,
          alignment: alignment,
          frameBuilder: (context, child, __, ok) => ok ? child : placeholder,
          errorBuilder: (_, e, s) => errorWidget);
    }

    // image Uint8List
    else if (src is Uint8List) {
      image = Image.memory(src as Uint8List,
          fit: fit,
          width: width,
          height: height,
          alignment: alignment,
          frameBuilder: (context, child, __, ok) => ok ? child : placeholder,
          errorBuilder: (_, e, s) => errorWidget);
    }

    // image > Image()
    else if (src is Image) {
      image = src as Image;
    }

    if (background != null) {
      image = Container(color: background, child: image);
    }

    image = image.lz.clip(all: radius ?? config.borderRadius);

    if (previewable) {
      final tag = '${DateTime.now().microsecondsSinceEpoch}_${Random().nextInt(10000)}';

      return Hero(
          tag: tag,
          child: Touch(
              type: TouchType.none,
              onTap: () {
                (this.context ?? context).lz.push(LzImageViewer(src, tag: tag));
              },
              child: image));
    }

    return image;
  }
}

double? _getImageSize(dynamic size, String type) {
  if (size == null) {
    return null;
  }

  num result = 0;

  if (size is num || size is List<num?>) {
    if (type == 'width') {
      if (size is num) {
        result = size;
      } else {
        size as List;

        if (size.isNotEmpty && size[0] == null) {
          return null;
        }

        result = size.isNotEmpty ? size[0] : 0;
      }
    }

    // height
    else {
      if (size is num) {
        result = size;
      } else {
        size as List;

        if (size.length > 1 && size[1] == null) {
          return null;
        }

        result = size.length > 1
            ? size[1]
            : size.length == 1
                ? size[0]
                : 0;
      }
    }
  } else {
    return null;
  }

  return result.toDouble();
}

/// A stateful widget for displaying an image with zooming capabilities.
class LzImageViewer<T> extends StatefulWidget {
  /// The image to be displayed.
  final T image;

  /// A tag to identify the image viewer.
  final Object tag;

  /// Creates a LzImageViewer widget.
  const LzImageViewer(this.image, {super.key, required this.tag});

  @override
  State<LzImageViewer> createState() => _LzImageViewerState();
}

class _LzImageViewerState extends State<LzImageViewer> with SingleTickerProviderStateMixin {
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
                          radius: 0, fit: BoxFit.contain, size: [context.width, context.height]))),
            ),

            // close button
            Poslign(
                alignment: Alignment.topRight,
                child: Container(
                    margin: Ei.only(t: context.viewInsets.top + 30),
                    padding: Ei.all(20),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 25, spreadRadius: 7)],
                    ),
                    child: Touch(
                      type: TouchType.fade,
                      onTap: () => context.lz.pop(),
                      child: const Icon(
                        La.times,
                        color: Colors.white,
                        size: 23,
                      ),
                    )))
          ],
        ));
  }
}
