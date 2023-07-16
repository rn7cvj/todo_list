import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

enum BackendStatus {
  available,
  unavailable,
}

abstract class IBackendConnection {
  Future<void> init();

  Future<BackendStatus> getBackendSatus();

  Future<void> updateBackendSatus();

  Future<List<Map<String, dynamic>>?> getAllTasks();

  Future<List<Map<String, dynamic>>?> updateAllTasks(String requsetBody);

  Future<Map<String, dynamic>?> getTask(String uid);

  Future<Map<String, dynamic>?> addNewTask(String requsetBody);

  Future<Map<String, dynamic>?> updateTask(String uid, String requsetBody);

  Future<Map<String, dynamic>?> deleteTask(String uid);
}

class BackendConnection extends IBackendConnection {
  static const String _baseUrl = "https://beta.mrdekk.ru/todobackend";

  static const String _getAllTasksUrl = "/list";
  static const String _updateAllTasksUrl = "/list";
  static const String _getTaskUrl = "/list/";
  static const String _addNewTaskUrl = "/list";
  static const String _updateTaskUrl = "/list/";
  static const String _deleteTaskUrl = "/list/";

  Map<String, String> get _headers => {
        "Authorization": "Bearer reimply",
        "X-Last-Known-Revision": '$_lastRevision',
      };

  int _lastRevision = 0;

  BackendStatus _backendStatus = BackendStatus.available;

  @override
  Future<BackendStatus> getBackendSatus() async {
    return _backendStatus;
  }

  @override
  Future<void> updateBackendSatus() async {
    var url = Uri.parse(_baseUrl + _getAllTasksUrl);

    try {
      var response =
          await http.get(url, headers: {"Authorization": "Bearer reimply"});

      if (response.statusCode != 200) {
        _backendStatus = BackendStatus.unavailable;
        return;
      }
      _backendStatus = BackendStatus.available;
    } catch (e) {
      _backendStatus = BackendStatus.unavailable;
    }
  }

  @override
  Future<void> init() async {
    var url = Uri.parse(_baseUrl + _getAllTasksUrl);

    try {
      var response =
          await http.get(url, headers: {"Authorization": "Bearer reimply"});

      if (response.statusCode != 200) {
        _backendStatus = BackendStatus.unavailable;
        return;
      }

      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      _lastRevision = jsonResponse["revision"];
    } catch (e) {
      _backendStatus = BackendStatus.unavailable;
    }
  }

  @override
  Future<List<Map<String, dynamic>>?> getAllTasks() async {
    if (_backendStatus == BackendStatus.unavailable) return null;

    var url = Uri.parse(_baseUrl + _getAllTasksUrl);

    try {
      var response = await http.get(url, headers: _headers);

      if (response.statusCode != 200) {
        return null;
      }

      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      var list = (jsonResponse["list"] as List<dynamic>)
          .map((j) => j as Map<String, dynamic>)
          .toList();

      return list;
    } on Exception {
      _backendStatus = BackendStatus.unavailable;
      return null;
    }
  }

  @override
  Future<List<Map<String, dynamic>>?> updateAllTasks(String requsetBody) async {
    if (_backendStatus == BackendStatus.unavailable) return null;

    try {
      var url = Uri.parse(_baseUrl + _updateAllTasksUrl);

      var response =
          await http.patch(url, headers: _headers, body: requsetBody);

      if (response.statusCode != 200) {
        return null;
      }

      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var list = (jsonResponse["list"] as List<dynamic>)
          .map((j) => j as Map<String, dynamic>)
          .toList();

      return list;
    } on Exception {
      _backendStatus = BackendStatus.unavailable;
      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> getTask(String uid) async {
    if (_backendStatus == BackendStatus.unavailable) return null;

    try {
      var url = Uri.parse(_baseUrl + _getTaskUrl + uid);

      var response = await http.get(url, headers: _headers);

      if (response.statusCode != 200) {
        return null;
      }

      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      return jsonResponse["element"];
    } on Exception {
      _backendStatus = BackendStatus.unavailable;
      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> addNewTask(String requsetBody) async {
    if (_backendStatus == BackendStatus.unavailable) return null;

    try {
      var url = Uri.parse(_baseUrl + _addNewTaskUrl);

      requsetBody = '{"element" : $requsetBody }';

      var response = await http.post(url, headers: _headers, body: requsetBody);

      if (response.statusCode != 200) {
        return null;
      }

      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      _lastRevision = jsonResponse["revision"];

      return jsonResponse["element"];
    } on Exception {
      _backendStatus = BackendStatus.unavailable;
      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> updateTask(
      String uid, String requsetBody) async {
    if (_backendStatus == BackendStatus.unavailable) return null;

    try {
      var url = Uri.parse(_baseUrl + _updateTaskUrl + uid);

      requsetBody = '{"element" : $requsetBody }';

      var response = await http.put(url, headers: _headers, body: requsetBody);

      if (response.statusCode != 200) {
        return null;
      }

      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      _lastRevision = jsonResponse["revision"];
      return jsonResponse["element"];
    } on Exception {
      _backendStatus = BackendStatus.unavailable;
      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> deleteTask(String uid) async {
    if (_backendStatus == BackendStatus.unavailable) return null;

    try {
      var url = Uri.parse(_baseUrl + _deleteTaskUrl + uid);

      var response = await http.delete(url, headers: _headers);

      if (response.statusCode != 200) {
        return null;
      }

      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      _lastRevision = jsonResponse["revision"];
      return jsonResponse["element"];
    } on Exception {
      _backendStatus = BackendStatus.unavailable;
      return null;
    }
  }
}
