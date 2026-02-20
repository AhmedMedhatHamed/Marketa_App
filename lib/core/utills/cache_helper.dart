import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveData({
    required String key,
    required bool value,
  }) async {
    await _prefs.setBool(key, value);
  }

  static bool getData({
    required String key,
  }) {
    return _prefs.getBool(key) ?? false;
  }
}