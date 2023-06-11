// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskListContoller on _TaskListContoller, Store {
  Computed<List<Task>>? _$getTasksComputed;

  @override
  List<Task> get getTasks =>
      (_$getTasksComputed ??= Computed<List<Task>>(() => super.getTasks,
              name: '_TaskListContoller.getTasks'))
          .value;

  late final _$tasksAtom =
      Atom(name: '_TaskListContoller.tasks', context: context);

  @override
  ObservableList<Task> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<Task> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$isComplitedTaskVisibleAtom =
      Atom(name: '_TaskListContoller.isComplitedTaskVisible', context: context);

  @override
  bool get isComplitedTaskVisible {
    _$isComplitedTaskVisibleAtom.reportRead();
    return super.isComplitedTaskVisible;
  }

  @override
  set isComplitedTaskVisible(bool value) {
    _$isComplitedTaskVisibleAtom
        .reportWrite(value, super.isComplitedTaskVisible, () {
      super.isComplitedTaskVisible = value;
    });
  }

  late final _$_TaskListContollerActionController =
      ActionController(name: '_TaskListContoller', context: context);

  @override
  void toogleTaksComplitedStatus(int id) {
    final _$actionInfo = _$_TaskListContollerActionController.startAction(
        name: '_TaskListContoller.toogleTaksComplitedStatus');
    try {
      return super.toogleTaksComplitedStatus(id);
    } finally {
      _$_TaskListContollerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void markTaskAsComplited(int id) {
    final _$actionInfo = _$_TaskListContollerActionController.startAction(
        name: '_TaskListContoller.markTaskAsComplited');
    try {
      return super.markTaskAsComplited(id);
    } finally {
      _$_TaskListContollerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void markTaskAsUnComplited(int id) {
    final _$actionInfo = _$_TaskListContollerActionController.startAction(
        name: '_TaskListContoller.markTaskAsUnComplited');
    try {
      return super.markTaskAsUnComplited(id);
    } finally {
      _$_TaskListContollerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteTask(int id) {
    final _$actionInfo = _$_TaskListContollerActionController.startAction(
        name: '_TaskListContoller.deleteTask');
    try {
      return super.deleteTask(id);
    } finally {
      _$_TaskListContollerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toogleComplitedTaskVisibilty() {
    final _$actionInfo = _$_TaskListContollerActionController.startAction(
        name: '_TaskListContoller.toogleComplitedTaskVisibilty');
    try {
      return super.toogleComplitedTaskVisibilty();
    } finally {
      _$_TaskListContollerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks},
isComplitedTaskVisible: ${isComplitedTaskVisible},
getTasks: ${getTasks}
    ''';
  }
}
