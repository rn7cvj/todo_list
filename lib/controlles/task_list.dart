import 'package:mobx/mobx.dart';

import '../models/task.dart';

part 'task_list.g.dart';

// ignore: library_private_types_in_public_api
class TaskListContoller = _TaskListContoller with _$TaskListContoller;

abstract class _TaskListContoller with Store {
  @observable
  ObservableList<Task> tasks = <Task>[
    Task(1, "Купить что-то 1", null, false, TaskImportanceTypes.Not),
    Task(2, "Купить что-то 2", DateTime.now(), true, TaskImportanceTypes.Low),
    Task(3, "Купить что-то 3", null, false, TaskImportanceTypes.Low),
    Task(4, "Купить что-то 4", null, true, TaskImportanceTypes.Hight),
    Task(5, "Купить что-то 5", DateTime.now(), false, TaskImportanceTypes.Hight),
  ].asObservable();

  @observable
  bool isComplitedTaskVisible = false;

  @computed
  List<Task> get getTasks => tasks.where((task) => isComplitedTaskVisible ? true : !task.isComplited).toList();

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
