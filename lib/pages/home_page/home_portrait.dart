import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/constants.dart';
import 'package:todo_list/controlles/task_list.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/pages/home_page/widgets/task_tile.dart';

import '../../i18n/strings.g.dart';
import '../../navigator.dart';

class HomePortrait extends StatelessWidget {
  HomePortrait({super.key});

  final TaskListContoller contoller = GetIt.I<TaskListContoller>();
  final NavigationManager navigationManager = GetIt.I<NavigationManager>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.home.my_task),
        actions: [
          IconButton(
            onPressed: contoller.toogleComplitedTaskVisibilty,
            icon: Observer(
              builder: (context) => Icon(
                contoller.isComplitedTaskVisible ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Observer(
              builder: (context) => buildMainContent(context, contoller.getTasks),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigationManager.openAddTask,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildMainContent(BuildContext context, List<Task> tasks) {
    List<Widget> taskTiles = [];

    if (tasks.isNotEmpty) {
      // ignore: unnecessary_cast
      taskTiles.add(TaskTile(task: tasks.first, isFirst: true) as Widget);
    }

    // Тут нужен этот каст иначе не получается добавить кнопку новое которая внизу
    // ignore: unnecessary_cast
    taskTiles.addAll(tasks.sublist(1).map((task) => TaskTile(
          task: task,
          isFirst: false,
        ) as Widget));

    taskTiles.add(buildAddNewTaskButton(context, tasks.isEmpty));

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(appRoundRadiusMedium)),
      margin: const EdgeInsets.all(appMargingMedium),
      child: Column(children: taskTiles),
    );
  }

  Widget buildAddNewTaskButton(BuildContext context, bool isTasksListEmpty) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: isTasksListEmpty
            ? BorderRadius.circular(appRoundRadiusMedium)
            : const BorderRadius.only(
                bottomLeft: Radius.circular(appElevationMedium),
                bottomRight: Radius.circular(appElevationMedium),
              ),
      ),
      onTap: navigationManager.openAddTask,
      title: Text(t.common.add_new),
      leading: const Icon(Icons.add),
    );
  }

  // Old code
  // Widget buildAddNewTaskButtonInkWell(BuildContext context) {
  //   return InkWell(
  //     borderRadius: const BorderRadius.only(
  //       bottomLeft: Radius.circular(appRoundRadiusMedium),
  //       bottomRight: Radius.circular(appRoundRadiusMedium),
  //     ),
  //     onTap: navigationManager.openAddTask,
  //     child: Container(
  //       // 56 - это размеры чек бокса, почему не спрашивайте
  //       padding: const EdgeInsets.only(
  //         left: 56,
  //         top: appElevationMedium,
  //         bottom: appElevationMedium + appPaddingSmall,
  //       ),
  //       color: Colors.transparent,
  //       width: double.infinity,
  //       child: Text(t.common.add_new),
  //     ),
  //   );
  // }
}
