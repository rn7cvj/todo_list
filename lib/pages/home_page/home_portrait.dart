import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/api/api.dart';
import 'package:todo_list/constants.dart';
import 'package:todo_list/controlles/task_list.dart';
import 'package:todo_list/logger.dart';
import 'package:todo_list/navigation/router_delegate.dart';
import 'package:todo_list/pages/home_page/widgets/new_task_button.dart';
import 'package:todo_list/pages/home_page/widgets/task_list.dart';

import '../../i18n/strings.g.dart';
import 'widgets/home_appbar.dart';

class HomePortrait extends StatelessWidget {
  HomePortrait({super.key});

  //Получение экземпляров контроллеров
  final TaskListContoller contoller = GetIt.I<TaskListContoller>();
  final IRouter navigationManager = GetIt.I<IRouter>();

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    logger.i("Build Home page");

    contoller.setOnErrorHandler(
      (error) {
        if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.lable)));
      },
    );

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          var status = await contoller.tryToSync();
          if (status && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(t.messages.connection_restore)));
          }
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: scrollController,
          slivers: [
            HomeAppBar(scrollController: scrollController),
            SliverToBoxAdapter(
              child: Card(
                //Переопределение скруглений для идентичности
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(appRoundRadiusMedium)),
                //Анал огично
                margin: const EdgeInsets.all(appMargingMedium),
                child: Column(
                  children: [
                    //Перерисовывает виджет при изменении наблюдаемой переменной
                    Observer(
                      builder: (context) => TaskList(tasks: contoller.getTasks),
                    ),
                    NewTaskButton(isTasksListEmpty: true)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigationManager.openAddTaskPage,
        child: const Icon(Icons.add),
      ),
    );
  }
}
