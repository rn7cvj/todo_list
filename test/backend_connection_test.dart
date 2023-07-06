import 'package:test/test.dart';
import 'package:todo_list/data/backend_connection/backend_connection.dart';

void main() {
  group('Testing BackendConnection', () {
    var backendConnection = BackendConnection();

    test('An item shoud be remove', () async {
      var tasks = await backendConnection.getAllTasks();

      await backendConnection.deleteTask(tasks?.first["id"]);
      var newTasks = await backendConnection.getAllTasks();
      expect(newTasks?.length == (tasks!.length - 1), true);
    });
  });
}
