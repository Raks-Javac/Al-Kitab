import 'dart:math';

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

  loadIndex() {
    if (KAppConstants.surahArabicList != null ||
        KAppConstants.surahEnglishList != null) {
      if (KAppConstants.randomAyahIndex == null ||
          KAppConstants.randomSurahIndex == null) {
        KAppConstants.randomSurahIndex =
            Random().nextInt(KAppConstants.surahEnglishList!.surahs!.length);
        KAppConstants.randomAyahIndex = Random().nextInt(KAppConstants
            .surahEnglishList!
            .surahs![KAppConstants.randomSurahIndex!]
            .ayahs!
            .length);
      }
    }
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
