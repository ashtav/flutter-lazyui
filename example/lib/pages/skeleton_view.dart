part of page;

class SkeletonView extends StatelessWidget {
  const SkeletonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skeleton'),
      ),
      body: LzListView(
        children: [
          Text(Faker.words(25)),
          Skeleton(
            size: [context.width, 50],
            radiusOnly: LzRadius(tlr: 5),
            margin: Ei.only(t: 25),
          ),
          Skeleton(
            size: [context.width, 15],
            radiusOnly: LzRadius(blr: 5),
            margin: Ei.only(t: 5, b: 25),
          ),
          const Text('Use skeleton with random size'),
          Skeleton(
            size: [
              [50, context.width],
              15
            ],
            radius: 5,
            margin: Ei.only(t: 25),
          ).iterate(3),
          Container(
            padding: Ei.all(20),
            margin: Ei.only(t: 25),
            decoration: BoxDecoration(
                color: Utils.hex('0b1120'), borderRadius: Br.radius(5)),
            child: Col(
              children: [
                Text(
                  'Use skeleton in the dark mode',
                  style: Gfont.white,
                ).margin(b: 15),
                Row(
                  children: [
                    Skeleton(
                      size: 80,
                      radius: 5,
                      darkColor: Utils.hex('0b1120'),
                      margin: Ei.only(r: 15),
                    ),
                    Skeleton(
                      size: [
                        [50, context.width - 180],
                        15
                      ],
                      radius: 5,
                      margin: Ei.only(t: 5),
                      darkColor: Utils.hex('0b1120'),
                    ).iterate(3),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
