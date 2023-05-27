import 'package:shared_preferences/shared_preferences.dart';

import '../common.dart';

class StorageService {
  late final SharedPreferences preferences;

  // * StorageService init()
  Future<StorageService> init() async {
    preferences = await SharedPreferences.getInstance();
    return this;
  }

  // * setBool
  Future<bool> setBool(String key, bool value) async {
    return await preferences.setBool(key, value);
  }

  // * setString
  Future<bool> setString(String key, String value) async {
    return await preferences.setString(key, value);
  }

  // * getDeviceFirstOpen
  bool getDeviceFirstOpen() {
    return preferences.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ??
        false;
  }

  // * getIsLoggedIn
  bool getIsLoggedIn() {
    return preferences.getString(AppConstants.STORAGE_USER_TOKEN_KEY) == null
        ? false
        : true;
  }

  // * getIsLoggedIn
  Future<bool> remove(String key) {
    return preferences.remove(key);
  }
}
