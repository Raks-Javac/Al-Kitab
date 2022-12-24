import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'locator.dart';
import 'src/core/navigation/navigation_1.0.dart';
import 'src/features/quran/juz/juz.dart';
import 'src/features/quran/sajda/sajda.dart';
import 'src/features/quran/surah/views/surahList.dart';
import 'src/features/splashScreen/splashScreen.dart';
import 'src/shared/res/res.dart';
import 'src/features/settings/theme/provider/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(AlKitabApp());
}

//This returns a moterial App
class AlKitabApp extends StatelessWidget {
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
