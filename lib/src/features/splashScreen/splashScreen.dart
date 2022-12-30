import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../animations/FadeInAnimation.dart';
import '../../core/navigation/navigation_1.0.dart';
import '../../core/utils/constants.dart';
import '../../core/utils/functions.dart';
import '../../models/surah/surah.dart';
import '../dashboard/main_dash.dart';
import '../introduction/intro.dart';

const String checkForOnBoardKey = 'onBoardKey';

class AlKitabSplashScreen extends StatefulWidget {
  AlKitabSplashScreen({Key? key}) : super(key: key);

  @override
  _AlKitabSplashScreenState createState() => _AlKitabSplashScreenState();
}

class _AlKitabSplashScreenState extends State<AlKitabSplashScreen> {
  double seconds = 3;
  @override
  void initState() {
    super.initState();
    splashTimer();
  }

  final surahLoader = new SurahModel();

  Future<bool> loadData() async {
    KAppConstants.surahArabicList =
        await surahLoader.loadSurahJson('surahArabic.json');
    KAppConstants.surahEnglishList =
        await surahLoader.loadSurahJson('surahEnglish.json');

    logConsole(KAppConstants.surahArabicList);

    return KAppConstants.surahArabicList == null &&
        KAppConstants.surahEnglishList == null;
  }

  checkForOnBoard() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    loadData().then((value) async {
      final bool? onBoarded = prefs.getBool(checkForOnBoardKey);
      if (onBoarded == true) {
        KNavigator.navigateAndRemoveUntilRoute(MainDashBoardView());
      } else {
        KNavigator.navigateAndRemoveUntilRoute(AlKitabIntroView());
      }
      // Save an boolean value to []' key.
      await prefs.setBool(checkForOnBoardKey, true);
    });
  }

  Timer splashTimer() {
    return Timer(Duration(seconds: seconds.toInt()), () {
      checkForOnBoard();
    });
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
          child: Text(
            "Al-Kitab",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 33,
                ),
          ),
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
