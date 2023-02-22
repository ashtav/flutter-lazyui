import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:media_gallery/media_gallery.dart';

import '../../../ext/line_awesome.dart';
import '../../extensions/context_extension.dart';
import '../../shortcut.dart';
import '../../widgets/widgets.dart';
import 'selectable.dart';
import 'selection.dart';
import 'thumbnail.dart';
import 'validate.dart';

class MediasPage extends StatefulWidget {
  final MediaCollection collection;
  const MediasPage({
    super.key,
    required this.collection,
  });

  @override
  State<MediasPage> createState() => _MediaImagesPageState();
}

class _MediaImagesPageState extends State<MediasPage> {
  @override
  Widget build(BuildContext context) {
    final selection = MediaPickerSelection.of(context);
    final maxImages = selection.maxItems;

    return DefaultTabController(
      length: selection.mediaTypes.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(La.angle_left, color: Colors.black54),
            onPressed: () => Navigator.pop(context),
          ),
          elevation: .5,

          title: Text(
            widget.collection.name,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 20, color: Colors.black54),
          ),

          // actions: <Widget>[
          //   PickerValidateButton(
          //     onValidate: (selection) => Navigator.pop(context, selection),
          //   ),
          // ],
          // bottom: selection.mediaTypes.length > 1
          //     ? TabBar(
          //         tabs: selection.mediaTypes
          //             .map(
          //               (x) => Tab(
          //                 text: x == MediaType.video ? labels.videos : labels.images,
          //               ),
          //             )
          //             .toList(),
          //       )
          //     : null,
        ),
        body: Stack(
          children: [
            Column(children: [
              Expanded(
                child: TabBarView(
                  children: selection.mediaTypes
                      .map(
                        (x) => MediaGrid(
                          key: Key(x.toString()),
                          collection: widget.collection,
                          mediaType: x,
                        ),
                      )
                      .toList(),
                ),
              ),
            ]),
            Positioned.fill(
                child: maxImages <= 1
                    ? const None()
                    : Align(
                        alignment: Alignment.bottomCenter,
                        child:
                            PickerValidateButton(onValidate: (MediaPickerSelection selection) => Navigator.pop(context, selection.selectedMedias)))),
          ],
        ),
      ),
    );
  }
}

class MediaGrid extends StatefulWidget {
  final MediaCollection collection;
  final MediaType mediaType;

  const MediaGrid({
    Key? key,
    required this.mediaType,
    required this.collection,
  }) : super(key: key);

  @override
  State<MediaGrid> createState() => _MediaGridState();
}

class _MediaGridState extends State<MediaGrid> with AutomaticKeepAliveClientMixin {
  List<MediaPage> pages = [];
  bool isLoading = false;

  bool get canLoadMore => !isLoading && pages.isNotEmpty && (!pages.last.isLast);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initAsync();
    });
    super.initState();
  }

  Future<void> initAsync() async {
    setState(() {
      isLoading = true;
    });
    try {
      pages.add(
        await widget.collection.getMedias(
          mediaType: widget.mediaType,
          take: 50,
        ),
      );
      setState(() {});
    } catch (_) {
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> loadMore() async {
    setState(() {
      isLoading = true;
    });
    try {
      final nextPage = await pages.last.nextPage();
      pages.add(nextPage);
    } catch (_) {
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future previewImg(Media media) async {
    File? file = await media.getFile();

    if (file != null && mounted) {
      Navigator.of(context).push(PageRouteBuilder(
          opaque: false,
          transitionDuration: const Duration(milliseconds: 300),
          barrierDismissible: true,
          // transitionsBuilder: (context, a1, a2, widget) {
          //   return Transform.scale(
          //     scale: a1.value,
          //     child: Opacity(
          //       opacity: a1.value,
          //       child: ImgPreviewWidget(file: file, tag: media.id),
          //     ),
          //   );
          // },
          pageBuilder: (BuildContext context, a1, a2) {
            return Transform.scale(
              scale: a1.value,
              child: Opacity(
                opacity: a1.value,
                child: ImgPreviewWidget(file: file, tag: media.id),
              ),
            );
            // return ImgPreviewWidget(file: file, tag: media.id);
          }));
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final mediaQuery = MediaQuery.of(context);
    final allMedias = pages.expand((x) => x.items);
    final crossAxisCount = (mediaQuery.size.width / 128).ceil();
    final selection = MediaPickerSelection.of(context);
    final int maxImages = selection.maxItems;

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (canLoadMore && scrollInfo.metrics.pixels + mediaQuery.size.height >= scrollInfo.metrics.maxScrollExtent) {
          loadMore();
        }
        return false;
      },
      child: GridView(
        padding: Ei.all(0),
        physics: BounceScroll(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: 1.0,
        ),
        children: <Widget>[
          ...allMedias.map<Widget>(
            (e) => AnimatedBuilder(
              key: Key(e.id),
              animation: selection,
              builder: (context, _) => InkWell(
                onTap: () {
                  if (maxImages > 1) {
                    selection.toggle(e);
                  } else {
                    selection.clear();

                    selection.toggle(e);
                    Navigator.pop(context, selection.selectedMedias);
                  }
                },
                onLongPress: () => previewImg(e),
                child: Selectable(
                  isSelected: selection.contains(e),
                  number: (selection.selectedMedias.indexWhere((m) => m.id == e.id) + 1),
                  child: Hero(
                    tag: e.id,
                    child: MediaThumbnailImage(
                      media: e,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ImgPreviewWidget extends StatelessWidget {
  final File file;
  final String tag;
  const ImgPreviewWidget({super.key, required this.file, required this.tag});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: CenterDialog(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: context.width > 350 ? 350 : context.width,
              maxHeight: context.height * .8,
            ),
            decoration: BoxDecoration(
              borderRadius: Br.radius(5),
            ),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: ClipRRect(
                  borderRadius: Br.radius(5),
                  child: Image.file(
                    file,
                    fit: BoxFit.contain,
                    frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                      return AnimatedOpacity(
                        opacity: frame == null ? 0 : 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut,
                        child: Hero(tag: tag, child: child),
                      );
                    },
                  )),
            ),
          ),
        ));
  }
}
