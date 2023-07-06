import 'package:todo_list/modals/task.dart';
import 'package:uuid/uuid.dart';

final now = DateTime.now();

final emptyList = <Task>[];

final InitList = [
  Task("1", "text", TaskImportanceTypes.basic, true, now, now, "123"),
  Task("2", "text", TaskImportanceTypes.basic, true, now, now, "123"),
  Task("3", "text", TaskImportanceTypes.basic, true, now, now, "123"),
];

Task editTask = Task("1", "editText", TaskImportanceTypes.basic, true, now, now, "123");

final removedList = [
  Task("2", "text", TaskImportanceTypes.basic, true, now, now, "123"),
  Task("3", "text", TaskImportanceTypes.basic, true, now, now, "123"),
];
