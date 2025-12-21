import 'package:flutter/material.dart';
import '../../../../core/widget/common/most_recent_shared_preferences.dart';
import '../../../../data/local_data_source/chapter.dart';

class MostRecentProvider extends ChangeNotifier {
  late MostRecentSharedPreferences mostRecentSharedPreferences;
  late List<Chapter> _mostRecentChapters;
  List<Chapter> get mostRecentChapters => _mostRecentChapters;

  MostRecentProvider() {
    mostRecentSharedPreferences = MostRecentSharedPreferences.getInstance();
    _mostRecentChapters = [];
    refreshMostRecentChapters();
  }

  void saveChapter(Chapter chapter) async {
    await mostRecentSharedPreferences.savedChapter(chapter.chapterIndex);
    refreshMostRecentChapters();
    notifyListeners();
  }

  void refreshMostRecentChapters() {
    _mostRecentChapters = [];

    var savedChapterIndicesList =
    mostRecentSharedPreferences.getMostRecentChapters();

    savedChapterIndicesList = savedChapterIndicesList.toSet().toList();

    savedChapterIndicesList.forEach((chapterIndex) {
      var chapter = Chapter.chapters[chapterIndex - 1];
      _mostRecentChapters.add(chapter);
    });

    notifyListeners();
  }

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