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
        children: ['Android', 'iOS'].make((data, i) => Text(
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
