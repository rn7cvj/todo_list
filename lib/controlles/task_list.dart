import 'package:mobx/mobx.dart';

import '../models/task.dart';

part 'task_list.g.dart';

// ignore: library_private_types_in_public_api
class TaskListContoller = _TaskListContoller with _$TaskListContoller;

abstract class _TaskListContoller with Store {
  int currnetTaskLastId = 6;

  @observable
  ObservableList<Task> tasks = <Task>[
    Task(1, "Купить что-то 1", null, false, TaskImportanceTypes.Not),
    Task(2, "Купить что-то 2", DateTime.now(), true, TaskImportanceTypes.Low),
    Task(3, "Купить что-то 3", null, false, TaskImportanceTypes.Low),
    Task(4, "Купить что-то 4", null, true, TaskImportanceTypes.Hight),
  ].asObservable();

  @observable
  bool isComplitedTaskVisible = false;

  @computed
  List<Task> get getTasks => tasks.where((task) => isComplitedTaskVisible ? true : !task.isComplited).toList();

  @computed
  int get complitedTaskCount => tasks.where((task) => task.isComplited).length;

  Task? getTaskById(int id) {
    int index = tasks.indexWhere((task) => task.id == id);
    if (index == -1) {
      return null;
    }
    return tasks[index];
  }

  @action
  void addNewTask(Task newTask) {
    tasks.add(newTask);
  }

  @action
  void addNewTaskByDetails(String taskDiscirption, DateTime? deadLine, TaskImportanceTypes importanceType) {
    Task newTask = Task(currnetTaskLastId, taskDiscirption, deadLine, false, importanceType);
    currnetTaskLastId += 1;
    tasks.add(newTask);
  }

  @action
  void editTask(int id, String taskDiscirption, DateTime? deadLine, TaskImportanceTypes importanceType) {
    int index = tasks.indexWhere((task) => task.id == id);

    if (index == -1) return;

    tasks[index].text = taskDiscirption;
    tasks[index].deadLine = deadLine;
    tasks[index].importanceType = importanceType;
  }

  @action
  void toogleTaksComplitedStatus(int id) {
    int index = tasks.indexWhere((task) => task.id == id);

    if (index == -1) return;

    tasks[index].isComplited = !tasks[index].isComplited;
  }

  @action
  void markTaskAsComplited(int id) {
    int index = tasks.indexWhere((task) => task.id == id);

    if (index == -1) return;

    tasks[index].isComplited = true;
  }

  @action
  void markTaskAsUnComplited(int id) {
    int index = tasks.indexWhere((task) => task.id == id);

    if (index == -1) return;

    tasks[index].isComplited = false;
  }

  @action
  void deleteTask(int id) {
    int index = tasks.indexWhere((task) => task.id == id);
    if (index == -1) return;
    tasks.removeAt(index);
  }

  @action
  void toogleComplitedTaskVisibilty() {
    isComplitedTaskVisible = !isComplitedTaskVisible;
  }
}
