import 'package:flutter/material.dart';

import '../../../../core/utils/functions.dart';
import '../../../../models/surah/ayah.dart';
import '../../../../models/surah/surah.dart';
import '../../../../shared/res/stylesheet/surahIndexStyle.dart';
import '../../../../shared/widgets/app_bar/custom_app_bar.dart';
import '../../../../shared/widgets/ayahDetail.dart';

// ignore: must_be_immutable
class SurahIndexScreen extends StatelessWidget {
  final int? index;
  final List<Surah>? surahs;
  final List<Ayah>? ayahEnglishText;
  final List<Ayah>? ayahArabicText;

  SurahIndexScreen(
      {this.ayahArabicText, this.surahs, this.index, this.ayahEnglishText});

  ScrollController _sc = ScrollController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: KWidgetsCustomAppBar(
          title: "${surahs![index!].englishTransliterationName}",
        ),
        body: Container(
            child: Container(
                color: Theme.of(context).primaryColor,
                child: NestedScrollView(
                  headerSliverBuilder: (context, bool boxScrolled) {
                    return [
                      AyahDetail(
                        size: size,
                        ayahEnglishName: surahs![index!].englishName,
                        ayahTransliterationName: surahs![index!].englishName,
                        ayahName: surahs![index!].arabicName,
                        ayahIndex: surahs![index!].number,
                        numberOfAyah: surahs![index!].ayahs!.length,
                        revelationType: surahs![index!].revelationType,
                        ayahArabicName: surahs![index!].arabicName,
                      )
                    ];
                  },
                  body: Container(
                    child: Scrollbar(
                      controller: _sc,
                      child: ListView.builder(
                          itemCount: ayahArabicText!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 30, top: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 15, right: 15),
                                    height: 40,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                        color: containerSstyleColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: CircleAvatar(
                                                radius: 12,
                                                backgroundColor:
                                                    Color(0xFFBE96FF),
                                                child: Center(
                                                  child: Text(
                                                    "${ayahEnglishText![index].ayahIndex}",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              )),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                icons(
                                                    imgPath:
                                                        "assets/images/share.png",
                                                    onTap: () {
                                                      KFunctions.share(
                                                          '${ayahArabicText![index].ayahText} \n ${ayahEnglishText![index].ayahText}',
                                                          'Quran ${index + 1}',
                                                          'v${ayahEnglishText![index].ayahIndex}');
                                                      // _functions.showToast(context);
                                                    }),
                                                GestureDetector(
                                                  onTap: () {
                                                    KFunctions.copy(
                                                        '${ayahArabicText![index].ayahText} \n ${ayahEnglishText![index].ayahText}',
                                                        'Quran ${index + 1}',
                                                        'v${ayahEnglishText![index].ayahIndex}',
                                                        context);
                                                  },
                                                  child: Icon(
                                                    Icons.copy_outlined,
                                                    color: Colors.grey,
                                                    size: 21,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    margin: EdgeInsets.only(
                                        right: 15, left: 15, top: 15),
                                    padding:
                                        EdgeInsets.only(right: 9, left: 10),
                                    child: Text(
                                      "ََ${ayahArabicText![index].ayahText}",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: height * 0.035),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  ExpansionTile(
                                    childrenPadding:
                                        EdgeInsets.only(left: 20, right: 10),
                                    trailing: Text(""),
                                    title: Row(
                                      children: [
                                        Text(
                                          "translation",
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            fontFamily: 'PMedium',
                                            fontSize: 17,
                                          ),
                                        ),
                                        RotatedBox(
                                          quarterTurns: 3,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.arrow_back_ios,
                                              size: 15,
                                              color:
                                                  Colors.white.withOpacity(0.5),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "${ayahEnglishText![index].ayahText}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'PLight',
                                            fontSize: 15,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                ))));
  }

  GestureDetector icons({String? imgPath, Function? onTap}) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: ImageIcon(
          AssetImage(
            "$imgPath",
          ),
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
