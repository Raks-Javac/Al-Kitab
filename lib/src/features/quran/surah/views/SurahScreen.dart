import 'package:flutter/material.dart';

import '../../../../shared/widgets/app_bar/custom_app_bar.dart';

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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: KWidgetsCustomAppBar(
        title: widget.screenName,
      ),
      body: Container(
        child: widget.lister,
      ),
    );
  }
}
