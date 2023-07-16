import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'package:test/test.dart';
import 'package:todo_list/data/backend_connection/backend_connection.dart';
import 'package:todo_list/modals/task.dart';

void main() async {
  var backendConnection = BackendConnection();

  await backendConnection.init();

  var uuid = const Uuid();

  Task newTask = Task(uuid.v4(), "text", TaskImportanceTypes.important, true,
      DateTime.now(), DateTime.now(), "123");
  String uid = newTask.id;

  group('Testing BackendConnection', () {
    test("An item shoud be add", () async {
      await backendConnection.addNewTask(jsonEncode(newTask));

      var tasks = await backendConnection.getAllTasks();
      expect(tasks?.firstWhere((element) => element["id"] == uid).isNotEmpty,
          true);
    });

    test("An item shoud be edit", () async {
      Task newEditTask = Task(uid, "editText", TaskImportanceTypes.important,
          true, DateTime.now(), DateTime.now(), "123");
      await backendConnection.updateTask(uid, jsonEncode(newEditTask));

      Map<String, dynamic>? editTask = await backendConnection.getTask(uid);

      expect(editTask?["text"] == "editText", true);
    });

    test('An item shoud be remove', () async {
      var tasks = await backendConnection.getAllTasks();

      await backendConnection.deleteTask(uid);
      var newTasks = await backendConnection.getAllTasks();
      expect(newTasks?.length == (tasks!.length - 1), true);
    });
  });
}
