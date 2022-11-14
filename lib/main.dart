import 'package:Al_Kitab/src/screens/juz/juz.dart';
import 'package:Al_Kitab/src/screens/sajda/sajda.dart';
import 'package:Al_Kitab/src/screens/splashScreen/splashScreen.dart';
import 'package:Al_Kitab/src/screens/surah/views/surahList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(AlKitabApp());
}

//This returns a moterial App
class AlKitabApp extends StatelessWidget {
  final Color _themeColor = Color(0xFF210F3F);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Al-Kitab',
      theme: ThemeData(
        primaryColor: _themeColor,
        indicatorColor: _themeColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AlKitabSplashScreen(),
      routes: {
        '/surah': (context) => SurahList(),
        '/sajdah': (context) => SajdaList(),
        '/juz': (context) => JuzList(),
      },
    );
  }
}
