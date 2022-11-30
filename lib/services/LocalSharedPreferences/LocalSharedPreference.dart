import 'package:shared_preferences/shared_preferences.dart';

class LocalSharedPreference {
  static SharedPreferences? _preferences;
  static const SHARED_MEM_KEY_LANGUAGE = "Language";
  static const SHARED_MEM_KEY_DEVICE_TOKEN = "token";
  static const SHARED_MEM_KEY_FIREBASE_TOKEN = "FirebaseToken";

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static setString(String key, String value) async {
    await _preferences!.setString(key, value);
  }

  static getString(String key) {
    if (_preferences!.getString(key) != null) {
      return _preferences!.getString(key);
    } else {
      return "";
    }
  }

  static setInteger(String key, int value) async {
    await _preferences!.setInt(key, value);
  }

  static getInteger(String key) {
    if (_preferences!.getInt(key) != null) {
      return _preferences!.getInt(key);
    } else {
      return 0;
    }
  }

  static setList(String key, List<String> value) async {
    await _preferences!.setStringList(key, value);
  }

  static getList(String key) {
    if (_preferences!.getStringList(key) != null) {
      return _preferences!.getStringList(key);
    } else {
      return [];
    }
  }

  static setDouble(String key, double value) async {
    await _preferences!.setDouble(key, value);
  }

  static getDouble(String key) => _preferences!.getDouble(key);

  static setBool(String key, bool value) async {
    await _preferences!.setBool(key, value);
  }

  static getBool(String key) => _preferences!.getBool(key);

  static removeShared(String key) async {
    await _preferences!.remove(key);
  }

  static clearSharedPreferences() async {
    await _preferences!.clear();
  }
}
