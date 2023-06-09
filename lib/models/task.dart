class Task {
  Task(this.text, this.deadLine, this.isComplited, this.ImportanceType);

  final String text;
  final DateTime? deadLine;
  final bool isComplited;

  final TaskImportanceTypes ImportanceType;
}

enum TaskImportanceTypes {
  Not,
  Low,
  Hight,
}
