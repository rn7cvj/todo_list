import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

abstract class IBackendConnection {
  Future<void> init();

  Future<List<Map<String, dynamic>>?> getAllTasks();

  Future<List<Map<String, dynamic>>?> updateAllTasks(String requsetBody);

  Future<Map<String, dynamic>?> getTask(String uid);

  Future<Map<String, dynamic>?> addNewTask(String requsetBody);

  Future<Map<String, dynamic>?> updateTask(String uid, String requsetBody);

  Future<Map<String, dynamic>?> deleteTask(String uid);
}

class BackendConnection extends IBackendConnection {
  static final String _baseUrl = "https://beta.mrdekk.ru/todobackend";

  static final String _getAllTasksUrl = "/list";
  static final String _updateAllTasksUrl = "/list";
  static final String _getTaskUrl = "/list/";
  static final String _addNewTaskUrl = "/list";
  static final String _updateTaskUrl = "/list/";
  static final String _deleteTaskUrl = "/list/";

  Map<String, String> get _headers => {
        "Authorization": "Bearer",
        "X-Last-Known-Revision": '$_lastRevision',
      };

  int _lastRevision = 0;

  @override
  Future<void> init() async {
    var url = Uri.parse(_baseUrl + _getAllTasksUrl);

    var response = await http.get(url, headers: {"Authorization": "Bearer reimply"});

    if (response.statusCode != 200) {
      return;
    }

    var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;

    _lastRevision = jsonResponse["revision"];
  }

  @override
  Future<List<Map<String, dynamic>>?> getAllTasks() async {
    var url = Uri.parse(_baseUrl + _getAllTasksUrl);

    var response = await http.get(url, headers: _headers);

    if (response.statusCode != 200) {
      return null;
    }

    var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;

    var list = (jsonResponse["list"] as List<dynamic>).map((j) => j as Map<String, dynamic>).toList();

    return list;
  }

  @override
  Future<List<Map<String, dynamic>>?> updateAllTasks(String requsetBody) async {
    var url = Uri.parse(_baseUrl + _updateAllTasksUrl);

    var response = await http.patch(url, headers: _headers, body: requsetBody);

    if (response.statusCode != 200) {
      return null;
    }

    var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
    var list = (jsonResponse["list"] as List<dynamic>).map((j) => j as Map<String, dynamic>).toList();

    return list;
  }

  @override
  Future<Map<String, dynamic>?> getTask(String uid) async {
    var url = Uri.parse(_baseUrl + _getTaskUrl + uid);

    var response = await http.get(url, headers: _headers);

    if (response.statusCode != 200) {
      return null;
    }

    var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;

    return jsonResponse["element"];
  }

  @override
  Future<Map<String, dynamic>?> addNewTask(String requsetBody) async {
    var url = Uri.parse(_baseUrl + _addNewTaskUrl);

    var response = await http.post(url, headers: _headers, body: requsetBody);

    if (response.statusCode != 200) {
      return null;
    }

    var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;

    _lastRevision = jsonResponse["revision"];

    return jsonResponse["element"];
  }

  @override
  Future<Map<String, dynamic>?> updateTask(String uid, String requsetBody) async {
    var url = Uri.parse(_baseUrl + _updateTaskUrl + uid);

    var response = await http.put(url, headers: _headers, body: requsetBody);

    if (response.statusCode != 200) {
      return null;
    }

    var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
    return jsonResponse["element"];
  }

  @override
  Future<Map<String, dynamic>?> deleteTask(String uid) async {
    var url = Uri.parse(_baseUrl + _updateTaskUrl + uid);

    var response = await http.delete(url, headers: _headers);

    if (response.statusCode != 200) {
      return null;
    }

    var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
    return jsonResponse["element"];
  }
}
