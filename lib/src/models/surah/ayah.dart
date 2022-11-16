class Ayah {
  int? ayahIndex;
  String? ayahText;
  Ayah({this.ayahIndex, this.ayahText});

  factory Ayah.fromJSON(Map<String, dynamic> ayahJson) {
    return Ayah(
        ayahIndex: ayahJson['numberInSurah'], ayahText: ayahJson['text']);
  }
}
