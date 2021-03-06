import 'package:Al_Kitab/src/animations/TransitionAnimation.dart';
import 'package:Al_Kitab/src/models/launch/launcherWeb.dart';
import 'package:Al_Kitab/src/screens/shareApp/versionCheck.dart';
import 'package:Al_Kitab/src/utils/functions.dart';
import 'package:Al_Kitab/src/widgets/appBarText.dart';
import 'package:Al_Kitab/src/widgets/backHome.dart';
import 'package:flutter/material.dart';

class ShareApp extends StatelessWidget {
  final _laucher = Launcher();
  final _functions = Functions();
  final String _playstoreLink = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackWidget(),
        toolbarHeight: 70,
        elevation: 0,
        title: BarText(
          appBarText: "Share App",
        ),
      ),
      body: Center(
          child: Container(
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                contain(
                  imgPath: 'assets/images/playstoreLogo.png',
                  name: 'Rate us & Feedback',
                  onPressed: () {
                    _laucher.loadUrl('$_playstoreLink');
                  },
                ),
                contain(
                  imgPath: 'assets/images/github.png',
                  name: 'Github repo',
                  onPressed: () {
                    _laucher
                        .loadUrl('https://github.com/Raks-Javac/Al-KitabApp');
                  },
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                contain(
                    imgPath: 'assets/images/bi_share.png',
                    name: 'Share App',
                    onPressed: () {
                      _functions.share(
                          'Dont have an offline quran reading app yet? ,\n Download Al-Kitab from the goggle playstore  ',
                          '$_playstoreLink',
                          '');
                    }),
                contain(
                    imgPath: 'assets/images/versionCheck.png',
                    name: 'Version Check',
                    onPressed: () {
                      _route(
                          context: context,
                          screen: VersionCheck(
                            currentVersion: "1.0.0",
                          ));
                    }),
              ],
            )
          ],
        ),
      )),
    );
  }

  _route({Widget screen, BuildContext context}) {
    return Navigator.push(
      context,
      PreviewSlideRoute(
        duration: 200,
        preview: screen,
      ),
    );
  }

  GestureDetector contain({String imgPath, String name, Function onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      onDoubleTap: onPressed,
      onLongPress: onPressed,
      child: Container(
        child: Column(
          children: [
            Image.asset('$imgPath'),
            SizedBox(
              height: 20,
            ),
            Text(
              '$name',
              style: TextStyle(
                  letterSpacing: 1.5,
                  color: Colors.white,
                  fontFamily: 'PLight',
                  fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
