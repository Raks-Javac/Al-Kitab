import 'package:Al_Kitab/src/screens/stylesheet/splashPreviewstyles.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ScreenLoader extends StatelessWidget {
  final String screenName;
  const ScreenLoader({this.screenName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        period: Duration(seconds: 4),
        child: Center(
          child: Text(
            "$screenName",
            style: appSplashStyle.copyWith(
                fontFamily: "RSR",
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
