import '../../../core/navigation/navigation_1.0.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../animations/TransitionAnimation.dart';
import '../../../core/utils/constants.dart';
import '../../../models/sajda/sajda.dart';
import '../../../shared/widgets/ayahTile.dart';
import 'sajdaIndex.dart';

class SajdaList extends StatefulWidget {
  @override
  _SajdaListState createState() => _SajdaListState();
}

class _SajdaListState extends State<SajdaList> {
  final _sajda = SajdaModel();

  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    if (KAppConstants.sajdaArabicList == null ||
        KAppConstants.sajdaEnglishList == null) {
      KAppConstants.sajdaArabicList =
          await _sajda.loadSajdaJson('sajdaArabic.json');
      KAppConstants.sajdaEnglishList =
          await _sajda.loadSajdaJson('sajdaEnglish.json');
    }
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

  Widget futureWidget() {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: AnimationLimiter(
        child: ListView.builder(
            itemCount: KAppConstants.sajdaEnglishList!.sajdas!.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index + 3,
                duration: const Duration(milliseconds: 500),
                child: SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: AyahTile(
                      ayahArabicName: KAppConstants
                          .sajdaEnglishList!.sajdas![index].sajdaArabicName,
                      ayahEnglishName: KAppConstants.sajdaEnglishList!
                          .sajdas![index].sajdaTransliterationName,
                      ayahIndex: KAppConstants
                          .sajdaEnglishList!.sajdas![index].sajdaNumber,
                      revelationType: KAppConstants
                          .sajdaEnglishList!.sajdas![index].revelationType,
                      numberOfAyah: KAppConstants
                          .sajdaEnglishList!.sajdas![index].sajdanumberInSurah,
                      onTap: () {
                        KNavigator.navigateToRoute(SajdaIndex(
                          index: index,
                          sajdaEnglish: KAppConstants.sajdaEnglishList!.sajdas,
                          sajdaArabic: KAppConstants.sajdaArabicList!.sajdas,
                        ));
                      },
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
