part of page;

class WidgetsView extends StatelessWidget {
  const WidgetsView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> features = ['Icons', 'Product Details', 'Navbar'];

    features.sort();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Examples UI Widgets'),
        ),
        body: LzListView(
          padding: Ei.zero,
          children: [
            Col(
              children: List.generate(features.length, (i) {
                String label = features[i];

                return InkW(
                  onTap: () => Actions.execute(context, label),
                  padding: Ei.all(20),
                  color: Colors.white,
                  border: Br.only(['t'], except: i == 0),
                  child: Row(
                    mainAxisAlignment: Maa.spaceBetween,
                    children: [
                      Text(label),
                      const Icon(
                        La.angleRight,
                        color: Colors.black54,
                      )
                    ],
                  ),
                );
              }),
            )
          ],
        ));
  }
}

class Actions {
  static execute(BuildContext context, String label) {
    try {
      switch (label) {
        case 'Icons':
          context.push(const ExIcons());
          break;

        case 'Product Details':
          context.push(const ExProductDetail());
          break;

        case 'Navbar':
          context.push(const ExNavbar());
          break;

        default:
      }
    } catch (e, s) {
      Errors.check(e, s);
    }
  }
}
