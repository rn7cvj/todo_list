import 'package:flutter/material.dart';
import 'package:todo_list/pages/home_page/home_portrait.dart';

//Здесь предполагается переключение между десктопной/ и мобильной версиями
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePortrait();
  }
}
