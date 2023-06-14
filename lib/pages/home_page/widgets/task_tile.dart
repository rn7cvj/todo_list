import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:todo_list/constants.dart';
import '../../../controlles/task_list.dart';
import '../../../helper_functions.dart';
import '../../../models/task.dart';
import '../../../navigator.dart';

class TaskTile extends StatelessWidget {
  TaskTile({super.key, required this.task, required this.isFirst});

  final Task task;

  final bool isFirst;

  final Observable<double> iconExtraPadding = 0.0.obs();

  final TaskListContoller contoller = GetIt.I<TaskListContoller>();
  final NavigationManager navigationManager = GetIt.I<NavigationManager>();

  @override
  Widget build(BuildContext context) {
    Color backgroundColor =
        task.isComplited ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.inversePrimary;

    IconData backroundIcon = task.isComplited ? Icons.close : Icons.check;

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
          backgroundColor: backgroundColor,
          iconAligment: Alignment.centerLeft,
          iconData: backroundIcon,
          iconPadding: const EdgeInsets.only(left: appPaddingSmall),
          iconExtraPadding: iconExtraPadding,
        ),
        secondaryBackground: Background(
          isFirst: isFirst,
          backgroundColor: Theme.of(context).colorScheme.error,
          iconAligment: Alignment.centerRight,
          iconData: Icons.delete,
          iconPadding: const EdgeInsets.only(right: appPaddingSmall),
          iconExtraPadding: iconExtraPadding,
        ),
        child: Observer(
          builder: (context) => buildTaskTile(context),
        ),
      ),
    );
  }

  Widget buildTaskTile(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.bodyLarge!;
    TextStyle subtitleTextStyle = Theme.of(context).textTheme.bodyMedium!;

    if (task.isComplited) {
      textStyle = textStyle.copyWith(
        decoration: TextDecoration.lineThrough,
        color: textStyle.color!.withOpacity(0.4),
      );
      subtitleTextStyle = subtitleTextStyle.copyWith(
        color: textStyle.color!.withOpacity(0.4),
      );
    }

    Widget? subtitle =
        task.deadLine != null ? Text(formatDateTime(context, task.deadLine!), style: subtitleTextStyle) : null;

    MaterialStateProperty<Color> checkBoxColor = MaterialStateProperty.all(Theme.of(context).colorScheme.primary);

    if (task.importanceType == TaskImportanceTypes.Hight) {
      checkBoxColor = MaterialStateProperty.all(Theme.of(context).colorScheme.error);
    }

    ShapeBorder shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(isFirst ? appRoundRadiusMedium : 0),
        topRight: Radius.circular(isFirst ? appRoundRadiusMedium : 0),
      ),
    );

    return ListTile(
      shape: shape,
      contentPadding: const EdgeInsets.all(
        appPaddingSmall,
      ),
      onTap: () => navigationManager.openEditTaskPage(task.id),
      leading: Checkbox(
        activeColor: Colors.amberAccent,
        fillColor: checkBoxColor,
        value: task.isComplited,
        onChanged: (newVAlue) => contoller.toogleTaksComplitedStatus(task.id),
      ),
      title: Row(
        children: [
          buildImportanceIcon(context) ?? Container(),
          Flexible(
            child: Text(
              task.text,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: textStyle,
            ),
          ),
        ],
      ),
      subtitle: subtitle,
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
    required this.iconExtraPadding,
    required this.backgroundColor,
    required this.iconAligment,
    required this.iconData,
    required this.iconPadding,
  });

  final bool isFirst;
  final Color backgroundColor;
  final Alignment iconAligment;
  final IconData iconData;
  final Observable<double> iconExtraPadding;
  final EdgeInsets iconPadding;
  @override
  Widget build(BuildContext context) {
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
            // EdgeInsets iconAnimationPadding = dismissDirection == DismissDirection.startToEnd
            //     ? EdgeInsets.only(left: iconExtraPadding.value)
            //     : EdgeInsets.only(right: iconExtraPadding.value);

            return Padding(
              // padding: iconPadding.add(iconAnimationPadding),
              padding: iconPadding,
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
