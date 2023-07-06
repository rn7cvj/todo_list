import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:shimmer_effect/shimmer_effect.dart';

import '../../../controlles/task_list.dart';
import '../../../i18n/strings.g.dart';
import '../../../modals/task.dart';
import '../../../navigation/router_delegate.dart';

class AddTaskButton extends StatelessWidget {
  AddTaskButton({super.key, required this.whatToDoController, required this.deadLine, required this.importanceType});

  final TaskListContoller contoller = GetIt.I<TaskListContoller>();

  final IRouter navigationManager = GetIt.I<IRouter>();

  final TextEditingController whatToDoController;
  final Observable<DateTime?> deadLine;
  final Observable<TaskImportanceTypes> importanceType;

  final Observable<bool> isSyncing = Observable<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (isSyncing.value) {
          return ShimmerEffect(
            baseColor: Theme.of(context).colorScheme.primary,
            highlightColor: Theme.of(context).colorScheme.onPrimary,
            child: Text(
              t.common.syncing,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          );
        }

        return TextButton(
          onPressed: editTask,
          child: Text(
            t.common.save,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        );
      },
    );
  }

  Future<void> editTask() async {
    runInAction(() => isSyncing.value = true);
    await contoller.addNewTaskByDetails(whatToDoController.text, deadLine.value, importanceType.value);
    navigationManager.popToHomePage();
  }
}
