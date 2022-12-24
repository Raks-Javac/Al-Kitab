import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/enums.dart';
import '../../../shared/res/res.dart';
import '../../../shared/widgets/app_bar/custom_app_bar.dart';
import '../../../shared/widgets/custom_paint/TabPaint.dart';
import '../../settings/theme/provider/theme_provider.dart';
import '../sajda/sajda.dart';
import '../surah/views/surahList.dart';

class QuranMainView extends StatefulWidget {
  @override
  State<QuranMainView> createState() => _QuranMainViewState();
}

class _QuranMainViewState extends State<QuranMainView>
    with SingleTickerProviderStateMixin {
  TabController? _tabcontroller;
  ScrollController? _scrollcontroller;
  @override
  void initState() {
    _tabcontroller = TabController(length: 2, vsync: this);
    _scrollcontroller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KWidgetsCustomAppBar(
        title: "Quran",
        leadingIcon: Container(),
      ),
      body: Container(
        child: Column(
          children: [
            Consumer<ThemeProvider>(builder: (context, viewModel, _) {
              return Container(
                child: Card(
                  elevation: viewModel.getAppTheme == AppThemeEnum.primaryMode
                      ? 10
                      : 3,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: TabBar(
                    indicator: CircleTabIndicator(
                        color: viewModel.getAppTheme == AppThemeEnum.primaryMode
                            ? KColors.whiteColor
                            : KColors.primaryColor,
                        radius: 3),
                    unselectedLabelStyle:
                        Theme.of(context).textTheme.displayMedium!.copyWith(
                              fontSize: 10.sp,
                            ),
                    onTap: (value) {},
                    labelStyle: TextStyle(fontSize: 14),
                    labelColor: Colors.white,
                    indicatorColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      tabBarText('Surah', context),
                      tabBarText('Sajda', context),

                      // tabBarText('Juz'),
                    ],
                    controller: _tabcontroller,
                  ),
                ),
              );
            }),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(top: 15),
              child: TabBarView(controller: _tabcontroller, children: [
                SurahList(),
                SajdaList(),
                // JuzList(),
              ]),
            ))
          ],
        ),
      ),
    );
  }

  Padding tabBarText(String tabText, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
      child: Text(
        '$tabText',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
