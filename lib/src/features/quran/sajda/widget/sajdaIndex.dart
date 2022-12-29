import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/functions.dart';
import '../../../../models/sajda/sajda.dart';
import '../../../../shared/res/res.dart';
import '../../../../shared/widgets/app_bar/custom_app_bar.dart';
import '../../../../shared/widgets/ayahDetail.dart';

class SajdaIndex extends StatelessWidget {
  final function = new KFunctions();
  final int? index;
  final List<Sajda>? sajdaEnglish;
  final List<Sajda>? sajdaArabic;
  SajdaIndex({this.sajdaEnglish, this.index, this.sajdaArabic});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: KWidgetsCustomAppBar(
        title: '${sajdaEnglish![index!].sajdaTransliterationName}',
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: NestedScrollView(
          headerSliverBuilder: (context, bool boxScrolled) {
            return [
              AyahDetail(
                size: size,
                ayahEnglishName: sajdaEnglish![index!].sajdaEnglishName,
                ayahTransliterationName: sajdaEnglish![index!].sajdaArabicName,
                ayahName: sajdaEnglish![index!].sajdaArabicName,
                ayahIndex: index,
                numberOfAyah: sajdaEnglish![index!].sajdanumberOfAyahs,
                revelationType: sajdaEnglish![index!].revelationType,
                ayahArabicName: sajdaEnglish![index!].sajdaArabicName,
              ),
            ];
          },
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                addVerticalSpaing(20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 13, right: 13, top: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          KFunctions.copy(
                              '${sajdaArabic![index!].sajdaText} \n ${sajdaEnglish![index!].sajdaText}',
                              '',
                              '',
                              context);
                        },
                        child: Icon(
                          Icons.copy,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 10),
                          child: Text(
                            "${sajdaArabic![index!].sajdaText}",
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 24,
                                  fontFamily: KTypography.lightFontfamilyName,
                                ),
                          ),
                        ),
                      ),
                      Container(
                        height: 43,
                        width: 43,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/images/label.png",
                              ),
                              fit: BoxFit.cover),
                        ),
                        child: Center(
                          child: Text(
                              "${sajdaEnglish![index!].sajdanumberInSurah}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Colors.black,
                                      fontSize: 10.sp,
                                      fontFamily:
                                          KTypography.boldFontFamilyName)),
                        ),
                      ),
                    ],
                  ),
                ),
                addVerticalSpaing(20),
                expansionTile(context),
                addVerticalSpaing(20),
                Center(
                  child: Container(
                    // width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _divider(),
                            _width(),
                            Text(
                              "Sajda Info",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: 18, fontFamily: "PBold"),
                            ),
                            _width(),
                            _divider(),
                          ],
                        ),
                        _spacer(),
                        Text(
                          "Ayah :  ${sajdaEnglish![index!].sajdanumberInSurah}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 15, fontFamily: "PLight"),
                        ),
                        _spacer2(),
                        Text(
                          "juz :  ${sajdaEnglish![index!].sajdaJuzIndex}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 15, fontFamily: "PLight"),
                        ),
                        _spacer2(),
                        Text(
                          "ruku :  ${sajdaEnglish![index!].sajdaRukuIndex}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 15, fontFamily: "PLight"),
                        ),
                      ],
                    ),
                  ),
                ),
                _spacer(),
              ],
            ),
          )),
    );
  }

  SizedBox _spacer2() {
    return SizedBox(
      height: 5,
    );
  }

  SizedBox _spacer() {
    return SizedBox(
      height: 20,
    );
  }

  SizedBox _width() {
    return SizedBox(
      width: 10,
    );
  }

  SizedBox _divider() {
    return SizedBox(
      width: 90,
      child: Divider(
        color: Colors.white,
        thickness: 0.4,
      ),
    );
  }

  ExpansionTile expansionTile(BuildContext context) {
    return ExpansionTile(
      childrenPadding: EdgeInsets.only(left: 20, right: 10),
      trailing: Text(""),
      title: Row(
        children: [
          Text("Sajda verse translation",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontFamily: KTypography.regularFontFamilyName,
                    fontSize: 14.sp,
                  )),
          RotatedBox(
            quarterTurns: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_back_ios,
                size: 15,
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
            ),
          )
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("${sajdaEnglish![index!].sajdaText}",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontFamily: KTypography.lightFontfamilyName,
                    fontSize: 13.sp,
                  )),
        )
      ],
    );
  }
}
