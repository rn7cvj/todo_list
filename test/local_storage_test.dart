import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/data/storage/storage.dart';
import 'package:todo_list/modals/task.dart';

import 'data/task_lists.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('plugins.flutter.io/path_provider');
  void setUpMockChannels(MethodChannel channel) {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall? methodCall) async {
        if (methodCall?.method == 'getApplicationDocumentsDirectory') {
          return '.';
        } else if (methodCall?.method == 'getDeviceInfo') {
          return 'null';
        }
        return null;
      },
    );
  }

  group('Local Storage Test', () {
    setUpAll(() async {
      setUpMockChannels(channel);

      GetIt.I.registerSingleton<IStorage>(Storage());
      await GetIt.I<IStorage>().init();
    });
    test('Add task', () async {
      IStorage storage = GetIt.I<IStorage>();
      await storage.addNewTask(initList.first.toJson());
      Map<String, dynamic>? savedTask =
          await storage.getTask(initList.first.id);
      expect(Task.fromJson(savedTask!).id == initList.first.id, true);
    });

    test('Update task', () async {
      IStorage storage = GetIt.I<IStorage>();

      await storage.updateTask(initList.first.id, editTask.toJson());
      Map<String, dynamic>? editTaskStorage =
          await storage.getTask(initList.first.id);
      expect(Task.fromJson(editTaskStorage!).text == editTask.text, true);
    });

    test('Remove task', () async {
      IStorage storage = GetIt.I<IStorage>();
      await storage.deleteTask(initList.first.id);

      List<Map<String, dynamic>>? removedList = await storage.getAllTasks();

      removedList = removedList ?? [];

      expect(removedList.isEmpty, true);
    });
  });
}
