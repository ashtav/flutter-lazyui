import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

final form = TEC.make(['name']);

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Future<String> login(String value) async {
      await Future.delayed(2.s);
      return value;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test View'),
        actions: [
          IconButton(
            icon: const Icon(Ti.check),
            onPressed: () {
              LzPad.show(context);
            },
          )
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: Maa.center,
        children: [
          LzTextField(
            hint: 'Enter your name',
            prefixIcon: const Icon(Ti.user),
            controller: form['name'],
          ),

          Touch(
            onTap: (){
              logg('ok');
            }, hoverable: true,
            child: Textr('Hello world', padding: Ei.all(20),))
        ],
      )).padding(all: 20),
      bottomNavigationBar: LzButton(
        text: 'Login',
        onTap: (state) async {
          // final resx = await state.submit(future: login);
          // logg(res);

          final res = await LzToast.overlay('Logging in...', future: () => login('test'));
          logg(res);
        },
      ).padding(all: 20),
    );
  }
}
