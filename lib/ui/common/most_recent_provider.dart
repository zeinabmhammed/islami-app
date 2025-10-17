import 'package:flutter/material.dart';
import 'package:islami/ui/common/most_recent_shared_preferences.dart';

class MostRecentProvider extends ChangeNotifier {
  bool? _isFirstTime;

  bool? get isFirstTime => _isFirstTime;

  Future<void> loadFirstTimeFlag() async {
    final prefs = MostRecentSharedPreferences.getInstance();
    _isFirstTime = prefs.getBool('isFirstTime') ?? true;
    notifyListeners();
  }

  Future<void> setFirstTimeFlag(bool value) async {
    final prefs = MostRecentSharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', value);
    _isFirstTime = value;
    notifyListeners();
  }
}
