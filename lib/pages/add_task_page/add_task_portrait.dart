import 'dart:ui';

import 'package:flutter/foundation.dart';
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
      .map((importance) => DropdownMenuEntry(label: importance.lable, value: importance))
      .toList();

  final TextEditingController whatToDoController = TextEditingController();
  final Observable<bool> haveDeadLine = false.obs();

  final Observable<DateTime?> deadLine = Observable<DateTime?>(null);

  final Observable<TaskImportanceTypes> importanceType = Observable<TaskImportanceTypes>(TaskImportanceTypes.Not);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: navigationManager.popToHome,
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
                    buildDeadlineSelector(context),
                  ],
                ),
              ),
            ),
          ),
          const Divider(height: 2),
          Padding(
            padding: const EdgeInsets.only(top: appElevationSmall, bottom: appElevationSmall),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(onPressed: () {}, icon: Icon(Icons.delete), label: Text(t.common.delete)),
            ),
          )
        ],
      ),
    );
  }

  Widget buildInputField(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: appPaddingMedium, bottom: appPaddingMedium),
      color: Theme.of(context).colorScheme.secondaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(appElevationMedium)),
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
          onSelected: (newImportance) {},
        ),
      ),
    );
  }

  Widget buildDeadlineSelector(BuildContext context) {
    return Observer(
      builder: (context) => SwitchListTile(
        visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(appRoundRadiusMedium),
        ),
        title: Padding(
          padding: EdgeInsets.all(haveDeadLine.value ? 8.0 : 0.0),
          child: Text(
            t.addtask.deadline,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        subtitle: buildDeadlineViewer(context),
        value: haveDeadLine.value,
        onChanged: (newValue) => runInAction(() => haveDeadLine.value = newValue),
      ),
    );
  }

  Widget? buildDeadlineViewer(BuildContext context) {
    if (!haveDeadLine.value) return null;

    String deadLineText = deadLine.value != null ? formatDateTime(context, deadLine.value!) : t.addtask.select_deadline;

    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () async {
          DateTime? newDeadLine = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(3000),
          );
          runInAction(() => deadLine.value = newDeadLine);
        },
        child: Text(
          deadLineText,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }

  void saveNewTask() {
    contoller.addNewTaskByDetails(whatToDoController.text, deadLine.value, importanceType.value);
    navigationManager.popToHome();
  }
}
