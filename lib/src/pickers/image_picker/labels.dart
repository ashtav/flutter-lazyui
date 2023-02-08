import 'package:flutter/widgets.dart';

class MediaPickerLabels {
  final String? collectionsTitle;
  final String? items, textConfirm;
  final String? mediaNotAuthorizedAccessTitle;
  final String? mediaNotAuthorizedAccessDescription;
  final String? openSettings;

  const MediaPickerLabels({
    this.collectionsTitle,
    this.items,
    this.textConfirm,
    this.mediaNotAuthorizedAccessTitle,
    this.mediaNotAuthorizedAccessDescription,
    this.openSettings,
  });

  static MediaPickerLabels of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<MediaPickerLabelsProvider>();
    assert(provider != null);
    return provider!.value;
  }

  factory MediaPickerLabels.fallback() => const MediaPickerLabels(
        collectionsTitle: 'Select images',
        items: 'item(s)',
        textConfirm: 'Confirm',
        mediaNotAuthorizedAccessTitle: 'Not authorized',
        mediaNotAuthorizedAccessDescription: "This app can't have access to user media gallery. You must update authorizations in app settings.",
        openSettings: 'Open settings',
      );
}

class MediaPickerLabelsProvider extends InheritedWidget {
  final MediaPickerLabels value;

  const MediaPickerLabelsProvider({
    Key? key,
    required Widget child,
    required this.value,
  }) : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(MediaPickerLabelsProvider oldWidget) {
    return value != oldWidget.value;
  }
}
