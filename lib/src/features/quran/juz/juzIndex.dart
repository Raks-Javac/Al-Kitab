import 'package:flutter/material.dart';

import '../../../models/juz/juz.dart';
import '../../../shared/widgets/app_bar/backHome.dart';
import '../../../shared/widgets/screenLoader.dart';

class Juz extends StatelessWidget {
  final int? juzIndex;
  Juz({
    this.juzIndex,
  });

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              leading: BackButtonWidget(),
              backgroundColor: Colors.grey[850],
              pinned: false,
              expandedHeight: _height * 0.27,
              flexibleSpace: flexibleAppBar(context, _height, _width),
            ),
            SliverToBoxAdapter(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  height: _height * 0.7,
                  width: _width,
                  child: futureBuilderUsage(_height)),
            )
          ],
        ));
  }

  Widget futureBuilderUsage(double height) {
    return FutureBuilder<JuzModel?>(
      future: QuranAPI().getJuzz(juzIndex),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ScreenLoader(
            screenName: "Loading Juz",
          );
        } else if (snapshot.hasError || (!snapshot.hasData)) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Connectivity Error! Please Check your Connection",
                style: TextStyle(color: Colors.white, fontFamily: "PMedium"),
              ),
            ],
          ));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.juzAyahs!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                      snapshot.data!.juzAyahs![index].ayahsText.toString(),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: height * 0.03, color: Colors.white)),
                ),
                trailing: CircleAvatar(
                  radius: height * 0.017,
                  backgroundImage: AssetImage("assets/images/label.png"),
                  backgroundColor:
                      Theme.of(context).primaryColor.withOpacity(0.3),
                  child: Text(
                    snapshot.data!.juzAyahs![index].ayahNumber.toString(),
                    style: TextStyle(
                        fontSize: height * 0.0135,
                        color: Colors.black,
                        fontFamily: "PBold"),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  Widget flexibleAppBar(BuildContext context, double width, double height) {
    return FlexibleSpaceBar(
        centerTitle: true,
        title: Text("Juzz No. $juzIndex",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: height * 0.045,
              fontFamily: 'PBold',
            )),
        background: Container(
          child: Stack(
            children: <Widget>[
              Opacity(
                opacity: 0.3,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                  child: Image.asset(
                    "assets/images/quran.jpg",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              // quranImageAppBar(height, context),
              Container(
                color: Theme.of(context).primaryColor.withOpacity(0.3),
              ),
              infoInAppBar(context),
            ],
          ),
        ));
  }

  Widget infoInAppBar(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Starting Surah",
            style: TextStyle(color: Colors.white, fontFamily: 'PMedium'),
          ),
          FutureBuilder<JuzModel?>(
            future: QuranAPI().getJuzz(juzIndex),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('');
              } else {
                return Text("${snapshot.data?.juzAyahs![juzIndex!].surahName}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "PLight",
                        fontSize: MediaQuery.of(context).size.height * 0.045));
              }
            },
          ),
        ],
      ),
    );
  }

  // Widget infoInAppBar(BuildContext context) {
  //   return Center(
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //         Text(
  //           "Starting Surah",
  //           style: TextStyle(fontFamily: 'PMedium', color: Colors.white),
  //         ),
  //         FutureBuilder(
  //           future: QuranAPI().getJuzz(juzIndex),
  //           builder: (context, snapshot) {
  //             if (snapshot.connectionState == ConnectionState.waiting) {
  //               return Text('');
  //             } else {
  //               return (snapshot.data.juzAyahs) == null
  //                   ? Text("")
  //                   : Text(
  //                       "${snapshot.data.juzAyahs[juzIndex].surahName}",
  //                       style: TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                         color: Colors.white,
  //                         fontSize: MediaQuery.of(context).size.height * 0.045,
  //                       ),
  //                     );
  //             }
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget quranImageAppBar(double height, BuildContext context) {
    return Opacity(
        opacity: 0.3,
        child: Image.asset(
          'assets/images/quran.jpg',
          height: height * 0.4,
          width: MediaQuery.of(context).size.width,
        ));
  }
}
