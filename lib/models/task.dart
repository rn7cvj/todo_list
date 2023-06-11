import 'package:mobx/mobx.dart';

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
