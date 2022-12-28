import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/enums.dart';
import '../../../shared/render/render_svg.dart';
import '../../../shared/res/assets.dart';
import '../../../shared/res/res.dart';
import '../../../shared/widgets/app_bar/custom_app_bar.dart';
import '../../../shared/widgets/ayahTile.dart';
import 'drawer.dart';

class AlKitabHomeView extends StatelessWidget {
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
                        "Rabil al-thani 11, 1444 A.H",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: KColors.whiteColor,
                              fontSize: 15.sp,
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
                    Container(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Suratul Al-faatiha",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: KColors.whiteColor,
                                        fontSize: 15.sp,
                                      ),
                                ),
                                Text(
                                  "Verse 2",
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
                                "َﻦﻳِمَلاَعْلا ِّبَر ِهّﻞﻟ ُدْمَحْلا",
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
                                " 1. Praise be to Allah, Lord of the worlds",
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
                    )
                  ],
                ),
              ),
              addVerticalSpaing(4),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Last Read:",
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
                    AyahTile(
                      ayahArabicName: "‎ةَحِتاَفْلا",
                      ayahEnglishName: "Suratul Al-faatiha",
                      ayahIndex: 2,
                      ayahName: "",
                      numberOfAyah: 2,
                      revelationType: "MECCAN",
                      onTap: () {},
                    )
                  ],
                ),
              ),
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
                              "Suratul Baqarah{chapter 2 Verse 43}",
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
                              "“You shall observe the Contact Prayers (Salat) and give the obligatory charity (Zakat),  and bow down with those who bow down”.",
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
