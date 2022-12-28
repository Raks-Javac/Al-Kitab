import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/functions.dart';
import '../../../../models/surah/ayah.dart';
import '../../../../models/surah/surah.dart';
import '../../../../shared/render/render_svg.dart';
import '../../../../shared/res/res.dart';
import '../../../../shared/widgets/app_bar/custom_app_bar.dart';
import '../../../../shared/widgets/ayahDetail.dart';
import '../../../../shared/widgets/bottom_sheet.dart/reusable_bottom.dart';
import '../controller/controller.dart';
import 'translation_mode_toggle.dart';

// ignore: must_be_immutable
class SurahIndexScreen extends StatelessWidget {
  final int? index;
  final List<Surah>? surahs;
  final List<Ayah>? ayahEnglishText;
  final List<Ayah>? ayahArabicText;

  SurahIndexScreen(
      {this.ayahArabicText, this.surahs, this.index, this.ayahEnglishText});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: KWidgetsCustomAppBar(
          title: "${surahs![index!].englishTransliterationName}",
        ),
        body: Container(
            child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
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
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: ayahArabicText!.length,
                        itemBuilder: (context, index) {
                          return Builder(builder: (context) {
                            Provider.of<SurahProvider>(context, listen: true);
                            return Container(
                              margin: EdgeInsets.only(bottom: 20, top: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 15, right: 15),
                                    height: 40,
                                    width: size.width,
                                    decoration: KAppConstants.appThemeEnum ==
                                            AppThemeEnum.whiteMode
                                        ? BoxDecoration(
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            border: KAppConstants
                                                        .appThemeEnum ==
                                                    AppThemeEnum.whiteMode
                                                ? Border.all(
                                                    color: KColors.primaryColor,
                                                  )
                                                : Border.all(),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100)),
                                          )
                                        : BoxDecoration(
                                            color: KAppConstants.appThemeEnum ==
                                                    AppThemeEnum.whiteMode
                                                ? Theme.of(context)
                                                    .scaffoldBackgroundColor
                                                : Theme.of(context).cardColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100))),
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
                                                backgroundColor: KAppConstants
                                                            .appThemeEnum ==
                                                        AppThemeEnum.whiteMode
                                                    ? KColors.primaryColor
                                                    : Theme.of(context)
                                                        .primaryColor,
                                                child: Center(
                                                  child: Text(
                                                    "${ayahEnglishText![index].ayahIndex}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          fontFamily: KTypography
                                                              .regularFontFamilyName,
                                                          fontSize: 12.sp,
                                                          color: KColors
                                                              .whiteColor,
                                                        ),
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
                                                  imgPath: KIcons.copyIcon,
                                                  onTap: () {
                                                    KFunctions.copy(
                                                        '${ayahArabicText![index].ayahText} \n ${ayahEnglishText![index].ayahText}',
                                                        'Quran ${index + 1}',
                                                        'v${ayahEnglishText![index].ayahIndex}',
                                                        context);
                                                  },
                                                ),
                                                icons(
                                                    imgPath: KIcons.shareIcon,
                                                    onTap: () {
                                                      KFunctions.share(
                                                          '${ayahArabicText![index].ayahText} \n ${ayahEnglishText![index].ayahText}',
                                                          'Quran ${index + 1}',
                                                          'v${ayahEnglishText![index].ayahIndex}');
                                                      // _functions.showToast(context);
                                                    }),
                                                icons(
                                                    imgPath: KIcons.threeDots,
                                                    onTap: () {
                                                      kWidgetsBottomSheet(
                                                        context,
                                                        Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              2,
                                                          child:
                                                              TranslationBottomSheet(),
                                                        ),
                                                      );
                                                    }),
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            fontFamily: KTypography
                                                .regularFontFamilyName,
                                            fontSize: 26.sp,
                                          ),
                                    ),
                                  ),
                                  addVerticalSpaing(20),
                                  context
                                              .watch<SurahProvider>()
                                              .getTranslationMode ==
                                          true
                                      ? ExpansionTile(
                                          childrenPadding: EdgeInsets.only(
                                              left: 20, right: 10),
                                          trailing: Text(""),
                                          title: Row(
                                            children: [
                                              Text(
                                                "Translation",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontFamily: KTypography
                                                          .regularFontFamilyName,
                                                      fontSize: 14.sp,
                                                    ),
                                              ),
                                              RotatedBox(
                                                quarterTurns: 3,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.arrow_back_ios,
                                                    size: 15,
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .color,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "${ayahEnglishText![index].ayahText}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontFamily: KTypography
                                                          .lightFontfamilyName,
                                                      fontSize: 13.5.sp,
                                                    ),
                                              ),
                                            )
                                          ],
                                        )
                                      : SizedBox.shrink(),
                                ],
                              ),
                            );
                          });
                        }),
                  ),
                ))));
  }

  GestureDetector icons({required String? imgPath, Function? onTap}) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: RenderSvg(
          svgPath: imgPath!,
          color: KAppConstants.appThemeEnum == AppThemeEnum.whiteMode
              ? KColors.black
              : KColors.whiteColor,
        ),
      ),
    );
  }
}
