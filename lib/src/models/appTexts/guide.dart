class Guide {
  int guideIndex;
  String guideTitle;
  String guideText;
  Guide({this.guideIndex, this.guideText, this.guideTitle});
}

class GuideList {
  List<Guide> _guideTile = [
    Guide(
      guideIndex: 1,
      guideTitle: "Introduction",
      guideText:
          "This view is found in the drawer menu and it contains the main objective of the app which indirectly welcomes you.",
    ),
    Guide(
        guideIndex: 2,
        guideTitle: "Surah and Sajda screen",
        guideText:
            "This view contains the list of surah and sajda in the Holy Qur'an respectively with each screen containing a detailed infomation e.g Place of revelation, number of ayah(verses) in that particular chapter and so on."),
    Guide(
      guideIndex: 3,
      guideTitle: "Share App",
      guideText:
          "Since the Al-Kitab app is an open source app ,you can make use of the infomation used in the production of the app while also being able to share using github and other platforms .In this screen , the Rate us & Feedback is encapsulated Kindly rate us and comment on changes you would want in the app which would be attended to repectively",
    ),
    Guide(
      guideIndex: 4,
      guideTitle: "Rate & Feedback",
      guideText:
          "Kindly rate us and comment on changes you would want in the app which would be attended to repectively.This screen can be found in \n app drawer > Share App > Rate us & Feedback",
    ),
    Guide(
      guideIndex: 5,
      guideTitle: "Version Check",
      guideText:
          "You can check the current version of the Al-Kitab app in the following access path in the app \n apprawer > Share App > Version Check",
    ),
  ];

  List<Guide> guideList() => _guideTile;
}
