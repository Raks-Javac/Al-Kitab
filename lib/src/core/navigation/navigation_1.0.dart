import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KNavigator {
  KNavigator._();

 static KNavigator instance = KNavigator._();
  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  void dismissKeyboard_1() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static void popSheet() {
    Navigator.of(navigatorKey!.currentContext!).pop();
  }

  void closeDialog() {
    Navigator.of(navigatorKey!.currentContext!, rootNavigator: true).pop();
  }

  static navigateToRoute(dynamic routeClass) {
    Navigator.push(navigatorKey!.currentContext!,
        CupertinoPageRoute(builder: (context) => routeClass));
  }

  static void navigateAndReplaceRoute(dynamic routeClass) {
    Navigator.pushReplacement(navigatorKey!.currentContext!,
        CupertinoPageRoute(builder: (context) => routeClass));
  }

  static void navigateAndRemoveUntilRoute(dynamic routeClass) {
    Navigator.pushAndRemoveUntil(navigatorKey!.currentContext!,
        CupertinoPageRoute(builder: (context) => routeClass), (route) => false);
  }

  // goBackHome(BuildContext context) {
  //   Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
  //       CupertinoPageRoute(builder: (context) => const MainScreenLayout()),
  //       (route) => false);
  // }

  static navigateWithoutBottomNav(dynamic routeClass) {
    Navigator.of(navigatorKey!.currentContext!, rootNavigator: true).push(
      CupertinoPageRoute(builder: (context) => routeClass),
    );
  }
}
