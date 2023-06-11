// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Task on _Task, Store {
  late final _$textAtom = Atom(name: '_Task.text', context: context);

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  late final _$deadLineAtom = Atom(name: '_Task.deadLine', context: context);

  @override
  DateTime? get deadLine {
    _$deadLineAtom.reportRead();
    return super.deadLine;
  }

  @override
  set deadLine(DateTime? value) {
    _$deadLineAtom.reportWrite(value, super.deadLine, () {
      super.deadLine = value;
    });
  }

  late final _$isComplitedAtom =
      Atom(name: '_Task.isComplited', context: context);

  @override
  bool get isComplited {
    _$isComplitedAtom.reportRead();
    return super.isComplited;
  }

  @override
  set isComplited(bool value) {
    _$isComplitedAtom.reportWrite(value, super.isComplited, () {
      super.isComplited = value;
    });
  }

  late final _$importanceTypeAtom =
      Atom(name: '_Task.importanceType', context: context);

  @override
  TaskImportanceTypes get importanceType {
    _$importanceTypeAtom.reportRead();
    return super.importanceType;
  }

  @override
  set importanceType(TaskImportanceTypes value) {
    _$importanceTypeAtom.reportWrite(value, super.importanceType, () {
      super.importanceType = value;
    });
  }

  @override
  String toString() {
    return '''
text: ${text},
deadLine: ${deadLine},
isComplited: ${isComplited},
importanceType: ${importanceType}
    ''';
  }
}
