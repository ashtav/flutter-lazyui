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
      String text = "<b>bold</b> <test>hello</test> <i>italic</i>";
      List<String> allowed = ["b", "i", '/b', '/i'];

      // Generate a regular expression pattern to match all HTML tags except the allowed ones
      String pattern = "(</?(?!(${allowed.join('|')})\\b)[^>]+>)";

      // Replace all non-allowed HTML tags with an empty string
      String filteredText = text.replaceAllMapped(RegExp(pattern), (match) => '');

      logg(filteredText); // "<b>bold</b> hello <i>italic</i>"
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
              ),
              Text(355003.idr(separator: ','))
            ],
          ),
        ));
  }
}
