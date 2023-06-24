import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';
import '../helper_functions.dart';
import '../i18n/strings.g.dart';

part 'task.g.dart';

@JsonSerializable()
class Task extends TaskStore with _$Task {
  Task(
    String id,
    String text,
    TaskImportanceTypes importance,
    bool done,
    DateTime created_at,
    DateTime changed_at,
    String last_updated_by, {
    DateTime? deadline,
    String? hexColor,
  }) : super(
          id,
          text,
          importance,
          deadline,
          done,
          created_at,
          changed_at,
          last_updated_by,
          hexColor,
        );

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

abstract class TaskStore with Store {
  TaskStore(this.id, this.text, this.importance, this.deadline, this.done, this.created_at, this.changed_at,
      this.last_updated_by, this._hexColor);

  final String id;

  @observable
  String? text;

  @observable
  TaskImportanceTypes importance = TaskImportanceTypes.low;

  @observable
  @JsonKey(includeIfNull: false, toJson: _dateTimeNullableToJson, fromJson: _dateTimeNullablefromJson)
  DateTime? deadline;

  @JsonKey(toJson: _dateTimeToJson, fromJson: _dateTimefromJson)
  DateTime created_at;

  @JsonKey(toJson: _dateTimeToJson, fromJson: _dateTimefromJson)
  DateTime changed_at;

  static int? _dateTimeNullableToJson(DateTime? value) => value?.toUtc().millisecondsSinceEpoch;
  static DateTime? _dateTimeNullablefromJson(int? value) =>
      value == null ? null : DateTime.fromMillisecondsSinceEpoch(value);

  static int _dateTimeToJson(DateTime value) => value.toUtc().millisecondsSinceEpoch;
  static DateTime _dateTimefromJson(int value) => DateTime.fromMillisecondsSinceEpoch(value);

  @observable
  bool done = false;

  @JsonKey(includeIfNull: false)
  String? _hexColor;

  @JsonKey(includeToJson: false)
  Color? get color => _hexColor == null ? null : HexColor(_hexColor!);

  String last_updated_by;
}

enum TaskImportanceTypes {
  low,
  basic,
  important,
}

extension TaskImportanceTypesExtension on TaskImportanceTypes {
  String get lable {
    switch (this) {
      case TaskImportanceTypes.low:
        return t.addtask.importance_no;

      case TaskImportanceTypes.basic:
        return t.addtask.importance_low;

      case TaskImportanceTypes.important:
        return t.addtask.importance_high;

      default:
        return "";
    }
  }

  IconData? get icon {
    switch (this) {
      case TaskImportanceTypes.low:
        return null;

      case TaskImportanceTypes.basic:
        return Icons.arrow_downward;

      case TaskImportanceTypes.important:
        return Icons.warning_amber;

      default:
        return null;
    }
  }
}
