import 'package:mobx/mobx.dart';
import 'package:todo_list/logger.dart';

import '../models/task.dart';

part 'task_list.g.dart';

class TaskListContoller = TaskListContollerStore with _$TaskListContoller;

abstract class TaskListContollerStore with Store {
  int currnetTaskLastId = 6;

  @observable
  ObservableList<Task> tasks = <Task>[
    Task(1, "Сделать что-то 1", null, false, TaskImportanceTypes.not),
    Task(2, "Купить что-то 2", DateTime.now(), true, TaskImportanceTypes.low),
    Task(3, "Починить что-то 3", null, false, TaskImportanceTypes.low),
    Task(4, "Купить что-то 4", null, true, TaskImportanceTypes.hight),
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

    logger.i("Add new task\n$newTask");
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

    logger.i("Task toogle complited status, task id = $id");

    tasks[index].isComplited = !tasks[index].isComplited;
  }

  @action
  void markTaskAsComplited(int id) {
    int index = tasks.indexWhere((task) => task.id == id);

    if (index == -1) return;

    logger.i("Task mark as complited, task id = $id");

    tasks[index].isComplited = true;
  }

  @action
  void markTaskAsUnComplited(int id) {
    int index = tasks.indexWhere((task) => task.id == id);

    if (index == -1) return;

    logger.i("Task mark as un complited, task id = $id");

    tasks[index].isComplited = false;
  }

  @action
  void deleteTask(int id) {
    int index = tasks.indexWhere((task) => task.id == id);
    if (index == -1) return;

    logger.w("Delete task, task id = $id");

    tasks.removeAt(index);
  }

  @action
  void toogleComplitedTaskVisibilty() {
    isComplitedTaskVisible = !isComplitedTaskVisible;
  }
}
