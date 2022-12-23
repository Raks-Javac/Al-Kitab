import 'dart:async';

import 'package:flutter/material.dart';

import '../../animations/FadeInAnimation.dart';
import '../../animations/TransitionAnimation.dart';
import '../homeScreen/views/alKitabHome.dart';
import '../../shared/res/stylesheet/splashScreenStyles.dart';

class AlKitabSplashScreen extends StatefulWidget {
  AlKitabSplashScreen({Key? key}) : super(key: key);

  @override
  _AlKitabSplashScreenState createState() => _AlKitabSplashScreenState();
}

class _AlKitabSplashScreenState extends State<AlKitabSplashScreen> {
  double seconds = 3;
  @override
  void initState() {
    // super.initState();
    splashTimer();
  }

  Timer splashTimer() {
    return Timer(
        Duration(seconds: seconds.toInt()),
        () => Navigator.of(context).pushReplacement(
            PreviewSlideRoute(preview: AlKitabHome(), duration: 1000)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        child: Stack(
          children: [appSplashLogo(context), appSplashName()],
        ),
      ),
    );
  }

  Widget appSplashName() {
    return FadeInRight(
      animatedWidget: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Al-Kitab", style: appSplashStyle),
        ),
      ),
    );
  }

  Center appSplashLogo(BuildContext context) {
    var widget = Image.asset(
      "assets/images/logo.png",
      width: MediaQuery.of(context).size.width / 1.6,
    );
    return Center(
        child: FadeInleft(
      animatedWidget: widget,
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
