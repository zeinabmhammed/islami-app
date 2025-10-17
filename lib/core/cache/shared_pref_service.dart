import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static late SharedPreferences pref;

  static Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }

  static Future<bool> saveBoolean(String key, bool value) {
    return pref.setBool(key, value);
  }

  static bool? getBoolean(String key) {
    return pref.getBool(key);
  }

  static Future<void> removeData(String key) async {
    await pref.remove(key);
  }
}
