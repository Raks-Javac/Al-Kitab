import 'package:Al_Kitab/src/screens/stylesheet/surahIndexStyle.dart';
import 'package:flutter/material.dart';

class AyahDetail extends StatelessWidget {
  final Size size;
  final String ayahTransliterationName;
  final String ayahEnglishName;
  final String ayahArabicName;
  final String ayahName;
  final int numberOfAyah;
  final int ayahIndex;
  final String revelationType;
  const AyahDetail({
    this.size,
    this.ayahArabicName,
    this.ayahTransliterationName,
    this.ayahIndex,
    this.ayahName,
    this.numberOfAyah,
    this.revelationType,
    this.ayahEnglishName,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      expandedHeight: 300,
      flexibleSpace: FlexibleSpaceBar(
          background: Container(
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
                    "$ayahArabicName",
                    style: TextStyle(
                        fontSize: 36,
                        fontFamily: "PLight",
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "$ayahEnglishName",
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
                        "$revelationType",
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
                        "$numberOfAyah VERSES",
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
      )),
    );
  }
}
