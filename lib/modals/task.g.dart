// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      json['id'] as String,
      json['text'] as String,
      $enumDecode(_$TaskImportanceTypesEnumMap, json['importance']),
      json['done'] as bool,
      TaskStore._dateTimefromJson(json['created_at'] as int),
      TaskStore._dateTimefromJson(json['changed_at'] as int),
      json['last_updated_by'] as String,
      deadline: TaskStore._dateTimeNullablefromJson(json['deadline'] as int?),
    );

Map<String, dynamic> _$TaskToJson(Task instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'text': instance.text,
    'importance': _$TaskImportanceTypesEnumMap[instance.importance]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'deadline', TaskStore._dateTimeNullableToJson(instance.deadline));
  val['created_at'] = TaskStore._dateTimeToJson(instance.createdAt);
  val['changed_at'] = TaskStore._dateTimeToJson(instance.changedAt);
  val['done'] = instance.done;
  val['last_updated_by'] = instance.lastUpdatedBy;
  return val;
}

const _$TaskImportanceTypesEnumMap = {
  TaskImportanceTypes.low: 'low',
  TaskImportanceTypes.basic: 'basic',
  TaskImportanceTypes.important: 'important',
};

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Task on TaskStore, Store {
  late final _$textAtom = Atom(name: 'TaskStore.text', context: context);

  @override
  String? get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String? value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  late final _$importanceAtom =
      Atom(name: 'TaskStore.importance', context: context);

  @override
  TaskImportanceTypes get importance {
    _$importanceAtom.reportRead();
    return super.importance;
  }

  @override
  set importance(TaskImportanceTypes value) {
    _$importanceAtom.reportWrite(value, super.importance, () {
      super.importance = value;
    });
  }

  late final _$deadlineAtom =
      Atom(name: 'TaskStore.deadline', context: context);

  @override
  DateTime? get deadline {
    _$deadlineAtom.reportRead();
    return super.deadline;
  }

  @override
  set deadline(DateTime? value) {
    _$deadlineAtom.reportWrite(value, super.deadline, () {
      super.deadline = value;
    });
  }

  late final _$doneAtom = Atom(name: 'TaskStore.done', context: context);

  @override
  bool get done {
    _$doneAtom.reportRead();
    return super.done;
  }

  @override
  set done(bool value) {
    _$doneAtom.reportWrite(value, super.done, () {
      super.done = value;
    });
  }

  @override
  String toString() {
    return '''
text: ${text},
importance: ${importance},
deadline: ${deadline},
done: ${done}
    ''';
  }
}
