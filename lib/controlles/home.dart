import 'package:mobx/mobx.dart';
import 'package:todo_list/models/task.dart';

class HomeController {
  ObservableList<Task> tasks = <Task>[
    Task(1, "Купить что-то 1", null, false, TaskImportanceTypes.Not),
    Task(2, "Купить что-то 2", DateTime.now(), true, TaskImportanceTypes.Low),
    Task(3, "Купить что-то 3", null, false, TaskImportanceTypes.Low),
    Task(4, "Купить что-то 4", null, true, TaskImportanceTypes.Hight),
    Task(5, "Купить что-то 5", DateTime.now(), false, TaskImportanceTypes.Hight),
  ].asObservable();

  Observable<bool> isComplitedTaskVisible = false.obs();

  void markTaskAsComplited(int id) {
    List<Task> newTask = List.castFrom(tasks);

    int index = newTask.indexWhere((task) => task.id == id);

    if (index == -1) {
      return;
    }

    newTask[index].isComplited = true;
  }

  void markTaskAsUnComplited(int id) {}

  void deleteTask(int id) {}
}
