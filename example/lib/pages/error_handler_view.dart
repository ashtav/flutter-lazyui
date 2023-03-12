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
      LazyLoading.overlay(message: 'Please wait for a moment, we are processing your request...');

      Utils.timer(() {
        LazyLoading.dismiss();
      }, 5000);
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
          body: Center(
            child: Column(
              mainAxisAlignment: Maa.center,
              children: [
                Button(
                  onTap: () {
                    LazyLoading.overlay(message: 'Please wait for a moment, we are processing your request...');

                    Utils.timer(() {
                      LazyLoading.dismiss();
                    }, 5000);
                  },
                  text: 'Overlay',
                  margin: Ei.only(b: 15),
                ),
                Button(
                  onTap: () {
                    LazyLoading.show(message: 'Failed to request');
                  },
                  text: 'Toast Show',
                  margin: Ei.only(b: 15),
                ),
                LzForm.input(hint: 'Put your name here').margin(t: 25)
              ],
            ),
          )),
    );
  }
}
