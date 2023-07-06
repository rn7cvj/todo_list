import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:todo_list/data/backend_connection/backend_connection.dart';

import 'package:todo_list/modals/task.dart';
import 'package:todo_list/data/storage/storage.dart';

import '../controlles/settings.dart';
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

enum ApiStatus {
  localStorageOnly,
  localAndRemoteStorage,
}

typedef OnErrorCallBack = void Function(ErrorTypes error);

abstract interface class IApi {
  OnErrorCallBack? onError;

  Future<void> init();

  ApiStatus getApiStatus();

  Future<ApiStatus> updateApiStatus();

  Future<void> tryToSync();

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

  late ApiStatus _apiStatus = ApiStatus.localAndRemoteStorage;

  final Settings settings = GetIt.I<Settings>();

  @override
  Future<void> init() async {
    _backendConnection = GetIt.I<IBackendConnection>();
    _storage = GetIt.I<IStorage>();
  }

  @override
  ApiStatus getApiStatus() => _apiStatus;

  @override
  Future<ApiStatus> updateApiStatus() async {
    await _backendConnection.updateBackendSatus();
    BackendStatus backendStatus = await _backendConnection.getBackendSatus();

    if (backendStatus == BackendStatus.unavailable) {
      settings.setNewLocalStorageUse(true);
      _apiStatus = ApiStatus.localStorageOnly;
      return _apiStatus;
    }

    _apiStatus = ApiStatus.localAndRemoteStorage;
    return _apiStatus;
  }

  @override
  Future<void> tryToSync() async {
    await updateApiStatus();

    if (_apiStatus == ApiStatus.localStorageOnly) {
      if (onError != null) onError!(ErrorTypes.failServerConnetcion);
      return;
    }

    await syncData();
  }

  Future<void> syncData() async {
    List<Map<String, dynamic>>? backendList = await _backendConnection.getAllTasks();

    List<Map<String, dynamic>>? localList = await _storage.getAllTasks();

    if (backendList == null) {
      onError!(ErrorTypes.failServerConnetcion);
      return;
    }

    localList = localList ?? [];

    for (var task in backendList) {
      if (localList.where((element) => element["id"] == task["id"]).isEmpty) {
        await _storage.addNewTask(task);
      }
    }

    for (var task in localList) {
      if (backendList.where((element) => element["id"] == task["id"]).isEmpty) {
        await _backendConnection.addNewTask(jsonEncode(task));
      }
    }
  }

  @override
  Future<Task?> addNewTask(Task newTask) async {
    await _storage.addNewTask(newTask.toJson());

    if (_apiStatus != ApiStatus.localStorageOnly) {
      var res = await _backendConnection.addNewTask(jsonEncode(newTask.toJson()));
      if (res == null) {
        _apiStatus == ApiStatus.localStorageOnly;
        onError!(ErrorTypes.failServerConnetcion);
      }
    }
    return null;
  }

  @override
  Future<Task?> deleteTask(String uid) async {
    await _storage.deleteTask(uid);
    if (_apiStatus != ApiStatus.localStorageOnly) {
      var res = await _backendConnection.deleteTask(uid);
      if (res == null) {
        _apiStatus == ApiStatus.localStorageOnly;
        onError!(ErrorTypes.failServerConnetcion);
      }
    }
    return null;
  }

  @override
  Future<List<Task>?> getAllTasks() async {
    List<Task> tasks;
    List<Map<String, dynamic>>? tasksJson;

    tasksJson = await _storage.getAllTasks();

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

    Map<String, dynamic>? taskJson;

    taskJson = await _storage.getTask(uid);

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
    await _storage.updateTask(uid, newTask.toJson());
    if (_apiStatus != ApiStatus.localStorageOnly) {
      var res = await _backendConnection.updateTask(uid, jsonEncode(newTask.toJson()));
      if (res == null) {
        _apiStatus == ApiStatus.localStorageOnly;
        onError!(ErrorTypes.failServerConnetcion);
      }
    }
    return null;
  }
}
