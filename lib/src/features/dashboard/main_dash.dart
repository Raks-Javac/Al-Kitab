import 'package:flutter/material.dart';

import '../../shared/render/render_svg.dart';
import '../../shared/res/res.dart';
import '../homeScreen/views/alKitabHome.dart';
import '../quran/main_view/quran_main_view.dart';
import '../settings/main_view/settings_main_view.dart';

class MainDashBoardView extends StatefulWidget {
  @override
  State<MainDashBoardView> createState() => _MainDashBoardViewState();
}

class _MainDashBoardViewState extends State<MainDashBoardView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this)..addListener(() {});
    super.initState();
  }

  int activeIndex = 0;
  changeActiveIndexstate(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              AlKitabHomeView(),
              QuranMainView(),
              SettingsMainView(),
            ]),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(-1, 1),
                    blurRadius: 20,
                    spreadRadius: 0,
                    color: KColors.grey.withOpacity(0.4),
                  )
                ],
                color: KColors.whiteColor,
              ),
              padding: EdgeInsets.only(left: 10, right: 10, top: 5),
              height: 75,
              child: TabBar(
                  isScrollable: false,
                  onTap: (value) {
                    changeActiveIndexstate(value);
                  },
                  unselectedLabelColor: Theme.of(context).primaryColor,
                  labelColor: KColors.whiteColor,
                  splashFactory: NoSplash.splashFactory,
                  indicatorWeight: 0.02,
                  controller: _tabController,
                  tabs: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: _tabController.index == 0
                                ? Theme.of(context).primaryColor
                                : KColors.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: _tabController.index == 0 ? 50 : 55,
                          height: _tabController.index == 0 ? 40 : 45,
                          child: Padding(
                            padding: const EdgeInsets.all(8.5),
                            child: RenderSvg(
                              svgPath: KIcons.homeIcon,
                              color: _tabController.index == 0
                                  ? KColors.whiteColor
                                  : Theme.of(context).primaryColor,
                              svgHeight: 12,
                              svgWidth: 12,
                            ),
                          ),
                        ),
                        if (_tabController.index == 0)
                          Text(
                            "Home",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: KColors.black,
                                ),
                          )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: _tabController.index == 1
                                ? Theme.of(context).primaryColor
                                : KColors.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: _tabController.index == 1 ? 55 : 60,
                          height: _tabController.index == 1 ? 45 : 50,
                          child: Padding(
                            padding: const EdgeInsets.all(9.5),
                            child: RenderSvg(
                              svgPath: KIcons.readIcon,
                              color: _tabController.index == 1
                                  ? KColors.whiteColor
                                  : Theme.of(context).primaryColor,
                              svgHeight: 14,
                              svgWidth: 14,
                            ),
                          ),
                        ),
                        if (_tabController.index == 1)
                          Text(
                            "Quran",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: KColors.black,
                                ),
                          )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: _tabController.index == 2
                                ? Theme.of(context).primaryColor
                                : KColors.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: _tabController.index == 2 ? 50 : 55,
                          height: _tabController.index == 2 ? 40 : 45,
                          child: Padding(
                            padding: const EdgeInsets.all(9.5),
                            child: RenderSvg(
                              svgPath: KIcons.settingsIcon,
                              color: _tabController.index == 2
                                  ? KColors.whiteColor
                                  : Theme.of(context).primaryColor,
                              svgHeight: 12,
                              svgWidth: 12,
                            ),
                          ),
                        ),
                        if (_tabController.index == 2)
                          Text(
                            "Settings",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: KColors.black,
                                ),
                          )
                      ],
                    ),
                  ]),
            ),
          ],
        )
      ],
    ));

    // bottomNavigationBar:
  }
}
