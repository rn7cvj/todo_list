import 'package:flutter/material.dart';

import 'routes.dart';

class NavigationManager {
  // NavigationManager._();

  final key = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => key.currentState!;

  void openAddTask() {
    _navigator.pushNamed(RouteNames.addTask);
  }

  void pop() {
    _navigator.pop();
  }

  void popToHome() {
    _navigator.popUntil(ModalRoute.withName(RouteNames.taskList));
  }
}
