import 'package:get_it/get_it.dart';
import 'package:todo_list/backend_connection/backend_connection.dart';
import 'package:todo_list/modals/task.dart';
import 'package:todo_list/storage/storage.dart';

abstract class IApi {
  Future<void> init();

  Future<List<Task>?> getAllTasks();

  Future<List<Task>?> updateAllTasks(String requsetBody);

  Future<Task?> getTask(String uid);

  Future<Task?> addNewTask(String requsetBody);

  Future<Task?> updateTask(String uid, String requsetBody);

  Future<Task?> deleteTask(String uid);
}

class Api extends IApi {
  late IBackendConnection _backendConnection;
  late IStorage _storage;

  @override
  Future<void> init() async {
    _backendConnection = GetIt.I<IBackendConnection>();
    _storage = GetIt.I<IStorage>();
  }

  @override
  Future<Task?> addNewTask(String requsetBody) {
    // TODO: implement addNewTask
    throw UnimplementedError();
  }

  @override
  Future<Task?> deleteTask(String uid) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<List<Task>?> getAllTasks() async {
    List<Task> tasks;

    _storage.getAllTasks();
  }

  @override
  Future<Task?> getTask(String uid) {
    // TODO: implement getTask
    throw UnimplementedError();
  }

  @override
  Future<List<Task>?> updateAllTasks(String requsetBody) {
    // TODO: implement updateAllTasks
    throw UnimplementedError();
  }

  @override
  Future<Task?> updateTask(String uid, String requsetBody) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
