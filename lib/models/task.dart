import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../i18n/strings.g.dart';

part 'task.g.dart';

class Task = TaskStore with _$Task;

abstract class TaskStore with Store {
  TaskStore(this.id, this.text, this.deadLine, this.isComplited, this.importanceType);

  final int id;

  @observable
  String text;

  @observable
  DateTime? deadLine;

  @observable
  bool isComplited;

  @observable
  TaskImportanceTypes importanceType;
}

enum TaskImportanceTypes {
  not,
  low,
  hight,
}

extension TaskImportanceTypesExtension on TaskImportanceTypes {
  String get lable {
    switch (this) {
      case TaskImportanceTypes.not:
        return t.addtask.importance_no;

      case TaskImportanceTypes.low:
        return t.addtask.importance_low;

      case TaskImportanceTypes.hight:
        return t.addtask.importance_high;

      default:
        return "";
    }
  }

  IconData? get icon {
    switch (this) {
      case TaskImportanceTypes.not:
        return null;

      case TaskImportanceTypes.low:
        return Icons.arrow_downward;

      case TaskImportanceTypes.hight:
        return Icons.warning_amber;

      default:
        return null;
    }
  }
}
