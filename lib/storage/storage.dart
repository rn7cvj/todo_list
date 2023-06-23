import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class IStorage {
  Future<void> init();

  Future<List<Map<String, dynamic>>?> getAllTasks();

  Future<List<Map<String, dynamic>>?> updateAllTasks(List<Map<String, dynamic>> data);

  Future<Map<String, dynamic>?> getTask(String uid);

  Future<Map<String, dynamic>?> addNewTask(Map<String, dynamic> data);

  Future<Map<String, dynamic>?> updateTask(String uid, Map<String, dynamic> data);

  Future<Map<String, dynamic>?> deleteTask(String uid);
}

class Storage extends IStorage {
  Box<dynamic>? _box;

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('taskBox');
  }

  @override
  Future<Map<String, dynamic>?> addNewTask(Map<String, dynamic> data) async {
    await _box?.add(data);
  }

  @override
  Future<Map<String, dynamic>?> deleteTask(String uid) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>?> getAllTasks() async {
    List<dynamic> values = _box!.values.toList();
    return values.map((e) =>).toList();
  }

  @override
  Future<Map<String, dynamic>?> getTask(String uid) async {
    List<dynamic> values = _box!.values.toList();
    return values.where((element) => (element as Map<String, dynamic>)["uid"] == uid).firstOrNull;
  }

  @override
  Future<List<Map<String, dynamic>>?> updateAllTasks(List<Map<String, dynamic>> data) {
    // TODO: implement updateAllTasks
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>?> updateTask(String uid, Map<String, dynamic> data) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
