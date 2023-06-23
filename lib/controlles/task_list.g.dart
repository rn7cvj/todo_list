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
      (_$getTasksComputed ??= Computed<List<Task>>(() => super.getTasks,
              name: 'TaskListContollerStore.getTasks'))
          .value;
  Computed<int>? _$complitedTaskCountComputed;

  @override
  int get complitedTaskCount => (_$complitedTaskCountComputed ??= Computed<int>(
          () => super.complitedTaskCount,
          name: 'TaskListContollerStore.complitedTaskCount'))
      .value;

  late final _$tasksAtom =
      Atom(name: 'TaskListContollerStore.tasks', context: context);

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

  late final _$isComplitedTaskVisibleAtom = Atom(
      name: 'TaskListContollerStore.isComplitedTaskVisible', context: context);

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

  late final _$addNewTaskByDetailsAsyncAction = AsyncAction(
      'TaskListContollerStore.addNewTaskByDetails',
      context: context);

  @override
  Future<void> addNewTaskByDetails(
      String text, DateTime? deadLine, TaskImportanceTypes importanceType) {
    return _$addNewTaskByDetailsAsyncAction
        .run(() => super.addNewTaskByDetails(text, deadLine, importanceType));
  }

  late final _$editTaskAsyncAction =
      AsyncAction('TaskListContollerStore.editTask', context: context);

  @override
  Future<void> editTask(String uid, String text, DateTime? deadLine,
      TaskImportanceTypes importanceType) {
    return _$editTaskAsyncAction
        .run(() => super.editTask(uid, text, deadLine, importanceType));
  }

  late final _$toogleTaksComplitedStatusAsyncAction = AsyncAction(
      'TaskListContollerStore.toogleTaksComplitedStatus',
      context: context);

  @override
  Future<void> toogleTaksComplitedStatus(String uid) {
    return _$toogleTaksComplitedStatusAsyncAction
        .run(() => super.toogleTaksComplitedStatus(uid));
  }

  late final _$markTaskAsComplitedAsyncAction = AsyncAction(
      'TaskListContollerStore.markTaskAsComplited',
      context: context);

  @override
  Future<void> markTaskAsComplited(String uid) {
    return _$markTaskAsComplitedAsyncAction
        .run(() => super.markTaskAsComplited(uid));
  }

  late final _$markTaskAsUnComplitedAsyncAction = AsyncAction(
      'TaskListContollerStore.markTaskAsUnComplited',
      context: context);

  @override
  Future<void> markTaskAsUnComplited(String uid) {
    return _$markTaskAsUnComplitedAsyncAction
        .run(() => super.markTaskAsUnComplited(uid));
  }

  late final _$deleteTaskAsyncAction =
      AsyncAction('TaskListContollerStore.deleteTask', context: context);

  @override
  Future<void> deleteTask(String uid) {
    return _$deleteTaskAsyncAction.run(() => super.deleteTask(uid));
  }

  late final _$fetchLastTaskAsyncAction =
      AsyncAction('TaskListContollerStore.fetchLastTask', context: context);

  @override
  Future<void> fetchLastTask() {
    return _$fetchLastTaskAsyncAction.run(() => super.fetchLastTask());
  }

  late final _$TaskListContollerStoreActionController =
      ActionController(name: 'TaskListContollerStore', context: context);

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
