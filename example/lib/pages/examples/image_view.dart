import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/dark_mode_widget.dart';
import '../widgets/example_label_widget.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
        actions: [DarkModeWidget.icon()],
      ),
      body: ListView(
        padding: Ei.all(20),
        children: [
          const ExampleLabel(
            description:
                'LzImage is a versatile widget for displaying images in various formats (SVG, PNG, JPG, etc.) from local assets or URLs, all within a single unified widget.',
          ),
        ],
      ),
    );
  }
}
