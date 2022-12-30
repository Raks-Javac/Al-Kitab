import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/functions.dart';
import '../../../models/surah/surah.dart';

const String savedIndexKey = "savedKey";

class HomeProvider extends ChangeNotifier {
  loadInitState() async {
    await loadData();
    await lastReadSurahIndex();
  }

  int? savedSurahIndex;
  lastReadSurahIndex() async {
    savedSurahIndex = await getInitialIndexFromStore();
    notifyListeners();
  }

  static Future<int?> getInitialIndexFromStore() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(savedIndexKey);
  }

  saveKeyToStore(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(savedIndexKey, index);
  }

  final surahLoader = new SurahModel();

  loadData() async {
    if (KAppConstants.surahArabicList == null ||
        KAppConstants.surahEnglishList == null) {
      KAppConstants.surahArabicList =
          await surahLoader.loadSurahJson('surahArabic.json');
      KAppConstants.surahEnglishList =
          await surahLoader.loadSurahJson('surahEnglish.json');

      logConsole(KAppConstants.surahArabicList);
    }
  }
}
