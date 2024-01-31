import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class LzImageView extends StatelessWidget {
  const LzImageView({super.key});

  @override
  Widget build(BuildContext context) {
    String image =
        'https://img.freepik.com/free-photo/creative-light-bulb-abstract-glowing-blue-background-generative-ai_188544-8090.jpg?size=626&ext=jpg&ga=GA1.1.1448711260.1706684400&semt=sph';

    String svgImage = 'https://reseller.saddannusantara.com/images/icons/013-study.svg';

    return Scaffold(
        appBar: AppBar(
          title: const Text('LzImage'),
        ),
        body: LzListView(
          children: [
            Column(
              children: [
                LzImage(
                  image,
                  size: Dimen(h: 50, w: 150),
                  fit: BoxFit.contain,
                )
              ],
            ).start
          ],
        ));
  }
}
