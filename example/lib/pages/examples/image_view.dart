import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/example_label_widget.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key});

  @override
  Widget build(BuildContext context) {
    String imageURL = 'https://cdn3.pixelcut.app/7/20/uncrop_hero_bdf08a8ca6.jpg';
    String imageGIF = 'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/893964104784767.5f6aa6e12f6cf.gif';

    final images = [
      'https://wallpapers.com/images/featured/aesthetic-pictures-hv6f88paqtseqh92.jpg',
      'https://cdn.thewirecutter.com/wp-content/media/2021/09/pencils-2048px-6614.jpg',
      'https://i.pinimg.com/736x/06/b7/2e/06b72e74b9542bf98911bdb09203f5d6.jpg',
      'https://images.squarespace-cdn.com/content/v1/63dde481bbabc6724d988548/52305290-a32b-495c-b8ef-12732dcc5384/_d9ce6864-762e-405a-bbbc-c8277cc0c946.jpg',
      'https://d2bzx2vuetkzse.cloudfront.net/fit-in/0x450/unshoppable_producs/f5d32129-3b0b-4abb-997e-2a2a03c21a77.png',
      'https://st.depositphotos.com/7595566/53720/i/450/depositphotos_537204930-stock-photo-delicate-beige-peony-flower-aesthetic.jpg'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
        actions: [LzThemeAction()],
      ),
      body: LzListView(
        padding: Ei.zero,
        // physics: Scrolics.page,
        children: [
          Container(
            padding: Ei.all(20),
            child: const ExampleLabel(
              description:
                  'LzImage is a flexible and powerful widget for displaying images from multiple sources and formats. It supports formats like JPG, JPEG, PNG, GIF, SVG, and accepts inputs such as image URLs, file paths, local asset paths, File objects, Uint8List, or pre-built Image widgets, providing seamless integration and consistent rendering across all use cases.',
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: Ei.sym(h: 20),
            physics: Scrolics.bounce,
            child: Row(
                spacing: 13,
                children: ['Url', 'Gif', 'Svg', 'Path'].generate((item, i) {
                  double size = (context.width / 4) - 20;

                  final images = [
                    LzImage(imageURL, size: size),
                    LzImage(imageGIF, size: size),
                    LzImage('svg-example.svg', size: size),
                    LzImage('profile.png', size: size),
                  ];

                  return Column(
                    spacing: 10,
                    children: [images[i], Text(item, style: Gfont.fs14)],
                  );
                })),
          ),
          35.height,
          Container(
              padding: Ei.all(20),
              child: Column(
                spacing: 25,
                children: [
                  Textml(
                      'Set <b>previewable: true</b> to allow opening the image in a new page with zoom-in and zoom-out support.'),
                  ImageList(
                    images: images,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class ImageList extends StatelessWidget {
  final List<String> images;
  const ImageList({super.key, this.images = const []});

  @override
  Widget build(BuildContext context) {
    final images = _chunk(this.images, 3);

    return Column(
      spacing: 3,
      children: images.generate((col, i) {
        return Row(
          spacing: 3,
          children: col.generate((image, j) {
            return Expanded(
                flex: (i + j) == 2 ? 2 : 1, child: LzImage(image, size: [context.width, 100], previewable: true));
          }),
        );
      }),
    );
  }
}

List<List<T>> _chunk<T>(List<T> array, int chunkSize) {
  if (chunkSize <= 0) {
    throw ArgumentError('Chunk size must be greater than 0');
  }

  List<List<T>> chunks = [];
  for (int i = 0; i < array.length; i += chunkSize) {
    chunks.add(array.sublist(i, i + chunkSize > array.length ? array.length : i + chunkSize));
  }
  return chunks;
}
