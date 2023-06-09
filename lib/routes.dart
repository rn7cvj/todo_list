import 'package:flutter/material.dart';
import 'package:todo_list/pages/add_task_page/add_task_page.dart';
import 'package:todo_list/pages/edit_task_page/edit_task_page.dart';

import 'pages/home_page/home_page.dart';

abstract class RouteNames {
  const RouteNames._();

  static const initialRoute = taskList;

  static const taskList = '/taskList';
  static const addTask = '/addTask';
  static const editTask = '/editTask';
}

abstract class RoutesBuilder {
  const RoutesBuilder._();

  static final routes = <String, Widget Function(BuildContext)>{
    RouteNames.taskList: (_) => const HomePage(),
    RouteNames.addTask: (_) => const AddTaskPage(),
    RouteNames.editTask: (context) => EditTaskPage(taskId: ModalRoute.of(context)?.settings.arguments as int),
  };

  static Route<Object?>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.taskList:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: settings,
        );

      case RouteNames.addTask:
        return MaterialPageRoute(
          builder: (_) => const AddTaskPage(),
          settings: settings,
        );
      case RouteNames.editTask:
        return MaterialPageRoute(
          builder: (_) => EditTaskPage(
            taskId: settings.arguments as int,
          ),
          settings: settings,
        );
    }

    return null;
  }

  static Route<Object?>? onUnknownRoute<T>(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const HomePage(),
      settings: settings,
    );
  }

  static List<Route<Object?>> onGenerateInitialRoutes(String initialRoutes) {
    final routes = <Route>[];

    if (initialRoutes.isEmpty || !initialRoutes.startsWith('/')) {
      print('invalid initialRoutes ($initialRoutes)');
    } else {
      final names = initialRoutes.substring(1).split('/');
      for (final name in names) {
        final route = onGenerateRoute(
          RouteSettings(name: '/$name'),
        );
        if (route != null) {
          routes.add(route);
        } else {
          routes.clear();
          break;
        }
      }
    }

    if (routes.isEmpty) {
      print('generated empty initial routes ($initialRoutes)');
      routes.add(
        onGenerateRoute(const RouteSettings(name: RouteNames.taskList))!,
      );
    }

    return routes;
  }
}
