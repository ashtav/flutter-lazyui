part of example;

class ExProductDetail extends StatelessWidget {
  const ExProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = ProductNotifier();
    notifier.initHeight(context.height * 0.6);

    double imgHeight = context.height * 0.6;

    List<String> images = [
      'https://ajlmypqawp.cloudimg.io/v7/https://www.webfuturestudio.com/uploads/blog/five-tips-on-how-to-photograph-shoes-0026.png?width=1024',
      'https://i.pinimg.com/originals/64/14/2d/64142dc804d126c8e515251459f59df7.jpg'
    ];

    return Scaffold(
      body: Stack(
        children: [
          ListView(
            controller: notifier.scrollController,
            physics: BounceScroll(),
            padding: Ei.only(t: imgHeight, others: 20),
            children: [
              Col(
                children: [
                  Text(
                    'Shoes',
                    style: Gfont.muted,
                  ),
                  Text('Product Name Here', style: Gfont.fs20),
                  Text(Faker.price(), style: Gfont.fs20.bold),
                ],
              ).margin(t: 20, b: 25),
              Text(
                'Sizes',
                style: Gfont.bold,
              ),
              Wrap(
                children: List.generate(4, (i) {
                  return InkW(
                    onTap: () {},
                    padding: Ei.all(15),
                    color: Colors.white,
                    border: Br.all(),
                    radius: Br.radius(5),
                    margin: Ei.only(l: i == 0 ? 0 : 10, t: 10),
                    child: Text(['S', 'M', 'L', 'XL'][i]),
                  );
                }),
              ).margin(b: 25),
              LzListGroup(
                onTap: (i) {},
                children: [
                  ...List.generate(3, (i) {
                    return Row(
                      mainAxisAlignment: Maa.spaceBetween,
                      children: [
                        Text(
                          ['Category', 'Brand', 'Price'][i],
                          style: Gfont.muted,
                        ),
                        Text(['Shoes', 'Brand Name', Faker.price()][i], style: Gfont.xbold(i == 2)),
                      ],
                    );
                  }),
                  Col(
                    children: [
                      Text('Description', style: Gfont.muted),
                      Textr(
                        Faker.words(25),
                        margin: Ei.only(t: 5),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          notifier
              .watch((state) => GestureDetector(
                    onVerticalDragUpdate: (details) => notifier.onDrag(details),
                    child: Stack(
                      children: [
                        CarouselSlider(
                            carouselController: notifier.carouselController,
                            options: CarouselOptions(
                                viewportFraction: 1,
                                initialPage: 0,
                                autoPlayInterval: 5.s,
                                enableInfiniteScroll: true,
                                height: state.imgHeight,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                onPageChanged: (index, _) {},
                                scrollPhysics: BounceScroll()),
                            items: List.generate(images.length, (i) {
                              return LzImage(
                                images[i],
                                width: context.width,
                                height: state.imgHeight,
                                radius: 0,
                              );
                            })),
                        Poslign(
                          alignment: Alignment.bottomLeft,
                          margin: Ei.all(20),
                          child: Row(
                            children: List.generate(images.length, (i) {
                              return LzImage(
                                images[i],
                                size: 55,
                              ).lzStyle(border: Br.all(color: LzColors.dark), radius: Br.radius(5), margin: Ei.only(l: i == 0 ? 0 : 8)).onTap(() {
                                state.carouselController.animateToPage(i);
                              });
                            }),
                          ),
                        )
                      ],
                    ),
                  ))
              .clip(),
          Container(
            padding: Ei.only(t: context.padding.top + 10, others: 20),
            child: Row(
              children: [
                InkW(
                  onTap: () => context.pop(),
                  color: Colors.white,
                  padding: Ei.all(13),
                  radius: Br.circle,
                  child: const Icon(La.arrowLeft),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProductNotifier extends ChangeNotifier {
  final scrollController = ScrollController();
  final carouselController = CarouselController();

  double defaultHeight = 0;
  double imgHeight = 0;

  void initHeight(double value) {
    defaultHeight = value;
    imgHeight = value;
  }

  void onDrag(DragUpdateDetails details) {
    double delta = details.delta.dy;
    double newHeight = scrollController.offset - delta;
    scrollController.jumpTo(newHeight);
  }

  void scrollListener() {
    double pixels = scrollController.position.pixels;

    if (pixels < 0) {
      imgHeight = defaultHeight + pixels.abs();
    } else {
      double height = defaultHeight - pixels;
      imgHeight = height < 0 ? 0 : height;
    }

    notifyListeners();
  }

  ProductNotifier() {
    scrollController.addListener(scrollListener);
  }
}

class LzListGroup extends StatelessWidget {
  final List<Widget> children;
  final Function(int index)? onTap;
  final double? radius;
  const LzListGroup({super.key, this.children = const [], this.onTap, this.radius});

  @override
  Widget build(BuildContext context) {
    double radius = this.radius ?? LazyUi.getConfig.radius;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Br.all(),
        borderRadius: Br.radius(radius),
      ),
      child: Col(
        children: List.generate(children.length, (i) {
          return InkW(
            onTap: onTap == null ? null : () => onTap?.call(i),
            border: Br.only(['t'], except: i == 0),
            padding: Ei.all(20),
            child: SizedBox(
              width: context.width,
              child: children[i],
            ),
          );
        }),
      ).clip(all: radius - 1),
    );
  }
}
