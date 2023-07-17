import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_list/helper_functions.dart';
import 'package:todo_list/logger.dart';

class Settings {
  Settings(this._remoteConfig);

  late GetStorage _box;

  FirebaseRemoteConfig? _remoteConfig;

  Future<void> init() async {
    await GetStorage.init('Settings');
    _box = GetStorage('Settings');

    if (!_box.hasData("useLocalStorage")) {
      _box.write("useLocalStorage", false);
    }

    if (_remoteConfig != null) {
      _remoteConfig?.setDefaults({"ImportanceColor": "#ff3b30"});

      await _remoteConfig?.fetchAndActivate();

      logger.i("ImportanceColorRemote ${_remoteConfig!.getString("ImportanceColor")}");
    }

    logger.i("ImportanceColor $importanceColor");
  }

  Color get importanceColor =>
      HexColor(_remoteConfig != null ? _remoteConfig!.getString("ImportanceColor") : "#ff3b30");

  bool isUseLocalStorage() => _box.read("useLocalStorage");

  void setNewLocalStorageUse(bool newValue) => _box.write("useLocalStorage", newValue);
}
