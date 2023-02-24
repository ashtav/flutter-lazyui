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

class ActionController {
  dynamic a = '';

  void test() async {
    try {
      a++;
    } catch (e, s) {
      Errors.check(e, s, useList: true);
    }
  }
}

class ErrorHandlerView extends StatelessWidget {
  const ErrorHandlerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  ActionController().test();
                },
                text: 'Test Error',
              )
            ],
          ),
        ));
  }
}
