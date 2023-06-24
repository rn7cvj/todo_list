import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:shimmer_effect/shimmer_effect.dart';
import 'package:todo_list/constants.dart';

import '../../../controlles/task_list.dart';
import '../../../i18n/strings.g.dart';
import '../../../navigator.dart';

class DeleteTaskButton extends StatelessWidget {
  DeleteTaskButton({super.key, required this.taskUid});

  final String taskUid;

  final TaskListContoller contoller = GetIt.I<TaskListContoller>();
  final NavigationManager navigationManager = GetIt.I<NavigationManager>();

  final Observable<bool> isSyncing = Observable<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (isSyncing.value) {
          return ShimmerEffect(
            baseColor: Theme.of(context).colorScheme.primary,
            highlightColor: Theme.of(context).colorScheme.onPrimary,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: appPaddingMedium, horizontal: appPaddingSmall),
              child: Row(
                children: [
                  const Icon(Icons.sync),
                  const SizedBox(width: appPaddingSmall),
                  Text(
                    t.common.syncing,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          );
        }

        return InkWell(
          borderRadius: BorderRadius.circular(appRoundRadiusMedium),
          onTap: deleteTask,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: appPaddingMedium, horizontal: appPaddingSmall),
            child: Row(
              children: [
                Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.error,
                ),
                const SizedBox(
                  width: appPaddingSmall,
                ),
                Text(
                  t.common.delete,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.error),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> deleteTask() async {
    runInAction(() => isSyncing.value = true);
    await contoller.deleteTask(taskUid);

    navigationManager.popToHomePage();
  }
}
