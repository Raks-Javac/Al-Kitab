import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../animations/TransitionAnimation.dart';
import '../../../shared/widgets/drawerTile.dart';
import '../../introduction/intro.dart';
import '../../quran/juz/juz.dart';
import '../../quran/sajda/sajda.dart';
import '../../quran/surah/views/SurahScreen.dart';
import '../../quran/surah/views/surahList.dart';
import '../../settings/guidelines/guidelines.dart';

// ignore: must_be_immutable
class AlKitabDrawer extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffold = GlobalKey();
  final BuildContext? context;
  Function? onPressed;
  AlKitabDrawer({Key? key, this.context, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: _scaffold,
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: onPressed as void Function()?,
                      iconSize: 30,
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                    ),
                  ),
                  Image.asset(
                    "assets/images/logo.png",
                    height: 60,
                    width: 60,
                  ),
                  // Text(
                  //   "Al-Kitab",
                  //   style: TextStyle(
                  //       fontSize: 25,
                  //       fontFamily: "PMedium",
                  //       color: Colors.white),
                  // ),
                  SizedBox(
                    height: 9,
                  ),
                  Text("The Holy Qur’an",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 30,
                          fontFamily: "RSR",
                          color: Colors.grey.withOpacity(0.9))),
                ],
              ),
            ),
            DrawerTile(
                tileName: "Surah",
                iconPath: "assets/images/surah_icon.png",
                analysisNumber: "144",
                onPressed: () {
                  _route(
                      screen: DScreens(
                    screenName: "Surah",
                    lister: SurahList(),
                  ));
                }),
            DrawerTile(
              tileName: "Sajda",
              iconPath: "assets/images/sajda_icon.png",
              analysisNumber: "15",
              onPressed: () {
                _route(
                  screen: DScreens(
                    screenName: "Sadja",
                    lister: SajdaList(),
                  ),
                );
              },
            ),
            DrawerTile(
              tileName: "Juz",
              iconPath: "assets/images/juz.png",
              analysisNumber: "30",
              onPressed: () {
                _route(
                  screen: DScreens(
                    screenName: "Juz",
                    lister: JuzList(),
                  ),
                );
              },
            ),
            _otherTile(
              context,
              tileName: "Introduction",
              iconPath: "assets/images/introduction.png",
              screen: AlKitabIntroView(),
            ),
            // _otherTile(context,
            //     tileName: "Share App",
            //     iconPath: 'assets/images/bi_share.png',
            //     screen: ShareApp()),
            _otherTile(context,
                tileName: "Help & Guidelines",
                iconPath: "assets/images/rename.png",
                screen: HelpGuidelinesView()),
          ],
        ),
      ),
    );
  }

  Widget _otherTile(BuildContext context,
      {String? tileName, required String iconPath, Widget? screen}) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            _route(screen: screen);
          },
          leading: ImageIcon(
            AssetImage(iconPath),
            color:
                Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.5),
            size: 20,
          ),
          title: Text(
            "$tileName",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontFamily: "PLight",
                  fontSize: 15.sp,
                ),
          ),
        ),
      ],
    );
  }

  _route({Widget? screen}) {
    return Navigator.push(
      context!,
      PreviewSlideRoute(
        duration: 200,
        preview: screen,
      ),
    );
  }
}
