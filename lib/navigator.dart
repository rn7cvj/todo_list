import 'package:flutter/material.dart';

import 'logger.dart';
import 'routes.dart';

class NavigationManager {
  final key = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => key.currentState!;

  void openAddTaskPage() {
    logger.i("Open add task page");
    _navigator.pushNamed(RouteNames.addTask);
  }

  void openEditTaskPage(String uid) {
    logger.i("Open edit task page , task uid = $uid");
    _navigator.pushNamed(RouteNames.editTask, arguments: uid);
  }

  void openSettingsPage() {
    logger.i("Open settings page");
    _navigator.pushNamed(RouteNames.settings);
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
