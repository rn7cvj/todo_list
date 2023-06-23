// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskListContoller on TaskListContollerStore, Store {
  Computed<List<Task>>? _$getTasksComputed;

  @override
  List<Task> get getTasks =>
      (_$getTasksComputed ??= Computed<List<Task>>(() => super.getTasks, name: 'TaskListContollerStore.getTasks'))
          .value;
  Computed<int>? _$complitedTaskCountComputed;

  @override
  int get complitedTaskCount => (_$complitedTaskCountComputed ??=
          Computed<int>(() => super.complitedTaskCount, name: 'TaskListContollerStore.complitedTaskCount'))
      .value;

  late final _$tasksAtom = Atom(name: 'TaskListContollerStore.tasks', context: context);

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
      Atom(name: 'TaskListContollerStore.isComplitedTaskVisible', context: context);

  @override
  bool get isComplitedTaskVisible {
    _$isComplitedTaskVisibleAtom.reportRead();
    return super.isComplitedTaskVisible;
  }

  @override
  set isComplitedTaskVisible(bool value) {
    _$isComplitedTaskVisibleAtom.reportWrite(value, super.isComplitedTaskVisible, () {
      super.isComplitedTaskVisible = value;
    });
  }

  late final _$TaskListContollerStoreActionController =
      ActionController(name: 'TaskListContollerStore', context: context);

  @override
  void addNewTaskByDetails(String text, DateTime? deadLine, TaskImportanceTypes importanceType) {
    final _$actionInfo =
        _$TaskListContollerStoreActionController.startAction(name: 'TaskListContollerStore.addNewTaskByDetails');
    try {
      return super.addNewTaskByDetails(text, deadLine, importanceType);
    } finally {
      _$TaskListContollerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editTask(int id, String taskDiscirption, DateTime? deadLine, TaskImportanceTypes importanceType) {
    final _$actionInfo = _$TaskListContollerStoreActionController.startAction(name: 'TaskListContollerStore.editTask');
    try {
      return super.editTask(id, taskDiscirption, deadLine, importanceType);
    } finally {
      _$TaskListContollerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toogleTaksComplitedStatus(int id) {
    final _$actionInfo =
        _$TaskListContollerStoreActionController.startAction(name: 'TaskListContollerStore.toogleTaksComplitedStatus');
    try {
      return super.toogleTaksComplitedStatus(id);
    } finally {
      _$TaskListContollerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void markTaskAsComplited(int id) {
    final _$actionInfo =
        _$TaskListContollerStoreActionController.startAction(name: 'TaskListContollerStore.markTaskAsComplited');
    try {
      return super.markTaskAsComplited(id);
    } finally {
      _$TaskListContollerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void markTaskAsUnComplited(int id) {
    final _$actionInfo =
        _$TaskListContollerStoreActionController.startAction(name: 'TaskListContollerStore.markTaskAsUnComplited');
    try {
      return super.markTaskAsUnComplited(id);
    } finally {
      _$TaskListContollerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteTask(String id) {
    final _$actionInfo =
        _$TaskListContollerStoreActionController.startAction(name: 'TaskListContollerStore.deleteTask');
    try {
      return super.deleteTask(id);
    } finally {
      _$TaskListContollerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toogleComplitedTaskVisibilty() {
    final _$actionInfo = _$TaskListContollerStoreActionController.startAction(
        name: 'TaskListContollerStore.toogleComplitedTaskVisibilty');
    try {
      return super.toogleComplitedTaskVisibilty();
    } finally {
      _$TaskListContollerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks},
isComplitedTaskVisible: ${isComplitedTaskVisible},
getTasks: ${getTasks},
complitedTaskCount: ${complitedTaskCount}
    ''';
  }
}
