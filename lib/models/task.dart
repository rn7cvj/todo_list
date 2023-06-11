import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../i18n/strings.g.dart';

part 'task.g.dart';

// ignore: library_private_types_in_public_api
class Task = _Task with _$Task;

abstract class _Task with Store {
  _Task(this.id, this.text, this.deadLine, this.isComplited, this.importanceType);

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
  Not,

  Low,
  Hight,
}

extension TaskImportanceTypesExtension on TaskImportanceTypes {
  String get lable {
    switch (this) {
      case TaskImportanceTypes.Not:
        return t.addtask.importance_no;

      case TaskImportanceTypes.Low:
        return t.addtask.importance_low;

      case TaskImportanceTypes.Hight:
        return t.addtask.importance_high;

      default:
        return "";
    }
  }

  IconData? get icon {
    switch (this) {
      case TaskImportanceTypes.Not:
        return null;

      case TaskImportanceTypes.Low:
        return Icons.arrow_downward;

      case TaskImportanceTypes.Hight:
        return Icons.warning_amber;

      default:
        return null;
    }
  }
}
