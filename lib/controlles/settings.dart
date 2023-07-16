import 'package:get_storage/get_storage.dart';

class Settings {
  late GetStorage _box;

  Future<void> init() async {
    await GetStorage.init('Settings');
    _box = GetStorage('Settings');

    if (!_box.hasData("useLocalStorage")) {
      _box.write("useLocalStorage", false);
    }
  }

  bool isUseLocalStorage() => _box.read("useLocalStorage");

  void setNewLocalStorageUse(bool newValue) =>
      _box.write("useLocalStorage", newValue);
}
