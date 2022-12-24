import 'package:flutter/material.dart';

import '../../../../shared/widgets/app_bar/appBarText.dart';
import '../../../../shared/widgets/app_bar/backHome.dart';

// ignore: must_be_immutable
class DScreens extends StatefulWidget {
  String? screenName;
  Widget? lister;
  DScreens({Key? key, this.screenName, this.lister}) : super(key: key);
  @override
  _DScreensState createState() => _DScreensState();
}

class _DScreensState extends State<DScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: KwidgetBackButton(),
        title: BarText(
          appBarText: widget.screenName,
        ),
        toolbarHeight: 60,
        // actions: [SearchWidget()],
      ),
      body: Container(
        child: widget.lister,
      ),
    );
  }
}
