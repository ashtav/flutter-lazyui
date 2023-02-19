import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:lazyui/src/widgets/widgets.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../shortcut.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraNotifier notifier = CameraNotifier(false);

  late List<CameraDescription> cameras;
  CameraController? controller;

  Future initCamera() async {
    try {
      cameras = await availableCameras();
      controller = CameraController(cameras[0], ResolutionPreset.veryHigh);

      controller?.initialize().then((_) {
        controller?.setFlashMode(FlashMode.off);
        controller?.setFocusMode(FocusMode.auto);
        controller?.setExposureMode(ExposureMode.auto);

        setState(() {});
      }).catchError((Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              break;
            default:
              break;
          }
        }
      });
    } catch (_) {}
  }

  Future capture() async {
    try {
      final XFile? xfile = await controller?.takePicture();
      setFlashMode(false);

      if (xfile != null) {
        if (mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CameraCapturePreview(
                file: xfile,
              ),
            ),
          ).then((file) {
            if (file != null) {
              GallerySaver.saveImage(file.path).then((path) {
                Navigator.pop(context, true);
              });
            }
          });
        }
      }
    } catch (_) {}
  }

  void setFlashMode(bool value) {
    controller?.setFlashMode(value ? FlashMode.torch : FlashMode.off);
    notifier.flash(value);
  }

  @override
  void initState() {
    initCamera();
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget cameraWidget() {
      var camera = controller!.value;
      // fetch screen size
      final size = MediaQuery.of(context).size;

      // calculate scale depending on screen and camera ratios
      // this is actually size.aspectRatio / (1 / camera.aspectRatio)
      // because camera preview size is received as landscape
      // but we're calculating for portrait orientation
      var scale = size.aspectRatio * camera.aspectRatio;

      // to prevent scaling down, invert the value
      if (scale < 1) scale = 1 / scale;

      return Transform.scale(
          scale: scale,
          child: Center(
            child: CameraPreview(controller!),
          ));
    }

    return MaterialApp(
      home: controller?.value == null
          ? Container()
          : Stack(
              children: [
                cameraWidget(),
                Positioned.fill(
                    child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: Ei.only(b: 25),
                    child: Intrinsic(
                      children: List.generate(3, (index) {
                        List<Widget> widgets = [
                          InkW(
                            onTap: () => Navigator.pop(context),
                            child: Iconr(
                              La.angle_left,
                              color: Colors.white,
                              padding: Ei.all(15),
                            ),
                          ),
                          FloatingActionButton(
                            backgroundColor: Colors.white,
                            onPressed: () => capture(),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(shape: BoxShape.circle, border: Br.all(color: Colors.black, width: 2)),
                            ),
                          ),
                          GestureDetector(
                              onTap: () => setFlashMode(!notifier.isFlashMode),
                              child: ValueListenableBuilder(
                                  valueListenable: notifier,
                                  builder: (context, _, __) {
                                    return Iconr(
                                      notifier.isFlashMode ? La.moon : La.sun,
                                      color: Colors.white,
                                      padding: Ei.all(15),
                                    );
                                  }))
                        ];

                        return Expanded(child: widgets[index]);
                      }),
                    ),
                  ),
                ))
              ],
            ),
    );
  }
}

class CameraNotifier extends ValueNotifier {
  CameraNotifier(super.value);

  bool isFlashMode = false;

  void flash(bool value) {
    isFlashMode = value;
    notifyListeners();
  }
}

class CameraCapturePreview extends StatelessWidget {
  final XFile file;
  const CameraCapturePreview({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(File(file.path)),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: Ei.only(b: 25),
                    child: Intrinsic(
                      children: List.generate(3, (index) {
                        List<Widget> widgets = [
                          const None(),
                          Container(
                            decoration: BoxDecoration(border: Br.all(color: Colors.white), borderRadius: Br.radius(25)),
                            child: ClipRRect(
                              borderRadius: Br.radius(25),
                              child: InkW(
                                onTap: () => Navigator.pop(context, File(file.path)),
                                color: Colors.grey,
                                padding: Ei.sym(v: 10, h: 25),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 25.0,
                                    sigmaY: 25.0,
                                  ),
                                  child: Text(
                                    'Use Photo',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Iconr(
                              La.redo,
                              color: Colors.white,
                              padding: Ei.all(15),
                            ),
                          )
                        ];

                        return Expanded(
                          child: Center(child: widgets[index]),
                        );
                      }),
                    ),
                  )))
        ],
      ),
    );
  }
}
