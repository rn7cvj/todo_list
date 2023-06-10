class Task {
  Task(this.id, this.text, this.deadLine, this.isComplited, this.importanceType);

  final int id;

  final String text;
  final DateTime? deadLine;
  bool isComplited;

  final TaskImportanceTypes importanceType;
}

enum TaskImportanceTypes {
  Not,
  Low,
  Hight,
}
