import 'package:flutter/material.dart';

import 'collections.dart';
import 'labels.dart';
import 'selection.dart';

class MediaPicker extends StatefulWidget {
  final MediaPickerSelection? initialSelection;
  final MediaPickerLabels? labels;
  final String? title;

  const MediaPicker({super.key, this.labels, this.initialSelection, this.title = "Select Image"});

  @override
  State<MediaPicker> createState() => _MediaPickerState();
}

class _MediaPickerState extends State<MediaPicker> {
  MediaPickerSelection? _selection;

  @override
  void initState() {
    _selection = widget.initialSelection ?? MediaPickerSelection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaPickerSelectionProvider(
      selection: _selection!,
      child: MediaPickerLabelsProvider(
        value: widget.labels ?? MediaPickerLabels.fallback(),
        child: MediaCollectionsPage(title: widget.title),
      ),
    );
  }
}
