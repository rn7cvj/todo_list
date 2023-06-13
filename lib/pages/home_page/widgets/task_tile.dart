import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:todo_list/constants.dart';
import '../../../controlles/task_list.dart';
import '../../../helper_functions.dart';
import '../../../models/task.dart';

class TaskTile extends StatelessWidget {
  TaskTile({super.key, required this.task, required this.isFirst});

  final Task task;

  final bool isFirst;

  final Observable<double> iconExtraPadding = 0.0.obs();

  final TaskListContoller contoller = GetIt.I<TaskListContoller>();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Dismissible(
        confirmDismiss: (direction) async =>
            direction == DismissDirection.endToStart || !contoller.isComplitedTaskVisible,
        key: UniqueKey(),
        dismissThresholds: const {
          DismissDirection.startToEnd: 0.4,
          DismissDirection.endToStart: 0.4,
        },
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd) contoller.toogleTaksComplitedStatus(task.id);
          if (direction == DismissDirection.endToStart) contoller.deleteTask(task.id);
        },
        onUpdate: (details) {
          if (contoller.isComplitedTaskVisible && details.direction == DismissDirection.startToEnd && details.reached) {
            contoller.markTaskAsComplited(task.id);
          }
          runInAction(() => iconExtraPadding.value = details.progress);
        },
        background: Background(
          isFirst: isFirst,
          dismissDirection: DismissDirection.startToEnd,
          iconExtraPadding: iconExtraPadding,
        ),
        secondaryBackground: Background(
          isFirst: isFirst,
          dismissDirection: DismissDirection.endToStart,
          iconExtraPadding: iconExtraPadding,
        ),
        child: Observer(
          builder: (context) => buildTaskTile(context),
        ),
      ),
    );
  }

  Widget buildTaskTile(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(top: isFirst ? appElevationSmall : 0.0),
      // isThreeLine: true,
      visualDensity: VisualDensity.compact,
      leading: Checkbox(
        value: task.isComplited,
        onChanged: (newVAlue) {
          contoller.toogleTaksComplitedStatus(task.id);
        },
      ),
      title: Row(
        children: [
          buildImportanceIcon(context) ?? Container(),
          Text(
            task.text,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      subtitle: task.deadLine != null ? Text(formatDateTime(context, task.deadLine!)) : null,
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.info_outline),
      ),
    );
  }

  Widget? buildImportanceIcon(BuildContext context) {
    if (task.importanceType.icon == null) return null;
    return Padding(
      padding: const EdgeInsets.only(right: appPaddingSmall),
      child: Icon(
        task.importanceType.icon,
        size: Theme.of(context).textTheme.bodyMedium!.fontSize,
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    super.key,
    required this.isFirst,
    required this.dismissDirection,
    required this.iconExtraPadding,
  });

  final bool isFirst;
  final DismissDirection dismissDirection;
  final Observable<double> iconExtraPadding;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = dismissDirection == DismissDirection.startToEnd
        ? Theme.of(context).colorScheme.secondary
        : Theme.of(context).colorScheme.error;

    Alignment iconAligment =
        dismissDirection == DismissDirection.startToEnd ? Alignment.centerLeft : Alignment.centerRight;

    IconData iconData = dismissDirection == DismissDirection.startToEnd ? Icons.check : Icons.delete;

    EdgeInsets iconPadding = dismissDirection == DismissDirection.startToEnd
        ? const EdgeInsets.only(left: appPaddingLarge)
        : const EdgeInsets.only(right: appPaddingLarge);

    return Container(
      decoration: BoxDecoration(
        borderRadius: isFirst
            ? const BorderRadius.only(
                topLeft: Radius.circular(appRoundRadiusMedium),
                topRight: Radius.circular(appRoundRadiusMedium),
              )
            : null,
        color: backgroundColor,
      ),
      // width: double.infinity,
      child: Align(
        alignment: iconAligment,
        child: Observer(
          builder: (_) {
            EdgeInsets iconAnimationPadding = dismissDirection == DismissDirection.startToEnd
                ? EdgeInsets.only(left: iconExtraPadding.value)
                : EdgeInsets.only(right: iconExtraPadding.value);

            return Padding(
              padding: iconPadding.add(iconAnimationPadding),
              child: Icon(
                iconData,
                color: Theme.of(context).colorScheme.onError,
              ),
            );
          },
        ),
      ),
    );
  }
}
