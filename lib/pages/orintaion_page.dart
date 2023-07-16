import 'package:flutter/material.dart';
import 'package:todo_list/pages/home_page/home_landscape.dart';
import 'package:todo_list/pages/home_page/home_portrait.dart';

class OrientationPage extends StatelessWidget {
  const OrientationPage({super.key, required this.landscapePage, required this.portraitPage});

  final Widget landscapePage;
  final Widget portraitPage;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.sizeOf(context).width > 600 && MediaQuery.of(context).orientation == Orientation.landscape) {
      return landscapePage;
    }

    return portraitPage;
  }
}
