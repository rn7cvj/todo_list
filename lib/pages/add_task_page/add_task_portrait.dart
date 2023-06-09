import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_list/constants.dart';
import 'package:todo_list/helper_functions.dart';

import '../../controlles/task_list.dart';
import '../../i18n/strings.g.dart';
import '../../models/task.dart';
import '../../navigator.dart';

class AddTaskPortrait extends StatelessWidget {
  AddTaskPortrait({super.key});

  final TaskListContoller contoller = GetIt.I<TaskListContoller>();
  final NavigationManager navigationManager = GetIt.I<NavigationManager>();

  final List<DropdownMenuEntry> importanceEntries = TaskImportanceTypes.values
      .map((importance) =>
          DropdownMenuEntry(leadingIcon: Icon(importance.icon), label: importance.lable, value: importance))
      .toList();

  final TextEditingController whatToDoController = TextEditingController();
  final Observable<bool> haveDeadLine = false.obs();

  final Observable<DateTime?> deadLine = Observable<DateTime?>(null);

  final Observable<TaskImportanceTypes> importanceType = Observable<TaskImportanceTypes>(TaskImportanceTypes.not);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: navigationManager.popToHomePage,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: appPaddingSmall),
            child: TextButton(
              onPressed: saveNewTask,
              child: Text(
                t.common.save,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(appPaddingMedium),
                child: Column(
                  children: [
                    buildInputField(context),
                    buildImportanceSelector(context),
                    const Padding(
                      padding: EdgeInsets.only(top: appPaddingMedium, bottom: appPaddingMedium),
                      child: Divider(
                        height: 2,
                      ),
                    ),
                    AnimatedSize(
                      duration: Duration(milliseconds: 300),
                      child: buildDeadlineSelector(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(height: 2),
        ],
      ),
    );
  }

  Widget buildInputField(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: appPaddingMedium, bottom: appPaddingMedium),
      color: Theme.of(context).colorScheme.secondaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(appRoundRadiusMedium),
      ),
      elevation: appElevationSmall,
      child: Padding(
        padding: const EdgeInsets.all(appPaddingSmall),
        child: TextField(
          controller: whatToDoController,
          minLines: 4,
          maxLines: 1000,
          decoration: InputDecoration.collapsed(hintText: t.addtask.what_to_do),
        ),
      ),
    );
  }

  Widget buildImportanceSelector(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: appPaddingMedium, bottom: appPaddingMedium),
      child: Align(
        alignment: Alignment.centerLeft,
        child: DropdownMenu(
          label: Text(t.addtask.importance),
          initialSelection: importanceEntries.first.value,
          dropdownMenuEntries: importanceEntries,
          onSelected: (newImportance) => importanceType.value = newImportance,
        ),
      ),
    );
  }

  Widget buildDeadlineSelector(BuildContext context) {
    return Observer(builder: (context) {
      Future<void> Function()? onTap;

      if (haveDeadLine.value) {
        onTap = () async {
          DateTime? newDeadLine = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(3000),
          );
          runInAction(() => deadLine.value = newDeadLine);
        };
      }

      return ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(appRoundRadiusMedium),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: appPaddingSmall,
          vertical: appPaddingSmall,
        ),
        title: Text(
          t.addtask.deadline,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        onTap: onTap,
        trailing: Switch(
          value: haveDeadLine.value,
          onChanged: (newValue) => runInAction(
            () {
              if (!newValue) {
                deadLine.value = null;
              }
              haveDeadLine.value = newValue;
            },
          ),
        ),
        subtitle: buildDeadlineViewer(context),
      );
    });
  }

  Widget buildDeadlineViewer(BuildContext context) {
    if (!haveDeadLine.value) return Container();

    String deadLineText = deadLine.value != null ? formatDateTime(context, deadLine.value!) : t.addtask.select_deadline;

    return Text(
      deadLineText,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.primary),
    );
  }

  void saveNewTask() {
    contoller.addNewTaskByDetails(whatToDoController.text, deadLine.value, importanceType.value);
    navigationManager.popToHomePage();
  }
}
