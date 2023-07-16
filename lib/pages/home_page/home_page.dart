import 'package:flutter/material.dart';
import 'package:todo_list/pages/home_page/home_landscape.dart';
import 'package:todo_list/pages/home_page/home_portrait.dart';
import 'package:todo_list/pages/orintaion_page.dart';

//Здесь предполагается переключение между десктопной/ и мобильной версиями
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationPage(landscapePage: HomeLandscape(), portraitPage: HomePortrait());
  }
}
