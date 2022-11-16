import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';

class Sajda {
  final String? sajdaText;
  final int? sajdaNumber;
  final String? sajdaArabicName;
  final String? sajdaTransliterationName;
  final String? sajdaEnglishName;
  final String? revelationType;
  final int? sajdanumberOfAyahs;
  final int? sajdanumberInSurah;
  final int? sajdaJuzIndex;
  final int? sajdaRukuIndex;
  final int? sajdaManzilIndex;
  Sajda({
    this.revelationType,
    this.sajdaArabicName,
    this.sajdaEnglishName,
    this.sajdaJuzIndex,
    this.sajdaManzilIndex,
    this.sajdaNumber,
    this.sajdaRukuIndex,
    this.sajdaText,
    this.sajdaTransliterationName,
    this.sajdanumberInSurah,
    this.sajdanumberOfAyahs,
  });

  factory Sajda.fromJSON(Map<String, dynamic> json) {
    return Sajda(
        revelationType: json['surah']['revelationType'],
        sajdaText: json['text'],
        sajdaArabicName: json['surah']['name'],
        sajdaEnglishName: json['surah']['englishNameTranslation'],
        sajdaJuzIndex: json['juz'],
        sajdaNumber: json['surah']['number'],
        sajdaManzilIndex: json['manzil'],
        sajdaRukuIndex: json['ruku'],
        sajdanumberInSurah: json['numberInSurah'],
        sajdaTransliterationName: json['surah']['englishName'],
        sajdanumberOfAyahs: json['surah']['numberOfAyahs']);
  }
}

class SajdaL {
  List<Sajda>? sajdas;

  SajdaL({this.sajdas});

  factory SajdaL.fromJSON(Map<String, dynamic> surahJson) {
    Iterable surahList = surahJson['ayahs'];
    List<Sajda> sajdaL = surahList.map((e) => Sajda.fromJSON(e)).toList();
    return SajdaL(sajdas: sajdaL);
  }
}

class SajdaModel extends Model {
  Future<String> _loadSajda(String jsonPath) async {
    return await rootBundle.loadString('json/sajda/$jsonPath');
  }

  Future<SajdaL> _loadSajdas(String jsonPath) async {
    String jsonString = await _loadSajda(jsonPath);
    final jsonResponse = json.decode(jsonString);
    return SajdaL.fromJSON(jsonResponse);
  }

  Future<SajdaL> loadSajdaJson(String jsonPath) => _loadSajdas(jsonPath);
}
