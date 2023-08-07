part of page;

class PopupDialogView extends StatelessWidget {
  const PopupDialogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Popup Dialog')),
      body: LzListView(
        children: [
          LzButton(
            text: 'Show Popup Dialog',
            onTap: (_) {
              context.dialog(const ExamplePopup1());
            },
          ),
          const SizedBox(height: 10),
          LzButton(
            text: 'Show Popup Lz Dialog ',
            onTap: (_) {
              context.generalDialog(const ExamplePopup2());
            },
          )
        ],
      ),
    );
  }
}

class ExamplePopup1 extends StatelessWidget {
  const ExamplePopup1({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      showTapClose: true,
      closeMessage: 'Tap anywhere to close',
      padding: Ei.sym(v: 35, h: 20),
      footer: IntrinsicButton(
        onTap: (int index) {
          logg(index);
        },
        children: ['Android', 'iOS'].generate((data, i) => Text(
              data[i],
              textAlign: Ta.center,
            )),
      ),
      children: [
        Iconr(
          La.infoCircle,
          size: 50,
          margin: Ei.only(b: 15),
        ),
        Text('New Version is Available', style: Gfont.fs20.bold),
        Textr(
          'New version of LazyUi is available. Please update to the latest version of this app to continue using the service.',
          style: Gfont.muted,
          textAlign: Ta.center,
          margin: Ei.only(t: 15),
        )
      ],
    );
  }
}

class ExamplePopup2 extends StatelessWidget {
  const ExamplePopup2({super.key});

  @override
  Widget build(BuildContext context) {
    return LzDialog(
      showXIcon: true,
      footer: IntrinsicButton(
        onTap: (i) {},
        children: ['Cancel', 'Confirm'].generate((data, i) => Text(
              data,
              textAlign: Ta.center,
            )),
      ),
      children: [
        LzPadder(
          crossAxisAlignment: Caa.center,
          children: [
            const SizedBox(height: 25),
            const Icon(
              Ti.writing,
              size: 45,
              color: Colors.orange,
            ),
            Textr(
              'Dialog Title',
              style: Gfont.fs20.bold,
              margin: Ei.only(t: 15),
            ),
            Textr(
              Faker.words(19),
              margin: Ei.only(t: 10, b: 25),
              textAlign: Ta.center,
            ),
          ],
        ),
      ],
    );
  }
}
