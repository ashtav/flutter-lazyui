import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lazyui/lazyui.dart';

class Pickers {
  static void show(BuildContext context,
      {double size = 2000,
      int quality = 90,
      Function(File? file)? then}) async {
    final ImagePicker picker = ImagePicker();

    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: size,
        maxHeight: size,
        imageQuality: quality);

    if (pickedFile != null) {
      File file = File(pickedFile.path);
      // ignore: use_build_context_synchronously
      context.dialog(ImagePickerPreview(file: file));
    }
  }
}

class ImagePickerPreview extends StatelessWidget {
  final File file;
  const ImagePickerPreview({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SlideAnimate(
                axis: SlideAxis.topToBottom,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: Br.radius(7), color: Colors.white70),
                  width: 260,
                  height: 20,
                ),
              ),
              Container(
                width: 290,
                margin: Ei.only(b: 7),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: Br.radius(7)),
                child: Column(
                  children: [
                    LzImage(file, size: [context.width, 250], radius: 0),
                    ...['Jadikan Foto Profil', 'Batal'].generate((text, i) {
                      final font = Gfont.style(context);
                      return Container(
                          padding: Ei.all(20),
                          width: context.width,
                          decoration: BoxDecoration(border: Br.only(['t'])),
                          child: Text(
                            text,
                            textAlign: Ta.center,
                            style: i == 0 ? font.bold : font.normal,
                          )).onTap(() {}, hoverable: true);
                    })
                  ],
                ),
              ),
            ],
          )
        ],
      ).center,
    );
  }
}
