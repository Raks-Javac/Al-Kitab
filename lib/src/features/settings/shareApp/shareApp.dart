import 'package:flutter/material.dart';

import '../../../animations/TransitionAnimation.dart';
import '../../../core/utils/functions.dart';
import '../../../models/launch/launcherWeb.dart';
import '../../../shared/widgets/app_bar/appBarText.dart';
import '../../../shared/widgets/app_bar/backHome.dart';
import 'versionCheck.dart';

class ShareApp extends StatelessWidget {
  final _laucher = Launcher();

  final String _playstoreLink = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: KwidgetBackButton(),
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
                      KFunctions.share(
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

  _route({Widget? screen, required BuildContext context}) {
    return Navigator.push(
      context,
      PreviewSlideRoute(
        duration: 200,
        preview: screen,
      ),
    );
  }

  GestureDetector contain(
      {String? imgPath, String? name, Function? onPressed}) {
    return GestureDetector(
      onTap: onPressed as void Function()?,
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
