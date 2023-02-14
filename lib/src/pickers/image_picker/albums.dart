// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lazyui/src/widgets/widgets.dart';
import 'package:media_gallery/media_gallery.dart';

import '../../shortcut.dart';
import 'labels.dart';
import 'medias.dart';
import 'selection.dart';
import 'thumbnail.dart';

class MediaAlbums extends StatelessWidget {
  final List<MediaCollection> collections;

  const MediaAlbums({
    super.key,
    required this.collections,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final labels = MediaPickerLabels.of(context);
    final selection = MediaPickerSelection.of(context);
    final children = collections
        .map<Widget>(
          (x) => AlbumTile(
            collection: x,
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MediaPickerSelectionProvider(
                    selection: selection,
                    child: MediaPickerLabelsProvider(
                      value: labels,
                      child: MediasPage(
                        collection: x,
                      ),
                    ),
                  ),
                ),
              );

              if (result != null) {
                Navigator.pop(context, result);
              }
            },
          ),
        )
        .toList();

    return ListView.separated(
      // padding: Ei.all(15),
      physics: BounceScroll(),
      separatorBuilder: (context, i) => Container(
        // margin: Ei.sym(h: 10),
        height: .7,
        color: theme.textTheme.bodyText2?.color?.withOpacity(0.12),
      ),
      itemBuilder: (context, i) => children[i],
      itemCount: children.length,
    );
  }
}

class AlbumTile extends StatelessWidget {
  final GestureTapCallback onTap;
  final MediaCollection collection;

  const AlbumTile({
    super.key,
    required this.onTap,
    required this.collection,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final labels = MediaPickerLabels.of(context);
    return InkW(
      onTap: onTap,
      padding: Ei.sym(v: 15, h: 20),
      child: SafeArea(
        top: false,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: SizedBox(
            height: 64,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Container(
                    width: 64,
                    height: 64,
                    color: theme.textTheme.subtitle1?.color?.withOpacity(0.1),
                    child: MediaCollectionThumbnailImage(collection: collection),
                  ),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        collection.name,
                        style: theme.textTheme.subtitle1,
                      ),
                      Text(
                        '${collection.count} ${labels.items}',
                        style: theme.textTheme.caption,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
