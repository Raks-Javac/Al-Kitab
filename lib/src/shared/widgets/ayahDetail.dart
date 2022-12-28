import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../res/assets.dart';
import '../res/res.dart';

class AyahDetail extends StatelessWidget {
  final Size? size;
  final String? ayahTransliterationName;
  final String? ayahEnglishName;
  final String? ayahArabicName;
  final String? ayahName;
  final int? numberOfAyah;
  final int? ayahIndex;
  final String? revelationType;
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      expandedHeight: 140,
      flexibleSpace: FlexibleSpaceBar(
          background: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(KAssets.ayahPreviewBackgroundImage),
                  fit: BoxFit.cover,
                ),
              ),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "$ayahEnglishName",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 17.sp,
                                    fontFamily:
                                        KTypography.regularFontFamilyName,
                                    color: Colors.white,
                                  ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "$revelationType",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: 12.sp,
                                        fontFamily:
                                            KTypography.regularFontFamilyName,
                                        color: Colors.white,
                                      ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0, left: 5, right: 5),
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: 14.sp,
                                        fontFamily:
                                            KTypography.regularFontFamilyName,
                                        color: Colors.white,
                                      ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "$ayahArabicName",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontFamily: KTypography.lightFontfamilyName,
                                    color: KColors.primaryColor2,
                                    fontSize: 23.sp,
                                  ),
                        ),
                      ),
                    ],
                  )
                ],
              ))),
    );
  }
}
