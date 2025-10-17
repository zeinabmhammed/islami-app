import 'package:shared_preferences/shared_preferences.dart';

class MostRecentSharedPreferences {
  static MostRecentSharedPreferences? _mostRecentProvider;
  static late SharedPreferences _sharedPreferences;

  MostRecentSharedPreferences._();

  static Future<void> init() async {
    if (_mostRecentProvider == null) {
      _mostRecentProvider = MostRecentSharedPreferences._();
      await _mostRecentProvider!._initSharedPreferences();
    }
  }

  static MostRecentSharedPreferences getInstance() {
    if (_mostRecentProvider == null) {
      throw Exception("Make sure to call init() before using getInstance()");
    }
    return _mostRecentProvider!;
  }

  Future<void> _initSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setString(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  String? getString(String key) {
    return _sharedPreferences.getString(key);
  }

  Future<void> setBool(String key, bool value) async {
    await _sharedPreferences.setBool(key, value);
  }

  bool? getBool(String key) {
    return _sharedPreferences.getBool(key);
  }

  Future<void> clear() async {
    await _sharedPreferences.clear();
  }
}
