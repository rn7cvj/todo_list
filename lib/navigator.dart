import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'logger.dart';
import 'routes.dart';

class NavigationManager {
  // NavigationManager._();

  final key = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => key.currentState!;

  void openAddTaskPage() {
    logger.i("Open add task page");
    _navigator.pushNamed(RouteNames.addTask);
  }

  void openEditTaskPage(int id) {
    logger.i("Open edit task page , task id = $id");
    _navigator.pushNamed(RouteNames.editTask, arguments: id);
  }

  void pop() {
    logger.i("Pop page");
    _navigator.pop();
  }

  void popToHomePage() {
    logger.i("Pop to home page");
    _navigator.popUntil(ModalRoute.withName(RouteNames.taskList));
  }
}
