import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/constants.dart';
import 'package:todo_list/controlles/task_list.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/pages/home_page/widgets/task_tile.dart';

import '../../i18n/strings.g.dart';
import '../../navigator.dart';
import 'widgets/home_appbar.dart';

class HomePortrait extends StatelessWidget {
  HomePortrait({super.key});

  final TaskListContoller contoller = GetIt.I<TaskListContoller>();
  final NavigationManager navigationManager = GetIt.I<NavigationManager>();

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          HomeAppBar(scrollController: scrollController),
          SliverToBoxAdapter(
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(appRoundRadiusMedium)),
              margin: const EdgeInsets.all(appMargingMedium),
              child: Column(
                children: [
                  Observer(
                    builder: (context) => buildTaskList(context, contoller.getTasks),
                  ),
                  buildAddNewTaskButton(context, true)
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigationManager.openAddTaskPage,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildTaskList(BuildContext context, List<Task> tasks) {
    List<Widget> tiles = [];

    if (tasks.isNotEmpty) {
      // ignore: unnecessary_cast
      tiles.add(TaskTile(task: tasks.first, isFirst: true) as Widget);
    }

    if (tasks.length > 1) {
      // Тут нужен этот каст иначе не получается добавить кнопку новое которая внизу
      // ignore: unnecessary_cast
      tiles.addAll(tasks.sublist(1).map((task) => TaskTile(
            task: task,
            isFirst: false,
          ) as Widget));
    }

    if (tasks.isNotEmpty) {
      tiles.add(const Divider(
        indent: appPaddingMedium,
        endIndent: appPaddingMedium,
        height: 0,
      ));
    }

    return AnimatedSize(
      alignment: Alignment.topCenter,
      duration: const Duration(milliseconds: 200),
      child: Column(
        children: tiles,
      ),
    );
  }

  Widget buildAddNewTaskButton(BuildContext context, bool isTasksListEmpty) {
    ShapeBorder shape = RoundedRectangleBorder(
      borderRadius: isTasksListEmpty
          ? BorderRadius.circular(appRoundRadiusMedium)
          : const BorderRadius.only(
              bottomLeft: Radius.circular(appElevationMedium),
              bottomRight: Radius.circular(appElevationMedium),
            ),
    );

    return ListTile(
      contentPadding: const EdgeInsets.only(
        left: appPaddingSmall,
        right: appPaddingSmall,
      ),
      shape: shape,
      onTap: navigationManager.openAddTaskPage,
      title: Text(t.common.add_new),
      // Чтобы плючик был на уровне с чебоксами подвибрал на глаз
      leading: const Padding(
        padding: EdgeInsets.all(13),
        child: Icon(Icons.add),
      ),
    );
  }
}
