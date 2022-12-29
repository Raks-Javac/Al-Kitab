import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../core/navigation/navigation_1.0.dart';
import '../../../../core/utils/constants.dart';
import '../../../../models/surah/surah.dart';
import '../../../../shared/widgets/ayahTile.dart';
import '../widgets/SurahIndex.dart';

class SurahList extends StatefulWidget {
  @override
  SurahListState createState() => SurahListState();
}

class SurahListState extends State<SurahList> {
  final surahLoader = new SurahModel();

  @override
  void initState() {
    loadSurahs();
    super.initState();
  }

  loadSurahs() async {
    if (KAppConstants.surahArabicList == null ||
        KAppConstants.surahEnglishList == null) {
      KAppConstants.surahArabicList =
          await surahLoader.loadSurahJson('surahArabic.json');
      KAppConstants.surahEnglishList =
          await surahLoader.loadSurahJson('surahEnglish.json');
    }
  }

  Widget futureWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: AnimationLimiter(
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: KAppConstants.surahArabicList!.surahs!.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index + 3,
                duration: const Duration(milliseconds: 500),
                child: SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: AyahTile(
                      ayahIndex:
                          KAppConstants.surahArabicList!.surahs![index].number,
                      ayahEnglishName: KAppConstants.surahArabicList!
                          .surahs![index].englishTransliterationName,
                      ayahArabicName: KAppConstants
                          .surahArabicList!.surahs![index].arabicName,
                      revelationType: KAppConstants
                          .surahArabicList!.surahs![index].revelationType,
                      numberOfAyah: KAppConstants
                          .surahArabicList!.surahs![index].ayahs!.length,
                      onTap: () {
                        KNavigator.navigateToRoute(
                          SurahIndexScreen(
                            index: index,
                            surahs: KAppConstants.surahArabicList!.surahs,
                            ayahArabicText: KAppConstants
                                .surahArabicList!.surahs![index].ayahs,
                            ayahEnglishText: KAppConstants
                                .surahEnglishList!.surahs![index].ayahs,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return futureWidget();
  }
}
