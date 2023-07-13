part of page;

class LzConfirmView extends StatelessWidget {
  const LzConfirmView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LzConfirm'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: Maa.center,
          children: [
            InkW(
              onTap: (){
                LzConfirm(
                  title: 'Widget Confirmation',
                  message: 'Are you sure you want to confirm this widget?',
                  onConfirm: (){
                    LzToast.show('Widget confirmed');
                  },
                ).show(context);
              },
              radius: Br.radius(7),
              padding: Ei.all(20),
              child: const Text('Dialog Confirm'),
            ),

            InkW(
              onTap: (){
                LzConfirm(
                  title: 'Widget Confirmation',
                  message: 'Are you sure you want to confirm this widget?',
                  type: LzConfirmType.bottomSheet, confirmText: 'Yes, Delete It!',
                  onConfirm: (){
                    LzToast.show('Widget confirmed');
                  },
                ).show(context);
              },
              radius: Br.radius(7),
              padding: Ei.all(20),
              child: const Text('Bottom Sheet Confirm'),
            )
          ],
        ),
      )
    );
  }
}
