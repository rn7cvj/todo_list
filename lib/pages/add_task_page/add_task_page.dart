import 'package:flutter/material.dart';
import 'package:todo_list/pages/add_task_page/add_task_portrait.dart';

//Здесь предполагается переключение между десктопной/ и мобильной версиями
class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AddTaskPortrait();
  }
}
