import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'locator.dart';
import 'src/core/navigation/navigation_1.0.dart';
import 'src/core/utils/constants.dart';
import 'src/core/utils/functions.dart';
import 'src/features/quran/juz/juz.dart';
import 'src/features/quran/sajda/sajda.dart';
import 'src/features/quran/surah/views/surahList.dart';
import 'src/features/settings/theme/provider/theme_provider.dart';
import 'src/features/splashScreen/splashScreen.dart';
import 'src/models/sajda/sajda.dart';
import 'src/models/surah/surah.dart';
import 'src/shared/res/res.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(AlKitabApp());
}

//This returns a moterial App
class AlKitabApp extends StatefulWidget {
  @override
  State<AlKitabApp> createState() => _AlKitabAppState();
}

class _AlKitabAppState extends State<AlKitabApp> {
  final surahLoader = new SurahModel();
  final _sajda = SajdaModel();
  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    KAppConstants.sajdaArabicList =
        await _sajda.loadSajdaJson('sajdaArabic.json');
    KAppConstants.sajdaEnglishList =
        await _sajda.loadSajdaJson('sajdaEnglish.json');
    KAppConstants.surahArabicList =
        await surahLoader.loadSurahJson('surahArabic.json');
    KAppConstants.surahEnglishList =
        await surahLoader.loadSurahJson('surahEnglish.json');
    logConsole(KAppConstants.surahArabicList);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (_, context) {
          return MultiProvider(
            providers: appProviders,
            child: Builder(builder: (context) {
              Provider.of<ThemeProvider>(context, listen: true);

              return MaterialApp(
                debugShowCheckedModeBanner: false,
                navigatorKey: KNavigator.navigatorKey,
                scaffoldMessengerKey: KNavigator.scaffoldMessengerKey,
                title: 'Al-Kitab',
                theme: KThemes.returnThemeBasedOnMode(
                    context.watch<ThemeProvider>().getAppTheme),
                themeMode: ThemeMode.system,
                home: AlKitabSplashScreen(),
                routes: {
                  '/surah': (context) => SurahList(),
                  '/sajdah': (context) => SajdaList(),
                  '/juz': (context) => JuzList(),
                },
              );
            }),
          );
        });
  }
}
