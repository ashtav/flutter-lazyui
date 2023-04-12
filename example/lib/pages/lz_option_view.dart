part of page;

class LzOptionView extends StatelessWidget {
  const LzOptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LzOption View'),
      ),
      body: LzFormList(
        children: [
          LzFormGroup(
            children: [
              LzForm.input(
                  label: 'Lz Option',
                  hint: 'Tap to show option',
                  onTap: (_) {
                    LzOption.show(context, options: ['Detail', 'Edit', 'Delete'].options(icons: [La.infoCircle, La.edit, La.trash]), confirmOnTap: [
                      {2: 'Cancel|Confirm'}
                    ], onSelect: (option) {
                      logg(option.option);
                    });
                  }),
              LzForm.input(
                  label: 'Custom Select Option',
                  hint: 'Tap to show option',
                  onTap: (_) {
                    SelectPicker.show(context, fullScreen: true, options: ['Seminar', 'Workshop', 'Training', 'Meeting', 'Playing'].options(),
                        onSelect: (o) {
                      logg(o.toMap());
                    });
                  })
            ],
          )
        ],
      ),
    );
  }
}
