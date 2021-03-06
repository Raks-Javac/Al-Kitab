import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class JuzModel {
  final int juzNumber;
  final List<JuzAyahs> juzAyahs;

  JuzModel({this.juzAyahs, this.juzNumber});

  factory JuzModel.fromJSON(Map<String, dynamic> json) {
    Iterable juzAyahs = json['data']['ayahs'];
    List<JuzAyahs> juzAyahsList =
        juzAyahs.map((e) => JuzAyahs.fromJSON(e)).toList();

    return JuzModel(juzAyahs: juzAyahsList, juzNumber: json['data']['number']);
  }
}

class JuzAyahs {
  final String ayahsText;
  final int ayahNumber;
  final String surahName;

  JuzAyahs({this.ayahsText, this.surahName, this.ayahNumber});

  factory JuzAyahs.fromJSON(Map<String, dynamic> json) {
    return JuzAyahs(
        ayahNumber: json['number'],
        ayahsText: json['text'],
        surahName: json['surah']['name']);
  }
}

class QuranAPI {
  Future<JuzModel> getJuzz(int index) async {
    try {
      final response = await http
          .get("http://api.alquran.cloud/v1/juz/$index/quran-uthmani");
      if (response.statusCode == 200) {
        return JuzModel.fromJSON(
          json.decode(
            response.body,
          ),
        );
      } else {
        throw Exception("Cant load");
      }
    } on Exception catch (SocketException) {
      print("Unknown exception $SocketException");
    } catch (e) {
      return e;
    }
  }
}
