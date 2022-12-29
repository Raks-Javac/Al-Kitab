import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/navigation/navigation_1.0.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/utils/enums.dart';
import '../../../models/surah/surah.dart';
import '../../../shared/render/render_svg.dart';
import '../../../shared/res/assets.dart';
import '../../../shared/res/res.dart';
import '../../../shared/widgets/app_bar/custom_app_bar.dart';
import '../../../shared/widgets/ayahTile.dart';
import '../../quran/surah/widgets/SurahIndex.dart';
import '../model/daily_reminder.dart';
import '../provider/home_provider.dart';
import 'drawer.dart';

final dailyRemainderObjectList = DailyReminderObject().dailyReminderList();
final randomIndexForDailyRemainder =
    Random().nextInt(dailyRemainderObjectList.length);

class AlKitabHomeView extends StatefulWidget {
  @override
  State<AlKitabHomeView> createState() => _AlKitabHomeViewState();
}

class _AlKitabHomeViewState extends State<AlKitabHomeView> {
  final surahLoader = new SurahModel();
  @override
  void initState() {
    context.read<HomeProvider>().loadInitState();

    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: KWidgetsCustomAppBar(
        leadingIcon: IconButton(
          icon: RenderSvg(
            svgPath: KIcons.menuIcon,
            color: Theme.of(context).textTheme.bodyMedium!.color,
            svgHeight: 50,
            svgWidth: 50,
          ),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: "Al-Kitab",
      ),
      key: _scaffoldKey,
      drawer: AlKitabDrawer(
        context: context,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
                color: KAppConstants.appThemeEnum == AppThemeEnum.blackMode
                    ? KColors.primaryColor3
                    : Theme.of(context).primaryColorDark,
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  decoration: BoxDecoration(),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addVerticalSpaing(4),
                      Text(
                        "As-salamu alaykum.",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: KColors.semiWhite.withOpacity(0.9),
                            ),
                      ),
                      addVerticalSpaing(8),
                      Text(
                        KDateFormatter.instance.returnIslamicCurrentDate(),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: KColors.whiteColor,
                              fontSize: 14.sp,
                            ),
                      ),
                      addVerticalSpaing(2),
                      Text(
                        "Saturday 5th November 2022",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: KColors.semiWhite.withOpacity(0.5),
                            ),
                      ),
                      addVerticalSpaing(5),
                    ],
                  ),
                ),
              ),
              addVerticalSpaing(5),
              if (KAppConstants.surahArabicList != null ||
                  KAppConstants.surahEnglishList != null)
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Daily verse:",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 16.sp,
                              fontFamily: KTypography.normalFontFamilyName,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .color!
                                  .withOpacity(0.5),
                            ),
                      ),
                      addVerticalSpaing(10),
                      Consumer<HomeProvider>(builder: (context, vModel, _) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            image: DecorationImage(
                              image: AssetImage(
                                KAssets.dailyVerseBackground,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      KAppConstants
                                          .surahEnglishList!
                                          .surahs![vModel.savedSurahIndex!]
                                          .englishTransliterationName!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: KColors.whiteColor,
                                            fontSize: 15.sp,
                                          ),
                                    ),
                                    Text(
                                      "Verse ${KAppConstants.surahEnglishList!.surahs![vModel.savedSurahIndex!].ayahs![vModel.savedSurahIndex!].ayahIndex}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: KColors.whiteColor,
                                            fontSize: 15.sp,
                                          ),
                                    ),
                                  ],
                                ),
                                addVerticalSpaing(12),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "َ${KAppConstants.surahArabicList!.surahs![vModel.savedSurahIndex!].ayahs![vModel.savedSurahIndex!].ayahText}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: KColors.whiteColor,
                                          fontSize: 17.sp,
                                        ),
                                  ),
                                ),
                                addVerticalSpaing(15),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "َ${KAppConstants.surahEnglishList!.surahs![vModel.savedSurahIndex!].ayahs![vModel.savedSurahIndex!].ayahText}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: KColors.whiteColor,
                                          fontSize: 15.sp,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
              addVerticalSpaing(4),
              Consumer<HomeProvider>(builder: (context, vModel, _) {
                final surahLastReadIndex = vModel.savedSurahIndex;
                return vModel.savedSurahIndex != null
                    ? Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Last Read:",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 16.sp,
                                    fontFamily:
                                        KTypography.normalFontFamilyName,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .color!
                                        .withOpacity(0.5),
                                  ),
                            ),
                            addVerticalSpaing(10),
                            AyahTile(
                              ayahArabicName: KAppConstants.surahArabicList!
                                  .surahs![surahLastReadIndex!].arabicName,
                              ayahEnglishName: KAppConstants
                                  .surahArabicList!
                                  .surahs![surahLastReadIndex]
                                  .englishTransliterationName,
                              ayahIndex: surahLastReadIndex + 1,
                              ayahName: KAppConstants.surahArabicList!
                                  .surahs![surahLastReadIndex].englishName,
                              numberOfAyah: KAppConstants.surahArabicList!
                                  .surahs![surahLastReadIndex].ayahs!.length,
                              revelationType: KAppConstants.surahArabicList!
                                  .surahs![surahLastReadIndex].revelationType,
                              onTap: () {
                                KNavigator.navigateToRoute(
                                  SurahIndexScreen(
                                    index: surahLastReadIndex,
                                    surahs:
                                        KAppConstants.surahArabicList!.surahs,
                                    ayahArabicText: KAppConstants
                                        .surahArabicList!
                                        .surahs![surahLastReadIndex]
                                        .ayahs,
                                    ayahEnglishText: KAppConstants
                                        .surahEnglishList!
                                        .surahs![surahLastReadIndex]
                                        .ayahs,
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      )
                    : SizedBox.shrink();
              }),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Daily Reminder",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16.sp,
                            fontFamily: KTypography.normalFontFamilyName,
                            color: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .color!
                                .withOpacity(0.5),
                          ),
                    ),
                    addVerticalSpaing(10),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                            KAssets.dailyRemainderBackground,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            addVerticalSpaing(25),
                            Text(
                              "${dailyRemainderObjectList[randomIndexForDailyRemainder].surahEnglishName}{chapter ${dailyRemainderObjectList[randomIndexForDailyRemainder].surahChapter} Verse ${dailyRemainderObjectList[randomIndexForDailyRemainder].surahVerse}}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: KColors.whiteColor,
                                    fontSize: 15.sp,
                                  ),
                            ),
                            addVerticalSpaing(10),
                            Text(
                              "“${dailyRemainderObjectList[randomIndexForDailyRemainder].surahEnglishTeext}”.",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: KColors.whiteColor,
                                    fontFamily: KTypography.boldFontFamilyName,
                                    fontSize: 15.sp,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              addVerticalSpaing(100),
            ],
          ),
        ),
      ),
    );
  }
}
