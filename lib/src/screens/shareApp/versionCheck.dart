import 'package:Al_Kitab/src/screens/stylesheet/splashPreviewstyles.dart';
import 'package:Al_Kitab/src/widgets/app_bar/appBarText.dart';
import 'package:Al_Kitab/src/widgets/app_bar/backHome.dart';
import 'package:flutter/material.dart';

class VersionCheck extends StatelessWidget {
  final String? currentVersion;
  const VersionCheck({this.currentVersion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: BackWidget(),
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        title: BarText(
          appBarText: 'Version Check',
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 10, top: 50),
        child: Column(
          children: [
            Text(
              "Al-Kitab is currently in version $currentVersion",
              style:
                  appSplashStyle.copyWith(fontSize: 18, fontFamily: 'PLight'),
            )
          ],
        ),
      ),
    );
  }
}
