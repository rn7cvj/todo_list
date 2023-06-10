import 'package:flutter/material.dart';
import 'package:todo_list/constants.dart';
import 'package:todo_list/helper_functions.dart';

import '../../i18n/strings.g.dart';
import '../../models/task.dart';

class AddTaskPortrait extends StatelessWidget {
  AddTaskPortrait({super.key});

  final List<DropdownMenuEntry> importanceEntries = [
    DropdownMenuEntry(label: t.addtask.importance_no, value: TaskImportanceTypes.Not),
    DropdownMenuEntry(label: t.addtask.importance_low, value: TaskImportanceTypes.Low),
    DropdownMenuEntry(label: t.addtask.importance_High, value: TaskImportanceTypes.Hight),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: appPaddingSmall),
            child: TextButton(
              onPressed: () {},
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
    return Row(children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.addtask.deadline,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(appRoundRadiusMedium),
              onTap: () async {
                DateTime? newDeadLine = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(3000),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: appPaddingSmall, bottom: appPaddingSmall),
                child: Text(
                  formatDateTime(context, DateTime.now()),
                  style:
                      Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            )
          ],
        ),
      ),
      Align(alignment: Alignment.topRight, child: Switch(value: false, onChanged: (newValue) {})),
    ]);
  }
}
