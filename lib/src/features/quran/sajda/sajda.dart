import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../animations/TransitionAnimation.dart';
import '../../../models/sajda/sajda.dart';
import '../../../shared/widgets/ayahTile.dart';
import '../../../shared/widgets/listLoader.dart';
import '../../../shared/widgets/screenLoader.dart';
import 'sajdaIndex.dart';

class SajdaList extends StatefulWidget {
  @override
  _SajdaListState createState() => _SajdaListState();
}

class _SajdaListState extends State<SajdaList> {
  final _sajda = SajdaModel();
  Future? _future;
  Future? _futureArabic;

  @override
  void initState() {
    super.initState();
    _future = _sajda.loadSajdaJson('sajdaEnglish.json');
    _futureArabic = _sajda.loadSajdaJson('sajdaArabic.json');
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

  FutureBuilder<SajdaL> futureWidget() {
    return FutureBuilder<SajdaL>(
        future: _future!.then((value) => value as SajdaL),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: EdgeInsets.only(bottom: 50),
              child: AnimationLimiter(
                child: ListView.builder(
                    itemCount: snapshot.data!.sajdas!.length,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredList(
                        position: index + 3,
                        duration: const Duration(milliseconds: 500),
                        child: SlideAnimation(
                          horizontalOffset: 50.0,
                          child: FadeInAnimation(
                            child: AyahTile(
                              ayahArabicName:
                                  snapshot.data!.sajdas![index].sajdaArabicName,
                              ayahEnglishName: snapshot.data!.sajdas![index]
                                  .sajdaTransliterationName,
                              ayahIndex:
                                  snapshot.data!.sajdas![index].sajdaNumber,
                              revelationType:
                                  snapshot.data!.sajdas![index].revelationType,
                              numberOfAyah: snapshot
                                  .data!.sajdas![index].sajdanumberInSurah,
                              onTap: () {
                                _route(
                                    screen: FutureBuilder<SajdaL>(
                                        future: _futureArabic!
                                            .then((value) => value as SajdaL),
                                        builder: (context, snapshotArabic) {
                                          if (snapshotArabic.hasData) {
                                            return SajdaIndex(
                                              index: index,
                                              sajdaEnglish:
                                                  snapshot.data!.sajdas,
                                              sajdaArabic:
                                                  snapshotArabic.data!.sajdas,
                                            );
                                          } else if (!snapshot.hasData) {
                                            return ScreenLoader(
                                              screenName:
                                                  "${snapshot.data!.sajdas![index].sajdaTransliterationName} is loading",
                                            );
                                          } else {
                                            return ScreenLoader(
                                              screenName:
                                                  "${snapshot.data!.sajdas![index].sajdaTransliterationName} is loading",
                                            );
                                          }
                                        }));
                              },
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            );
          } else if (!snapshot.hasData) {
            return AyahLoader();
          } else {
            return AyahLoader();
          }
        });
  }
}
