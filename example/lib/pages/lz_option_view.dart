part of page;

List<String> _addresses = List.generate(15, (i) => Faker.address());

class LzOptionView extends StatelessWidget {
  const LzOptionView({super.key});

  @override
  Widget build(BuildContext context) {
    Option? selected;

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
          ),
          LzForm.input(
              label: 'Custom Selective Option',
              hint: 'Tap to show option',
              onTap: (_) {
                LzSelectiveOption.show(context, initValue: selected, options: _addresses.options(values: List.generate(15, (i) => i)),
                    onSelect: (option) {
                  selected = option;
                });
              })
        ],
      ),
    );
  }
}
