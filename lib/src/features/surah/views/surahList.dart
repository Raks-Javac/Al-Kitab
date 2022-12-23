import 'package:Al_Kitab/src/animations/TransitionAnimation.dart';
import 'package:Al_Kitab/src/models/surah/surah.dart';
import 'package:Al_Kitab/src/features/surah/widgets/SurahIndex.dart';
import 'package:Al_Kitab/src/shared/widgets/ayahTile.dart';
import 'package:Al_Kitab/src/shared/widgets/listLoader.dart';
import 'package:Al_Kitab/src/shared/widgets/screenLoader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SurahList extends StatefulWidget {
  @override
  SurahListState createState() => SurahListState();
}

class SurahListState extends State<SurahList> {
  Future? _ftArabic;
  Future? _ftEnglish;
  final surahLoader = new SurahModel();
  final sr = new Surah();

  @override
  void initState() {
    _ftArabic = surahLoader.loadSurahJson('surahArabic.json');
    _ftEnglish = surahLoader.loadSurahJson('surahEnglish.json');
    super.initState();
  }

  Widget futureWidget() {
    return new FutureBuilder<SurahL>(
      future: _ftArabic!.then((value) => value as SurahL),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return AnimationLimiter(
            child: ListView.builder(
                itemCount: snapshot.data!.surahs!.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index + 3,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                      horizontalOffset: 50.0,
                      child: FadeInAnimation(
                        child: AyahTile(
                          ayahIndex: snapshot.data!.surahs![index].number,
                          ayahEnglishName: snapshot
                              .data!.surahs![index].englishTransliterationName,
                          ayahArabicName:
                              snapshot.data!.surahs![index].arabicName,
                          revelationType:
                              snapshot.data!.surahs![index].revelationType,
                          numberOfAyah:
                              snapshot.data!.surahs![index].ayahs!.length,
                          onTap: () {
                            _route(
                              screen: FutureBuilder<SurahL>(
                                  future: _ftEnglish!.then((value) => value as SurahL),
                                  builder: (context, snapshotEnglish) {
                                    if (snapshotEnglish.hasData) {
                                      return SurahIndexScreen(
                                        index: index,
                                        surahs: snapshot.data!.surahs,
                                        ayahArabicText:
                                            snapshot.data!.surahs![index].ayahs,
                                        ayahEnglishText: snapshotEnglish
                                            .data!.surahs![index].ayahs,
                                      );
                                    } else if (snapshot.hasError) {
                                      return ScreenLoader(
                                          screenName:
                                              "${snapshotEnglish.data!.surahs![index].englishTransliterationName} is loading..");
                                    } else {
                                      return ScreenLoader(
                                          screenName:
                                              "${snapshotEnglish.data!.surahs![index].englishTransliterationName} is loading..");
                                    }
                                  }),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }),
          );
        } else if (snapshot.hasError) {
          return new AyahLoader();
        } else {
          return AyahLoader();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return futureWidget();
  }

  _route({Widget? screen}) {
    return Navigator.push(
      context,
      PreviewSlideRoute(
        duration: 200,
        preview: screen,
      ),
    );
  }
}
