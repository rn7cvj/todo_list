import 'package:flutter/material.dart';
import 'package:todo_list/constants.dart';

import '../../i18n/strings.g.dart';

class AddTaskPortrait extends StatelessWidget {
  const AddTaskPortrait({super.key});

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
          Card(
            margin: const EdgeInsets.all(appPaddingMedium),
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(appPaddingMedium),
              child: TextField(
                minLines: 4,
                maxLines: 1000,
                decoration: InputDecoration.collapsed(hintText: t.addtask.what_to_do),
              ),
            ),
          ),
          DropdownMenu(
            dropdownMenuEntries: [],
          )
        ],
      ),
    );
  }
}
