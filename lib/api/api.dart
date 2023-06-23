import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:todo_list/data/backend_connection/backend_connection.dart';
import 'package:todo_list/modals/task.dart';
import 'package:todo_list/data/storage/storage.dart';

import '../i18n/strings.g.dart';

enum ErrorTypes {
  noIntenet,
  failServerConnetcion,
}

extension ErrorTypesExtension on ErrorTypes {
  String get lable {
    switch (this) {
      case ErrorTypes.noIntenet:
        return t.errors.noIntenet;

      case ErrorTypes.failServerConnetcion:
        return t.errors.failServerConnetcion;

      default:
        return "";
    }
  }
}

typedef void OnErrorCallBack(ErrorTypes error);

abstract interface class IApi {
  OnErrorCallBack? onError;

  Future<void> init();

  Future<List<Task>?> getAllTasks();

  Future<List<Task>?> updateAllTasks(String requsetBody);

  Future<Task?> getTask(String uid);

  Future<Task?> addNewTask(Task newTask);

  Future<Task?> updateTask(String uid, Task newTask);

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
  Future<Task?> addNewTask(Task newTask) async {
    // _storage.addNewTask(newTask.toJson());
    _backendConnection.addNewTask(jsonEncode(newTask.toJson()));
  }

  @override
  Future<Task?> deleteTask(String uid) async {
    // if (onError != null) onError!(ErrorTypes.noIntenet);
    _backendConnection.deleteTask(uid);
  }

  @override
  Future<List<Task>?> getAllTasks() async {
    List<Task> tasks;

    List<Map<String, dynamic>>? tasksJson = await _backendConnection.getAllTasks();

    if (tasksJson == null) return null;

    tasks = tasksJson.map((e) => Task.fromJson(e)).toList();

    // List<Map<String, dynamic>>? tasksJson = await _storage.getAllTasks();

    // if (tasksJson == null) return null;

    // tasks = tasksJson.map((e) => Task.fromJson(e)).toList();
    return tasks;
  }

  @override
  Future<Task?> getTask(String uid) async {
    Task task;

    Map<String, dynamic>? taskJson = await _backendConnection.getTask(uid);

    if (taskJson == null) return null;

    task = Task.fromJson(taskJson);

    // Map<String, dynamic>? taskJson = await _storage.getTask(uid);

    // if (taskJson == null) return null;

    // task = Task.fromJson(taskJson);

    return task;
  }

  @override
  Future<List<Task>?> updateAllTasks(String requsetBody) {
    // TODO: implement updateAllTasks
    throw UnimplementedError();
  }

  @override
  Future<Task?> updateTask(String uid, Task newTask) async {
    _backendConnection.updateTask(uid, jsonEncode(newTask.toJson()));
  }
}
