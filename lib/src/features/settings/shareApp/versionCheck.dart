import 'package:flutter/material.dart';

import '../../../shared/res/stylesheet/splashPreviewstyles.dart';
import '../../../shared/widgets/app_bar/appBarText.dart';
import '../../../shared/widgets/app_bar/backHome.dart';

class VersionCheck extends StatelessWidget {
  final String? currentVersion;
  const VersionCheck({this.currentVersion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: KwidgetBackButton(),
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
