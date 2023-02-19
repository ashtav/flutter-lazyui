// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:media_gallery/media_gallery.dart';
import 'package:permission_handler/permission_handler.dart';

import '../utils/log.dart';
import 'cupertino_date_picker.dart';
import 'cupertino_time_picker.dart';
import 'image_picker/labels.dart';
import 'image_picker/picker.dart';
import 'image_picker/selection.dart';

class Pickers {
  /* ------------------------------------------------------------
  | DATE PICKER
  ------------------------------------ */

  static Future<DateTime?> datePicker(BuildContext context,
      {DateTime? initialDate,
      DateTime? firstDate,
      DateTime? lastDate,
      String confirmLabel = 'Confirm',
      bool useShortMonths = false,
      DatePickerType type = DatePickerType.all,
      AlignmentGeometry? alignment}) async {
    if (firstDate != null && lastDate != null && firstDate.isAfter(lastDate)) {
      logg('First date must be smaller than last date', name: 'Pickers');
      return null;
    }

    DateTime? result = await showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (c) => CupertinoDatePickerWidget(
            initialDate: initialDate,
            firstDate: firstDate,
            lastDate: lastDate,
            useShortMonths: useShortMonths,
            type: type,
            alignment: alignment,
            confirmLabel: confirmLabel));

    return result;
  }

  /* ------------------------------------------------------------
  | TIME PICKER
  ------------------------------------ */

  static Future<DateTime?> timePicker(
    BuildContext context, {
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    String confirmLabel = 'Confirm',
  }) async {
    if (firstDate != null && lastDate != null && firstDate.isAfter(lastDate)) {
      logg('First date must be smaller than last date', name: 'Pickers');
      return null;
    }

    DateTime? result = await showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (c) => CupertinoTimePickerWidget(initialDate: initialDate, firstDate: firstDate, lastDate: lastDate, confirmLabel: confirmLabel));

    return result;
  }

  /* ------------------------------------------------------------
  | IMAGE PICKER
  ------------------------------------ */

  static Future<List<Media>?> imagePicker(BuildContext context,
      {String? title, int maxImages = 1, MediaPickerLabels? labels, List<Media>? selectedMedias}) async {
    bool isGranted = false;

    if (Platform.isIOS) {
      PermissionStatus mediaStatus = await Permission.photos.status;
      isGranted = mediaStatus.isGranted;

      if (mediaStatus.isDenied) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Not authorized'),
            content: const Text("This app can't have access to user media gallery. You must update authorizations in app settings."),
            actions: <Widget>[
              TextButton(
                child: const Text('Open Settings'),
                onPressed: () => openAppSettings(),
              ),
            ],
          ),
        );
      }
    } else {
      isGranted = await Permission.storage.request().isGranted;
    }

    List<Media>? result;

    if (isGranted) {
      result = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MediaPicker(
                    title: title,
                    labels: labels,
                    initialSelection: MediaPickerSelection(mediaTypes: [
                      MediaType.image,
                      // MediaType.video,
                    ], maxItems: maxImages, selectedMedias: selectedMedias),
                  )));
    }

    return result;
  }
}
