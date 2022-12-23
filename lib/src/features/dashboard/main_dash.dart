import 'package:flutter/material.dart';

import '../../core/utils/functions.dart';
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

  bool active = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(controller: _tabController, children: [
        AlKitabHomeView(),
        Container(),
        Container(),
      ]),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: KColors.semiWhite,
        ),
        padding: EdgeInsets.all(10),
        height: 70,
        child: TabBar(
            onTap: (value) {
              logConsole(value);
            },
            unselectedLabelColor: Theme.of(context).primaryColor,
            splashFactory: NoSplash.splashFactory,
            indicatorWeight: 0.02,
            controller: _tabController,
            tabs: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(200),
                ),
                width: 80,
                height: 80,
                child: Icon(Icons.home),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(200),
                ),
                width: 80,
                height: 80,
                child: Icon(Icons.home),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(200),
                ),
                width: 80,
                height: 80,
                child: Icon(Icons.home),
              ),
            ]),
      ),
    );
  }
}
