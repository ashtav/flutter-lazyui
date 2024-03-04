import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key});

  @override
  Widget build(BuildContext context) {
    String image =
        'https://img.freepik.com/free-photo/creative-light-bulb-abstract-glowing-blue-background-generative-ai_188544-8090.jpg?size=626&ext=jpg&ga=GA1.1.1448711260.1706684400&semt=sph';
    String image1 =
        'https://media.macphun.com/img/uploads/customer/how-to/608/15542038745ca344e267fb80.28757312.jpg?q=85&w=1340';
    String image2 =
        'https://images.pexels.com/photos/2055100/pexels-photo-2055100.jpeg';

    return Scaffold(
        appBar: AppBar(
          title: const Text('LzImage'),
        ),
        body: LzListView(
          children: [
            const Textml(
                '<b>LzImage</b> can be used to display images from various sources, including paths, URLs, SVGs, files, file paths, Uint8List, etc. If the path is <p color="008000">LzImage(\'profile.png\')</p>, by default it will be searched in <p color="FFA500">assets/images/profile.png.</p>'),
            Row(
              children: [
                LzImage(
                  image,
                  size: Dimen(h: 220, w: context.width * 0.35),
                  interactive: true,
                ),
                LzImage(
                  image1,
                  size: Dimen(h: 150, w: context.width * 0.25),
                  interactive: true,
                ),
                LzImage(
                  image2,
                  size: Dimen(h: 110, w: context.width * 0.20),
                  alignment: Alignment.topCenter,
                  interactive: true,
                )
              ],
            ).gap(10).margin(t: 25, b: 15),
            Textr('Tap image to preview.',
                icon: Ti.infoCircle, style: Gfont.muted)
          ],
        ));
  }
}
