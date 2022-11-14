import 'package:Al_Kitab/src/animations/TransitionAnimation.dart';
import 'package:Al_Kitab/src/screens/guidelines/guidelines.dart';
import 'package:Al_Kitab/src/screens/introduction/intro.dart';
import 'package:Al_Kitab/src/screens/juz/juz.dart';
import 'package:Al_Kitab/src/screens/sajda/sajda.dart';
import 'package:Al_Kitab/src/screens/shareApp/shareApp.dart';
import 'package:Al_Kitab/src/screens/stylesheet/AlKitabHomeStyle.dart';
import 'package:Al_Kitab/src/screens/surah/views/SurahScreen.dart';
import 'package:Al_Kitab/src/screens/surah/views/surahList.dart';
import 'package:Al_Kitab/src/widgets/drawerTile.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AlKitabDrawer extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffold = GlobalKey();
  final BuildContext context;
  Function onPressed;
  AlKitabDrawer({Key key, this.context, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: _scaffold,
      child: Container(
        color: Theme.of(context).primaryColor,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: onPressed,
                      iconSize: 30,
                      color: drawerAlignStyle,
                    ),
                  ),
                  Image.asset(
                    "assets/images/logo.png",
                    height: 100,
                    width: 110,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Al-Kitab",
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: "PMedium",
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Text(
                    "The Holy Qur’an",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: "RSR",
                        color: Colors.grey.withOpacity(0.9)),
                  ),
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
              tileName: "Introduction",
              iconPath: "assets/images/introduction.png",
              screen: AlKitabIntro(),
            ),
            _otherTile(
                tileName: "Share App",
                iconPath: 'assets/images/bi_share.png',
                screen: ShareApp()),
            _otherTile(
                tileName: "Help & Guidelines",
                iconPath: "assets/images/rename.png",
                screen: Guidelines()),
          ],
        ),
      ),
    );
  }

  Widget _otherTile({String tileName, String iconPath, Widget screen}) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            _route(screen: screen);
          },
          leading: ImageIcon(
            AssetImage(iconPath),
            color: Colors.grey,
            size: 20,
          ),
          title: Text(
            "$tileName",
            style: TextStyle(
                fontFamily: "PLight",
                fontSize: 17,
                color: Colors.white.withOpacity(0.8)),
          ),
        ),
      ],
    );
  }

  _route({Widget screen}) {
    return Navigator.push(
      context,
      PreviewSlideRoute(
        duration: 200,
        preview: screen,
      ),
    );
  }
}
