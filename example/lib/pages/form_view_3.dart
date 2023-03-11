import 'package:example/app/core/utils/toast.dart';
import 'package:example/codelabs/lazyform/constant.dart';
import 'package:example/codelabs/lazyform/group.dart';
import 'package:example/codelabs/lazyform/lazyform.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart' hide FormMessages;

class FormView3 extends StatelessWidget {
  const FormView3({super.key});

  @override
  Widget build(BuildContext context) {
    final forms = LzForm.make(['name', 'birthday', 'fruit', 'hobby', 'email', 'password', 'province']).fill({'email': 'ashtaaav@gmail.com'});

    return Wrapper(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Form View'),
      ),
      body: BounceListView(
        children: [
          LzFormGroup(
            label: 'Bio',
            prefixIcon: La.user,
            children: [
              LzForm.input(label: 'Your Name *', hint: 'Input your name', indicator: true, model: forms['name']),
              LzForm.input(
                  label: 'Birthday *',
                  hint: 'Input your birthday',
                  model: forms['birthday'],
                  onTap: (model) {
                    // open date picker, then set value to the model
                    model.text = '2021-01-01';
                  }),
            ],
          ),
          LzForm.radio(
              label: 'Favorite Fruit *',
              options: List.generate(
                  7, (i) => Option(option: ['Mango', 'Banana', 'Apple', 'Orange', 'Durian', 'Melon', 'Watermelon'][i], enabled: i != 2)),
              model: forms['fruit']),
          LzForm.checkbox(
              label: 'Hobbies *',
              options: List.generate(5, (i) => Option(option: ['Swimming', 'Reading', 'Coding', 'Cooking', 'Playing Music'][i])),
              model: forms['hobby']),
          LzFormGroup(
            label: 'Account',
            prefixIcon: La.lock,
            children: [
              LzForm.input(label: 'Email *', hint: 'Input your email address', model: forms['email']),
              LzForm.input(label: 'Password *', hint: 'Input your password', model: forms['password'], obsecureToggle: true),
            ],
          ),
          LzFormGroup(
            label: 'Address',
            prefixIcon: La.mapMarked,
            children: [
              // set options based on data from server
              LzForm.select(
                  label: 'Province *',
                  hint: 'Please select province',
                  model: forms['province'],
                  onTap: (selector) async {
                    // get data from server
                    toast.overlay('Loading...');
                    final data = await MyController.getProvince();
                    toast.dismiss();

                    // set options
                    selector.options = data.map((e) => Option(option: e['name'], value: e['id'])).toList();
                  },
                  onSelect: (selector) {
                    // You can set value (Option, String (option), or dynamic (value)
                    // provinceId = selector.option?.value
                  }),

              // set options from parameter
              LzForm.select(
                  label: 'City *',
                  hint: 'Please select city',
                  options: const [Option(option: 'Denpasar', value: 1), Option(option: 'Tabanan', value: 2)]),
              LzForm.select(label: 'District *', hint: 'Please select district'),
            ],
          ),
          LzForm.input(label: 'Salary *', hint: 'Input your salary', keyboard: Tit.number, formatters: [InputFormat.idr]),
          LzForm.input(label: 'About You *', hint: 'Tell us about you'),
          LzForm.switches(label: 'Active|Inactive', activeColor: Colors.blue)
        ],
      ),
      bottomNavigationBar: Forms.button(
          text: 'Submit',
          onTap: () {
            LzForm form = LzForm.validate(forms,
                required: ['*'],
                email: ['email'],
                min: ['password:6', 'name:5'],
                messages: FormMessages(required: {
                  'name': 'Please input your name',
                  'fruit': 'Please select one of your favorite fruit, thanks for read this long important message!',
                  'email': 'Please input your email address',
                  'password': 'Please input your password',
                }, email: {
                  'email': 'Please input valid email address',
                }, min: {
                  'name': 'Name must be at least 5 characters',
                  'password': 'Password must be at least 6 characters'
                }),
                notifierType: FormValidateNotifier.text);

            logg(form.ok);
          }),
    ));
  }
}

class BounceListView extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final List<Widget> children;
  const BounceListView({super.key, this.padding, this.children = const []});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BounceScroll(),
      padding: padding ?? Ei.all(20),
      children: children,
    );
  }
}

class MyController {
  static Future<List<Map<String, dynamic>>> getProvince() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      {'id': 1, 'name': 'Bali'},
      {'id': 2, 'name': 'Jakarta'},
      {'id': 3, 'name': 'Bandung'},
      {'id': 4, 'name': 'Surabaya'},
      {'id': 5, 'name': 'Yogyakarta'},
    ];
  }
}
