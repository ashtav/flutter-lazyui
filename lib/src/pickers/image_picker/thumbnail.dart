import 'package:flutter/material.dart';
import 'package:media_gallery/media_gallery.dart';
import 'package:transparent_image/transparent_image.dart';

class MediaThumbnailImage extends StatelessWidget {
  final Media media;

  const MediaThumbnailImage({
    super.key,
    required this.media,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned.fill(
          child: FadeInImage(
            fit: BoxFit.cover,
            placeholder: MemoryImage(kTransparentImage),
            image: MediaThumbnailProvider(
              media: media,
            ),
          ),
        ),
        if (media.mediaType == MediaType.video)
          const Icon(
            Icons.play_circle_filled,
            color: Colors.white,
            size: 42,
          ),
      ],
    );
  }
}

class MediaCollectionThumbnailImage extends StatelessWidget {
  final MediaCollection collection;

  const MediaCollectionThumbnailImage({
    super.key,
    required this.collection,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned.fill(
          child: FadeInImage(
            fit: BoxFit.cover,
            placeholder: MemoryImage(kTransparentImage),
            image: MediaCollectionThumbnailProvider(
              collection: collection,
            ),
          ),
        ),
      ],
    );
  }
}
