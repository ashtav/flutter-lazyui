part of example;

class ExNavbar extends StatelessWidget {
  const ExNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = NavbarNotifier();

    List<IconData> icons = [Ti.home, Ti.book, Ti.bell, Ti.user];
    List<Widget> pages = ['Home', 'Guidance', 'Notification', 'Account'].generate(
      (data, i) => Center(
          child: Column(
        mainAxisAlignment: Maa.center,
        children: [
          Icon(
            icons[i],
            size: 50,
            color: Colors.black54,
          ),
          Text(
            data,
            style: Gfont.fs20.bold,
          ).margin(b: 10, t: 15),
          Text(
            Faker.words(20),
            textAlign: Ta.center,
          )
        ],
      )).padding(all: 25),
    );

    return Scaffold(
      body: notifier.watch((state) => Stack(
            children: [
              Stack(
                  children: List<Widget>.generate(4, (int index) {
                bool isActive = state.index == index;

                return IgnorePointer(
                  ignoring: !isActive,
                  child: AnimatedOpacity(
                    duration: 250.ms,
                    opacity: isActive ? 1 : 0,
                    child: Navigator(
                      onGenerateRoute: (RouteSettings settings) {
                        return MaterialPageRoute(
                          builder: (_) => pages[index],
                          settings: settings,
                        );
                      },
                    ),
                  ),
                );
              })),
            ],
          )),
      bottomNavigationBar: notifier.watch((state) => Stack(
            children: [
              Intrinsic(
                children: List.generate(4, (i) {
                  return Expanded(
                    child: InkTouch(
                      onTap: () {
                        state.onNavigate(i);
                      },
                      padding: Ei.all(20),
                      color: Colors.white,
                      child: Icon(
                        icons[i],
                        color:
                            state.index == i ? Colors.black87 : Colors.black45,
                      ),
                    ),
                  );
                }),
              ),
              AnimatedPositioned(
                duration: 250.ms,
                curve: Curves.easeInOutBack,
                left: notifier.index * context.width / 4,
                bottom: 0,
                child: Container(
                  height: 2,
                  width: context.width / 4,
                  color: Colors.black87,
                ),
              ),
            ],
          )),
    );
  }
}

class NavbarNotifier extends ChangeNotifier {
  int index = 0;

  void onNavigate(int value) {
    index = value;
    notifyListeners();
  }
}
