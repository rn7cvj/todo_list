import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_list/helper_functions.dart';
import 'package:todo_list/logger.dart';

class Settings {
  Settings(this._remoteConfig);

  late GetStorage _box;

  FirebaseRemoteConfig? _remoteConfig;

  Observable<Color> importanceColor = Observable<Color>(HexColor("#ff3b30"));

  Future<void> init() async {
    await GetStorage.init('Settings');
    _box = GetStorage('Settings');

    if (!_box.hasData("useLocalStorage")) {
      _box.write("useLocalStorage", false);
    }

    if (_remoteConfig != null) {
      await _remoteConfig!.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ));

      _remoteConfig?.setDefaults({"ImportanceColor": "#ff3b30"});

      await _remoteConfig?.fetchAndActivate();

      _remoteConfig?.onConfigUpdated.listen((event) async {
        await _remoteConfig?.activate();
        logger.i(_remoteConfig?.getString('ImportanceColor'));
        runInAction(() => importanceColor.value = HexColor(_remoteConfig!.getString('ImportanceColor')));
      });

      logger.i("ImportanceColorRemote ${_remoteConfig!.getString("ImportanceColor")}");
    }

    logger.i("ImportanceColor $importanceColor");
  }

  bool isUseLocalStorage() => _box.read("useLocalStorage");

  void setNewLocalStorageUse(bool newValue) => _box.write("useLocalStorage", newValue);
}
