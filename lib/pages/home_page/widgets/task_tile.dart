import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:todo_list/constants.dart';
import '../../../controlles/task_list.dart';
import '../../../helper_functions.dart';

import '../../../modals/task.dart';
import '../../../navigator.dart';

class TaskTile extends StatelessWidget {
  TaskTile({super.key, required this.task, required this.isFirst});

  final Task task;

  //Определяет, является ли карточка первой
  final bool isFirst;

  final Observable<double> iconExtraPadding = 0.0.obs();

  final TaskListContoller contoller = GetIt.I<TaskListContoller>();
  final NavigationManager navigationManager = GetIt.I<NavigationManager>();

  @override
  Widget build(BuildContext context) {
    //Не даёт таску вылезать за пределы карточки при свайпе
    return ClipRRect(
      child: Dismissible(
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.startToEnd) {
            Timer(animationDurationFast, () => contoller.toogleTaksComplitedStatus(task.id));
            return !contoller.isComplitedTaskVisible;
          }

          return true;
        },
        key: UniqueKey(),
        dismissThresholds: const {
          DismissDirection.startToEnd: 0.4,
          DismissDirection.endToStart: 0.4,
        },
        onDismissed: (direction) {
          //dont ask. I forbid you.
          // if (direction == DismissDirection.startToEnd) contoller.toogleTaksComplitedStatus(task.id);
          if (direction == DismissDirection.endToStart) contoller.deleteTask(task.id);
        },
        onUpdate: (details) {
          runInAction(() => iconExtraPadding.value = details.progress);
        },
        background: Observer(
          builder: (context) {
            Color backgroundColor =
                task.done ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.inversePrimary;

            IconData backroundIcon = task.done ? Icons.close : Icons.check;
            //Билдер фона для свайпа вправо
            return Background(
              isFirst: isFirst,
              backgroundColor: backgroundColor,
              iconAligment: Alignment.centerLeft,
              iconData: backroundIcon,
              iconPadding: const EdgeInsets.only(left: appPaddingSmall),
              iconExtraPadding: iconExtraPadding,
            );
          },
        ),
        //Билдер фона для свайпа вправо
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

    //Если таск отмечен как выполненный, то делаем это 🌚🌚🌚
    if (task.done) {
      textStyle = textStyle.copyWith(
        decoration: TextDecoration.lineThrough,
        color: textStyle.color!.withOpacity(0.4),
      );
      subtitleTextStyle = subtitleTextStyle.copyWith(
        color: textStyle.color!.withOpacity(0.4),
      );
    }

    Widget? subtitle =
        task.deadline != null ? Text(formatDateTime(context, task.deadline!), style: subtitleTextStyle) : null;

    MaterialStateProperty<Color> checkBoxColor = MaterialStateProperty.all(Theme.of(context).colorScheme.primary);

    if (task.importance == TaskImportanceTypes.important) {
      checkBoxColor = MaterialStateProperty.all(Theme.of(context).colorScheme.error);
    }

    // Закругления, если карточка первая
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
        value: task.done,
        onChanged: (newVAlue) => contoller.toogleTaksComplitedStatus(task.id),
      ),
      title: Row(
        children: [
          buildImportanceIcon(context) ?? Container(),
          Flexible(
            child: Text(
              task.text!,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: textStyle,
            ),
          ),
        ],
      ),
      subtitle: subtitle,
      trailing: IconButton(
        onPressed: () => navigationManager.openEditTaskPage(task.id),
        icon: const Icon(Icons.info_outline),
      ),
    );
  }

  Widget? buildImportanceIcon(BuildContext context) {
    if (task.importance.icon == null) return null;
    return Padding(
      padding: const EdgeInsets.only(right: appPaddingSmall),
      child: Icon(
        task.importance.icon,
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
            // Это для динамического перемещения иконки. В итоге не используется
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
