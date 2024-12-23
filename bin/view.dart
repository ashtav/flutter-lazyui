import 'dart:io';

import 'utils.dart';

void main(List<String> args) {
  if (args.isNotEmpty) {
    String path = args[args.indexWhere((e) => e.contains('-'))].replaceAll('-', '');
    String filename = args[args.indexWhere((e) => !e.contains('-'))];

    String content = '''
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class ${camelize(filename)}View extends StatelessWidget {
  const ${camelize(filename)}View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('${camelize(filename)}'),
      ),
      body: ListView(
        children: [
          
        ],
      ),
    );
  }
}
''';

    // write the content to the .dart file
    File file = File('lib/$path/${filename}_view.dart');
    file.writeAsStringSync(content);
  }
}
