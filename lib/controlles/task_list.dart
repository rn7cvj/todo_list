import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_list/api/api.dart';
import 'package:todo_list/logger.dart';
import 'package:uuid/uuid.dart';

import '../modals/task.dart';

part 'task_list.g.dart';

class TaskListContoller = TaskListContollerStore with _$TaskListContoller;

abstract class TaskListContollerStore with Store {
  IApi api = GetIt.I<IApi>();

  var uuid = Uuid();

  Future<void> init() async {
    await fetchLastTask();
  }

  void setOnErrorHandler(OnErrorCallBack? onError) {
    api.onError = onError;
  }

  @observable
  ObservableList<Task> tasks = <Task>[].asObservable();

  @observable
  bool isComplitedTaskVisible = false;

  @computed
  List<Task> get getTasks => tasks.where((task) => isComplitedTaskVisible ? true : !task.done).toList();

  @computed
  int get complitedTaskCount => tasks.where((task) => task.done).length;

  Task? getTaskById(String uid) {
    int index = tasks.indexWhere((task) => task.id == uid);
    if (index == -1) {
      return null;
    }
    return tasks[index];
  }

  @action
  Future<void> addNewTaskByDetails(String text, DateTime? deadLine, TaskImportanceTypes importanceType) async {
    Task newTask = Task(uuid.v4(), text, importanceType, false, DateTime.now(), DateTime.now(), "123");

    await api.addNewTask(newTask);

    await fetchLastTask();

    logger.i("Add new task\n$newTask");
  }

  @action
  Future<void> editTask(String uid, String text, DateTime? deadLine, TaskImportanceTypes importanceType) async {
    Task? task = await api.getTask(uid);

    if (task == null) return;

    task.text = text;
    task.deadline = deadLine;
    task.importance = importanceType;
    task.changed_at = DateTime.now();

    await api.updateTask(uid, task);

    await fetchLastTask();
  }

  @action
  Future<void> toogleTaksComplitedStatus(String uid) async {
    Task? task = await api.getTask(uid);

    if (task == null) return;

    task.done = !task.done;

    await api.updateTask(uid, task);

    await fetchLastTask();
  }

  @action
  Future<void> markTaskAsComplited(String uid) async {
    Task? task = await api.getTask(uid);

    if (task == null) return;

    task.done = true;

    await api.updateTask(uid, task);

    await fetchLastTask();
  }

  @action
  Future<void> markTaskAsUnComplited(String uid) async {
    Task? task = await api.getTask(uid);

    if (task == null) return;

    task.done = false;

    await api.updateTask(uid, task);

    await fetchLastTask();
  }

  @action
  Future<void> deleteTask(String uid) async {
    await api.deleteTask(uid);

    await fetchLastTask();
  }

  @action
  Future<void> fetchLastTask() async {
    List<Task>? storageTaskList = (await api.getAllTasks());
    if (storageTaskList != null) {
      tasks.clear();
      tasks.addAll(storageTaskList.asObservable());
    }
  }

  @action
  void toogleComplitedTaskVisibilty() {
    isComplitedTaskVisible = !isComplitedTaskVisible;
  }
}
