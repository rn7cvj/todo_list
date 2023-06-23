import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_list/api/api.dart';
import 'package:todo_list/logger.dart';

import '../modals/task.dart';

part 'task_list.g.dart';

class TaskListContoller = TaskListContollerStore with _$TaskListContoller;

abstract class TaskListContollerStore with Store {
  IApi api = GetIt.I<IApi>();

  int _lastUid = 0;

  void init() async {
    tasks.addAll((await api.getAllTasks())!);
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
    int index = tasks.indexWhere((task) => task.uid == uid);
    if (index == -1) {
      return null;
    }
    return tasks[index];
  }

  @action
  void addNewTaskByDetails(String text, DateTime? deadLine, TaskImportanceTypes importanceType) {
    Task newTask = Task(_lastUid.toString(), text, importanceType, false, DateTime.now(), DateTime.now(), 123);

    api.addNewTask(newTask);
    tasks.add(newTask);

    logger.i("Add new task\n$newTask");

    _lastUid += 1;
  }

  @action
  void editTask(int id, String taskDiscirption, DateTime? deadLine, TaskImportanceTypes importanceType) {
    // int index = tasks.indexWhere((task) => task.id == id);

    // if (index == -1) return;

    // tasks[index].text = taskDiscirption;
    // tasks[index].deadLine = deadLine;
    // tasks[index].importanceType = importanceType;
  }

  @action
  void toogleTaksComplitedStatus(int id) {
    // int index = tasks.indexWhere((task) => task.id == id);

    // if (index == -1) return;

    // logger.i("Task toogle complited status, task id = $id");

    // tasks[index].isComplited = !tasks[index].isComplited;
  }

  @action
  void markTaskAsComplited(String uid) {
    // int index = tasks.indexWhere((task) => task.id == id);

    // if (index == -1) return;

    // logger.i("Task mark as complited, task id = $id");

    // tasks[index].isComplited = true;
  }

  @action
  void markTaskAsUnComplited(String uid) {
    // int index = tasks.indexWhere((task) => task.id == id);

    // if (index == -1) return;

    // logger.i("Task mark as un complited, task id = $id");

    // tasks[index].isComplited = false;
  }

  @action
  void deleteTask(String uid) {
    // int index = tasks.indexWhere((task) => task.id == id);
    // if (index == -1) return;

    // logger.w("Delete task, task id = $id");

    // tasks.removeAt(index);
  }

  @action
  void toogleComplitedTaskVisibilty() {
    isComplitedTaskVisible = !isComplitedTaskVisible;
  }
}
