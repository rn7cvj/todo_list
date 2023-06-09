import 'package:flutter/material.dart';
import 'package:todo_list/pages/home_page/home_page.dart';

import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
