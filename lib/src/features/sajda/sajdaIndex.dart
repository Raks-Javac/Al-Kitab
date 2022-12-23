import 'package:flutter/material.dart';

import '../../core/utils/functions.dart';
import '../../models/sajda/sajda.dart';
import '../../shared/res/stylesheet/splashScreenStyles.dart';
import '../../shared/res/stylesheet/surahIndexStyle.dart';
import '../../shared/widgets/app_bar/appBarText.dart';
import '../../shared/widgets/app_bar/backHome.dart';

class SajdaIndex extends StatelessWidget {
  final _function = new KFunctions();
  final int? index;
  final List<Sajda>? sajdaEnglish;
  final List<Sajda>? sajdaArabic;
  SajdaIndex({this.sajdaEnglish, this.index, this.sajdaArabic});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        toolbarHeight: 60,
        leading: BackButtonWidget(),
        title: BarText(
          appBarText: '${sajdaEnglish![index!].sajdaTransliterationName}',
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: [
          _ayahDetail(size),
          SizedBox(
            height: 20,
          ),
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
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontFamily: "PLight"),
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
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'PBold'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _spacer(),
          expansionTile(),
          _spacer(),
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
                        style: appSplashStyle.copyWith(
                            fontSize: 18, fontFamily: "PBold"),
                      ),
                      _width(),
                      _divider(),
                    ],
                  ),
                  _spacer(),
                  Text(
                    "Ayah :  ${sajdaEnglish![index!].sajdanumberInSurah}",
                    style: appSplashStyle.copyWith(
                        fontSize: 15, fontFamily: "PLight"),
                  ),
                  _spacer2(),
                  Text(
                    "juz :  ${sajdaEnglish![index!].sajdaJuzIndex}",
                    style: appSplashStyle.copyWith(
                        fontSize: 15, fontFamily: "PLight"),
                  ),
                  _spacer2(),
                  Text(
                    "ruku :  ${sajdaEnglish![index!].sajdaRukuIndex}",
                    style: appSplashStyle.copyWith(
                        fontSize: 15, fontFamily: "PLight"),
                  ),
                ],
              ),
            ),
          ),
          _spacer(),
        ],
      ),
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

  ExpansionTile expansionTile() {
    return ExpansionTile(
      childrenPadding: EdgeInsets.only(left: 20, right: 10),
      trailing: Text(""),
      title: Row(
        children: [
          Text(
            "Sajda verse translation",
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
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
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          )
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${sajdaEnglish![index!].sajdaText}",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'PLight',
              fontSize: 15,
            ),
          ),
        )
      ],
    );
  }

  Container _ayahDetail(Size size) {
    return Container(
      margin: EdgeInsets.only(left: 13, right: 13, top: 20),
      child: Stack(
        children: [
          Container(
            height: 230,
            width: size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/quran.jpg",
                  ),
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          Container(
            height: 230,
            width: size.width,
            decoration: BoxDecoration(
                color: containerStyleColor,
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          Container(
            width: size.width,
            margin: EdgeInsets.only(left: 13, right: 13, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${sajdaEnglish![index!].sajdaArabicName}",
                  style: TextStyle(
                      fontSize: 36, fontFamily: "PLight", color: Colors.white),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "${sajdaEnglish![index!].sajdaEnglishName}",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "PRegular",
                      color: Colors.white),
                ),
                SizedBox(
                  height: 18,
                ),
                SizedBox(
                  width: size.width / 1.5,
                  child: Divider(
                    color: Colors.white,
                    thickness: 0.8,
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${sajdaEnglish![index!].revelationType}",
                      style: TextStyle(
                          fontSize: 23,
                          fontFamily: "PRegular",
                          color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 5.0, left: 10, right: 5),
                      child: Text(
                        ".",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "PRegular",
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      "${sajdaEnglish![index!].sajdanumberOfAyahs} VERSES",
                      style: TextStyle(
                          fontSize: 23,
                          fontFamily: "PRegular",
                          color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
