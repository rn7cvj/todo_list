import 'package:get_storage/get_storage.dart';

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
  GetStorage? _box;

  @override
  Future<void> init() async {
    await GetStorage.init('taskBox');
    _box = GetStorage('taskBox');
  }

  @override
  Future<Map<String, dynamic>?> addNewTask(Map<String, dynamic> data) async {
    await _box?.write(data["uid"], data);
  }

  @override
  Future<Map<String, dynamic>?> deleteTask(String uid) async {
    Map<String, dynamic>? removeValue = await getTask(uid);
    await _box?.remove(uid);
    return removeValue;
  }

  @override
  Future<List<Map<String, dynamic>>?> getAllTasks() async {
    List<String> keys = _box?.getKeys().toList();

    List<Map<String, dynamic>>? values;

    if (keys.isNotEmpty) {
      values = [];
    }

    for (String key in keys) {
      values?.add(_box?.read(key));
    }

    return values;
  }

  @override
  Future<Map<String, dynamic>?> getTask(String uid) async {
    Map<String, dynamic>? res = _box?.read(uid);
    return res;
  }

  @override
  Future<List<Map<String, dynamic>>?> updateAllTasks(List<Map<String, dynamic>> data) async {
    await _box?.erase();

    for (Map<String, dynamic> d in data) {
      addNewTask(d);
    }
  }

  @override
  Future<Map<String, dynamic>?> updateTask(String uid, Map<String, dynamic> data) async {
    await _box?.write(data["id"], data);
    return getTask(data["id"]);
  }
}
