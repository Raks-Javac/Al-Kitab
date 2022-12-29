class DailyReminderObject {
  final String? surahEnglishName;
  final String? surahChapter;
  final String? surahVerse;
  final String? surahEnglishTeext;
  DailyReminderObject({
    this.surahChapter,
    this.surahEnglishName,
    this.surahEnglishTeext,
    this.surahVerse,
  });

  List<DailyReminderObject> dailyReminderList() {
    return [
      DailyReminderObject(
        surahChapter: "2",
        surahEnglishName: "Al-Baqara",
        surahEnglishTeext:
            "[for] it is they who have taken error in exchange for guidance; and neither has their bargain brought them gain, nor have they found guidance [elsewhere].",
        surahVerse: "23",
      ),
      DailyReminderObject(
        surahChapter: "35",
        surahEnglishName: "Al-Maaida",
        surahEnglishTeext: "So let not this present life deceive you",
        surahVerse: "5",
      ),
      DailyReminderObject(
        surahChapter: "2",
        surahEnglishName: "Al-Baqara",
        surahEnglishTeext:
            "And we will surely test you with something of fear and hunger and a loss of wealth and lives and fruits, but give good tidings to the patient",
        surahVerse: "155",
      ),
      DailyReminderObject(
        surahChapter: "94",
        surahEnglishName: "Ash-Sharh",
        surahEnglishTeext:
            "So verily, with the hardship, there is relief. With the hardship, there is relief. ",
        surahVerse: "5",
      ),
      DailyReminderObject(
        surahChapter: "2",
        surahEnglishName: "Al-Baqara",
        surahEnglishTeext:
            "And seek help through patience and prayer. And indeed, it is difficult except for the humbly submissive [to Allah]",
        surahVerse: "45",
      ),
      DailyReminderObject(
        surahChapter: "65",
        surahEnglishName: "At-Talaaq",
        surahEnglishTeext:
            "And for those who fear Allah, He will make their path easy",
        surahVerse: "4",
      ),
    ];
  }
}
