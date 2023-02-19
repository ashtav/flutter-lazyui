import 'dart:async';

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:media_gallery/media_gallery.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../shortcut.dart';
import '../../widgets/widgets.dart';
import 'albums.dart';
import 'camera.dart';
import 'medias.dart';
import 'selection.dart';
import 'validate.dart';

class MediaCollectionsPage extends StatefulWidget {
  final String? title;
  const MediaCollectionsPage({super.key, this.title});

  @override
  State<MediaCollectionsPage> createState() => _MediaCollectionsPageState();
}

class _MediaCollectionsPageState extends State<MediaCollectionsPage> with TickerProviderStateMixin {
  List<MediaCollection> collections = [];
  bool isLoading = true;

  Future<void> initGallery() async {
    final selection = MediaPickerSelection.of(context);

    try {
      setState(() {
        isLoading = true;
        collections = [];
      });

      await Future.delayed(const Duration(milliseconds: 50), () async {
        List list = await MediaGallery.listMediaCollections(
          mediaTypes: selection.mediaTypes,
        );

        collections = list.cast<MediaCollection>();
        isLoading = false;

        setState(() {});
      });
    } catch (_) {}
  }

  void openCamera() async {
    PermissionStatus status = await Permission.camera.request();

    if (status.isGranted) {
      if (!mounted) return;

      final file = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CameraScreen(),
        ),
      );

      if (file != null && mounted) {
        initGallery();
        // Navigator.pop(context, {
        //   'camera': file,
        // });
      }
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => initGallery());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MediaPickerSelection selection = MediaPickerSelection.of(context);
    final int maxImages = selection.maxItems;
    // final labels = MediaPickerLabels.of(context);

    selection.tabController = TabController(length: 2, vsync: this);

    MediaCollection? allCollection;

    if (collections.isNotEmpty) {
      allCollection = collections.firstWhere(
        (c) => c.isAllCollection,
      );
    }

    return DefaultTabController(
      length: selection.mediaTypes.length + 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(La.arrow_left, color: Colors.black54),
            onPressed: () => Navigator.pop(context),
          ),
          elevation: .5,
          title: Text(
            widget.title ?? 'Select Image',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 20, color: Colors.black54),
          ),
          actions: [IconButton(onPressed: () => openCamera(), icon: const Icon(La.camera, color: Colors.black54))],
        ),
        body: Stack(
          children: [
            Column(
              children: [
                // const NavbarImagePicker(),
                Expanded(
                  child: isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: selection.tabController,
                          children: [
                            ...selection.mediaTypes.map(
                              (e) => allCollection == null
                                  ? const SizedBox()
                                  : MediaGrid(
                                      key: Key(e.toString()),
                                      collection: allCollection,
                                      mediaType: e,
                                    ),
                            ),
                            MediaAlbums(
                              collections: collections
                                  .where(
                                    (e) => !e.isAllCollection,
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                ),
              ],
            ),
            Positioned.fill(
                child: maxImages <= 1
                    ? const None()
                    : Align(
                        alignment: Alignment.bottomCenter,
                        child: PickerValidateButton(
                          onValidate: (MediaPickerSelection selection) => {
                            Navigator.pop(context, selection.selectedMedias),
                          },
                        ))),
          ],
        ),
      ),
    );
  }
}

class NavbarImagePicker extends StatelessWidget {
  const NavbarImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final selection = MediaPickerSelection.of(context);

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
          decoration: BoxDecoration(color: Colors.white, border: Br.only(['b'], width: .7)),
          child: AnimatedBuilder(
            animation: selection,
            builder: (context, _) => Intrinsic(
              children: List.generate(2, (i) {
                List<IconData> icons = [La.image, La.images];
                int selectionIndex = selection.tabController?.index ?? 0;

                return Expanded(
                  child: Container(
                    decoration: BoxDecoration(border: Br.only(['l'], except: i == 0)),
                    child: InkW(
                      onTap: () {
                        if (i >= 2) return;
                        selection.setTab(i);
                      },
                      padding: Ei.sym(v: 12, h: 15),
                      child: Icon(
                        icons[i],
                        color: i == selectionIndex ? Colors.blueAccent : Colors.black45,
                      ),
                    ),
                  ),
                );
              }),
            ),
          )),
    );
  }
}
