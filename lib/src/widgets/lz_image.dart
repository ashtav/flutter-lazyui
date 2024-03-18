part of widget;

/// A versatile image widget that supports various data types and customizations.
///
/// The `LzImage` widget provides flexibility in displaying images by supporting
/// different data types such as `String`, `File`, `Uint8List`, and more. It allows
/// you to customize the image's appearance, including its fit, size, radius, color,
/// and placeholders for loading and error states.
///
/// Example usage:
/// ```dart
/// LzImage(
///   image: 'https://example.com/image.jpg',
///   fit: BoxFit.cover,
///   width: 200,
///   height: 150,
///   radius: 10,
///   color: Colors.blue,
///   placeholder: CircularProgressIndicator(), // Custom loading placeholder
///   errorWidget: Icon(Icons.error), // Custom error widget
/// )
/// ```
class LzImage<T> extends StatelessWidget {
  /// The image data to be displayed. Supports various data types.
  final T image;

  /// The BoxFit property determines how the image is fitted into its container.
  final BoxFit fit;

  /// The color overlay applied to the image (optional).
  final Color? color;

  /// The width of the image (optional).
  final double? width;

  /// The height of the image (optional).
  final double? height;

  /// The size of the image (optional). If provided, it sets both width and height.
  final double? size;

  /// The border radius applied to the image (optional).
  final double? radius;

  /// The widget displayed while the image is loading (optional).
  final Widget? placeholder;

  /// The widget displayed when an error occurs while loading the image (optional).
  final Widget? errorWidget;

  /// Whether the image is interactive, allowing user interaction.
  final bool interactive;

  const LzImage(
    this.image, {
    super.key,
    this.fit = BoxFit.cover,
    this.color,
    this.width,
    this.height,
    this.size,
    this.radius,
    this.placeholder,
    this.errorWidget,
    this.interactive = false,
  });

  @override
  Widget build(BuildContext context) {
    // init size
    double? width = this.width, height = this.height;

    if (size != null) {
      width = size;
      height = size;
    }

    List availables = [String, File, Uint8List, Image];

    // check available type
    if (!availables.contains(image.runtimeType)) {
      logg('Image type is not available | $image | ${image.runtimeType}',
          name: 'LzImage', color: LogColor.cyan);

      return SizedBox(
        width: width,
        height: height,
        child: errorWidget ??
            _defaultErrorWidget ??
            const Center(
                child: Icon(
              La.exclamationCircle,
            )),
      );
    }

    late Widget result;

    // init radius
    double radius = this.radius ?? _defaultRadius ?? LazyUi.radius;

    // if string, check if it's a imageUrl, path, asset or svg
    if (image is String) {
      String path = image as String;

      bool isSvg = path.split('.').last.toLowerCase() == 'svg';
      bool isUrl = path.contains('http');
      bool isPath = path.split('/').length >
          2; // ex: /storage/emulated/0/Download/IMG_20210101_000000.jpg

      /* --------------------------------------------------------------------------------------
      | EMPTY STRING
      | */

      if (path.trim().isEmpty) {
        result = SizedBox(
          width: width,
          height: height,
          child: errorWidget ??
              _defaultErrorWidget ??
              const Center(
                  child: Icon(
                La.exclamationCircle,
              )),
        );
      }

      /* --------------------------------------------------------------------------------------
      | IMAGE URL
      | */

      else if (isUrl) {
        // Future<bool> is404() async {
        //   var uri = Uri.parse(path);
        //   var request = await HttpClient().getUrl(uri);
        //   var response = await request.close();
        //   return response.statusCode == HttpStatus.notFound;
        // }

        // Widget error = Center(
        //     child: Text(
        //   '404',
        //   style: LazyUi.getConfig.textStyle?.copyWith(fontWeight: Fw.bold),
        // ));

        Widget shimmer = Shimmer.fromColors(
          baseColor: Colors.black26,
          highlightColor: Colors.black54,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(radius)),
          ),
        );

        result = CachedNetworkImage(
          fit: fit,
          imageUrl: path,
          width: width,
          height: height,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              placeholder ?? shimmer,
          errorWidget: (context, url, error) =>
              errorWidget ??
              _defaultErrorWidget ??
              const Center(child: Icon(La.exclamationCircle)),
        );
      }

      /* --------------------------------------------------------------------------------------
      | SVG
      | */

      else if (isSvg) {
        result = SvgPicture.asset('assets/images/$image',
            width: width, height: height);
      }

      /* --------------------------------------------------------------------------------------
      | PATH
      | */

      else if (isPath) {
        result = Image.file(File(path), fit: fit, width: width, height: height);
      } else {
        if (size == null && width == null && height == null) {
          width = 100;
          height = 100;
        }

        String path = 'assets/images/$image';
        result = Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(path), fit: fit),
          ),
        );
      }
    }

    /* --------------------------------------------------------------------------------------
    | Uint8List
    | */

    else if (image is Uint8List) {
      result = Image.memory(image as Uint8List,
          fit: fit, width: width, height: height);
    }

    /* --------------------------------------------------------------------------------------
    | File
    | */

    else if (image is File) {
      result =
          Image.file(image as File, fit: fit, width: width, height: height);
    } else {
      String path = 'assets/images/$image';
      result = Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(path), fit: fit),
        ),
      );
    }

    if (interactive) {
      final tag = DateTime.now().microsecond;
      return Hero(
          tag: tag,
          child: SizedBox(
      width: width,
      height: height,
      child: result,
    ).lz.clip(all: radius).onTap(() {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LzImageViewer(image, tag: tag);
            }));
          }));
    }

    return SizedBox(
      width: width,
      height: height,
      child: result,
    ).lz.clip(all: radius);
  }

  static config({Widget? errorWidget, double? radius}) {
    _defaultErrorWidget = errorWidget;
    _defaultRadius = radius;
  }
}

Widget? _defaultErrorWidget;
double? _defaultRadius;

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
                          width: context.width,
                          height: context.height,
                          ))),
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
                  () => context.lzPop(),
                ))
          ],
        ));
  }
}
