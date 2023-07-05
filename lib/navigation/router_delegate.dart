import 'package:flutter/material.dart';
import 'package:todo_list/pages/add_task_page/add_task_page.dart';
import 'package:todo_list/pages/edit_task_page/edit_task_page.dart';
import 'package:todo_list/pages/home_page/home_page.dart';
import 'package:todo_list/pages/home_page/widgets/task_list.dart';

import 'navigation_state.dart';

class MyRouterDelegate extends RouterDelegate<NavigationState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationState> {
  NavigationState? state;

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  MyRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        const MaterialPage(
          child: HomePage(),
        ),
        if (state?.isAddTask == true)
          const MaterialPage(
            child: AddTaskPage(),
          ),
        if (state?.isEditTask == true)
          MaterialPage(
            child: EditTaskPage(taskId: state!.editTaskId),
          ),
        if (state?.isUnknown == true)
          const MaterialPage(
            child: HomePage(),
          )
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        state = NavigationState.root();

        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(NavigationState configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }
}
