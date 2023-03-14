import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class UserModel {
  int? id;
  String? name;

  UserModel({this.id, this.name});

  // fromJson
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  // toJson
  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}

int? x;

void testx(List v, dynamic value) {
  for (var i = 0; i < v.length; i++) {
    v[i] = value;
  }
}

class ActionController {
  dynamic a = '';

  String? x, y;

  final forms = Forms.create(['x', 'y']);

  void test() async {
    try {
      LzToast.overlay('Please wait for a moment, we are processing your request...');

      Utils.timer(() {
        LzToast.dismiss();
      }, 5.s);
    } catch (e, s) {
      Errors.check(e, s, useList: true);
    }
  }
}

class ErrorHandlerView extends StatelessWidget {
  const ErrorHandlerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Error Handler'),
            centerTitle: true,
          ),
          body: ListView(
            physics: BounceScroll(),
            padding: Ei.all(20),
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: Maa.center,
                  children: [
                    LzButton(
                        text: 'Toast Overlay',
                        onTap: (_) {
                          LzToast.overlay('Please wait for a moment, we are processing your request...');

                          Utils.timer(() {
                            LzToast.dismiss();
                            // LzToast.show('Failed to request');
                          }, 5.s);
                        }).dark().margin(all: 5),
                    LzButton(text: 'Toast with Icon', onTap: (_) => LzToast.show('Toast message with an icon', icon: La.infoCircle)).margin(all: 5),
                    LzButton(text: 'Toast Top', onTap: (_) => LzToast.show('This message in top position', position: LzToastPosition.top))
                        .margin(all: 5),
                    LzButton(text: 'Toast Center', onTap: (_) => LzToast.show('This message in center position', position: LzToastPosition.center))
                        .margin(all: 5),
                    LzButton(text: 'Toast Bottom', onTap: (_) => LzToast.show('This message in bottom position')).margin(all: 5),
                    LzButton(text: 'Long Toast Message', onTap: (_) => LzToast.show(Faker.random(15))).margin(all: 5),
                    LzButton(text: '5 Seconds', onTap: (_) => LzToast.show('Hello this is 5 seconds', duration: 5.s)).margin(all: 5),
                    LzForm.input(hint: 'Put your name here').margin(t: 25)
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
