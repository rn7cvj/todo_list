import 'package:flutter/material.dart';

import 'routes.dart';

class NavigationManager {
  // NavigationManager._();

  final key = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => key.currentState!;

  void openAddTaskPage() {
    _navigator.pushNamed(RouteNames.addTask);
  }

  void openEditTaskPage(int id) {
    _navigator.pushNamed(RouteNames.editTask, arguments: id);
  }

  void pop() {
    _navigator.pop();
  }

  void popToHomePage() {
    _navigator.popUntil(ModalRoute.withName(RouteNames.taskList));
  }
}
