part of page;

class DateTimePicker extends StatelessWidget {
  const DateTimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final forms =
        LzForm.make(['date', 'date_month', 'month_year', 'year', 'time', 'datetime']);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Time Picker'),
      ),
      body: LzListView(
        children: [
          LzFormGroup(
            children: [
              LzForm.input(
                  label: 'Date',
                  hint: 'Select your date',
                  model: forms['date'],
                  suffixIcon: La.calendar,
                  onTap: (model) async {
                    DateTime? date = await Pickers.datePicker(context);
                    if (date != null) model.text = date.format();
                  }),
              LzForm.input(
                  label: 'Date & Month',
                  hint: 'Select date & month',
                  model: forms['date_month'],
                  suffixIcon: La.calendar,
                  onTap: (model) async {
                    DateTime? date = await Pickers.datePicker(context,
                        type: DatePickerType.dateMonth);
                    if (date != null) model.text = date.format('dd MMMM yyyy');
                  }),
              LzForm.input(
                  label: 'Month & Year',
                  hint: 'Select month & year',
                  model: forms['month_year'],
                  suffixIcon: La.calendar,
                  onTap: (model) async {
                    DateTime? date = await Pickers.datePicker(context,
                        type: DatePickerType.monthYear);
                    if (date != null) model.text = date.format('MMMM yyyy');
                  }),
              LzForm.input(
                  label: 'Year',
                  hint: 'Select year',
                  model: forms['year'],
                  suffixIcon: La.calendar,
                  onTap: (model) async {
                    DateTime? date = await Pickers.datePicker(context,
                        type: DatePickerType.year);
                    if (date != null) model.text = date.format('yyyy');
                  }),
            ],
          ),
          LzFormGroup(children: [
            LzForm.input(
                label: 'Time',
                hint: 'Select your time',
                model: forms['time'],
                suffixIcon: La.clock,
                onTap: (model) async {
                  DateTime? date = await Pickers.timePicker(context);
                  if (date != null) model.text = date.format('HH:mm a');
                }),
            LzForm.input(
                label: 'Date Time',
                hint: 'Select date and time',
                model: forms['datetime'],
                suffixIcon: La.calendar,
                onTap: (model) async {
                  DateTime? date = await Pickers.dateTimePicker(context, maxDate: DateTime.now().add(1.y), initialDate: model.text.toDate());
                  if (date != null) model.text = date.format('dd/MM/yyyy HH:mm a');
                })
          ])
        ],
      ),
    );
  }
}
