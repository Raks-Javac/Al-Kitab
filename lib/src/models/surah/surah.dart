import 'dart:convert';

import 'package:Al_Kitab/src/models/surah/ayah.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';

class Surah {
  final int number;
  final String arabicName;
  final String englishTransliterationName;
  final String englishName;
  final String revelationType;
  final List<Ayah> ayahs;
  Surah({
    this.arabicName,
    this.ayahs,
    this.number,
    this.englishName,
    this.revelationType,
    this.englishTransliterationName,
  });
  factory Surah.fromJson(Map<String, dynamic> surahJson) {
    Iterable ayahs = surahJson['ayahs'];
    List<Ayah> ayahList = ayahs.map((e) => Ayah.fromJSON((e))).toList();
    return Surah(
      arabicName: surahJson['name'],
      englishTransliterationName: surahJson['englishName'],
      englishName: surahJson['englishNameTranslation'],
      revelationType: surahJson['revelationType'],
      number: surahJson['number'],
      ayahs: ayahList,
    );
  }
}

class SurahL {
  List<Surah> surahs;

  SurahL({this.surahs});

  factory SurahL.fromJSON(Map<String, dynamic> surahJson) {
    Iterable surahList = surahJson['surahs'];
    List<Surah> surahL = surahList.map((e) => Surah.fromJson(e)).toList();
    return SurahL(surahs: surahL);
  }
}

class SurahModel extends Model {
  Future<String> _loadSurah(String jsonPath) async {
    return await rootBundle.loadString('json/surah/$jsonPath');
  }

  Future wait(int seconds) {
    return new Future.delayed(Duration(seconds: seconds), () => {});
  }

  Future<SurahL> _loadSurahs(String jsonPath) async {
    // wait(2);
    String jsonString = await _loadSurah(jsonPath);
    final jsonResponse = json.decode(jsonString);
    return SurahL.fromJSON(jsonResponse);
  }

  Future<SurahL> loadSurahJson(String jsonPath) => _loadSurahs(jsonPath);
}
