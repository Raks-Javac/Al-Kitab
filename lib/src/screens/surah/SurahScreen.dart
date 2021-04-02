import 'package:Al_Kitab/src/widgets/appBarText.dart';
import 'package:Al_Kitab/src/widgets/backHome.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DScreens extends StatefulWidget {
  String screenName;
  Widget lister;
  DScreens({Key key, this.screenName, this.lister}) : super(key: key);
  @override
  _DScreensState createState() => _DScreensState();
}

class _DScreensState extends State<DScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackWidget(),
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
