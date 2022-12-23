import 'package:flutter/material.dart';

import '../../shared/res/res.dart';
import '../homeScreen/views/alKitabHome.dart';

class MainDashBoardView extends StatefulWidget {
  @override
  State<MainDashBoardView> createState() => _MainDashBoardViewState();
}

class _MainDashBoardViewState extends State<MainDashBoardView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
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
          TabBarView(controller: _tabController, children: [
            AlKitabHomeView(),
            Container(),
            Container(),
          ]),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(-1, 1),
                      blurRadius: 20,
                      spreadRadius: 0,
                      color: KColors.grey.withOpacity(0.4),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: KColors.whiteColor,
                ),
                padding: EdgeInsets.all(10),
                height: 70,
                child: TabBar(
                    onTap: (value) {
                      changeActiveIndexstate(value);
                    },
                    unselectedLabelColor: Theme.of(context).primaryColor,
                    labelColor: KColors.whiteColor,
                    splashFactory: NoSplash.splashFactory,
                    indicatorWeight: 0.02,
                    controller: _tabController,
                    tabs: [
                      Container(
                        decoration: BoxDecoration(
                          color: activeIndex == 0
                              ? KColors.primaryColor
                              : KColors.whiteColor,
                          borderRadius: BorderRadius.circular(200),
                        ),
                        width: 80,
                        height: 80,
                        child: Icon(Icons.home),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: activeIndex == 1
                              ? KColors.primaryColor
                              : KColors.whiteColor,
                          borderRadius: BorderRadius.circular(200),
                        ),
                        width: 80,
                        height: 80,
                        child: Icon(Icons.home),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: activeIndex == 2
                              ? KColors.primaryColor
                              : KColors.whiteColor,
                          borderRadius: BorderRadius.circular(200),
                        ),
                        width: 80,
                        height: 80,
                        child: Icon(Icons.home),
                      ),
                    ]),
              ),
            ],
          )
        ],
      ),
      // bottomNavigationBar:
    );
  }
}
