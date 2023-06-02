part of page;

List<String> _addresses = List.generate(15, (i) => Faker.address());

class LzOptionView extends StatelessWidget {
  const LzOptionView({super.key});

  @override
  Widget build(BuildContext context) {
    Option? selected;
    final forms = LzForm.make(['selective']);

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
              model: forms['selective'],
              onTap: (model) {
                LzSelectiveOption.show(context,
                    title: 'Select Address',
                    initValue: selected,
                    options: _addresses.options(values: List.generate(15, (i) => i)), onSelect: (option) {
                  model.text = option.option;
                  selected = option;
                }, activeColor: Colors.orange, suffix: const Icon(La.angleRight, color: Colors.black45));
              })
        ],
      ),
    );
  }
}
