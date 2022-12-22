import 'package:Al_Kitab/src/models/appTexts/greetings.dart';
import 'package:Al_Kitab/src/screens/homeScreen/drawer.dart';
import 'package:Al_Kitab/src/screens/homeScreen/quranquoate.dart';
import 'package:Al_Kitab/src/screens/sajda/sajda.dart';
import 'package:Al_Kitab/src/screens/stylesheet/AlKitabHomeStyle.dart';
import 'package:Al_Kitab/src/screens/surah/views/surahList.dart';
import 'package:Al_Kitab/src/shared/widgets/custom_paint/TabPaint.dart';
import 'package:Al_Kitab/src/shared/widgets/app_bar/appBarText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:scoped_model/scoped_model.dart';

class AlKitabHome extends StatefulWidget {
  @override
  _AlKitabHomeState createState() => _AlKitabHomeState();
}

class _AlKitabHomeState extends State<AlKitabHome>
    with SingleTickerProviderStateMixin {
  TabController? _tabcontroller;
  ScrollController? _scrollcontroller;
  @override
  void initState() {
    _tabcontroller = TabController(length: 2, vsync: this);
    _scrollcontroller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: leadingIcon(onPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        }),
        key: _scaffoldKey,
        drawer: AlKitabDrawer(
          context: context,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: Container(
            child: NestedScrollView(
                controller: _scrollcontroller,
                headerSliverBuilder: (context, bool boxScrolled) {
                  return [
                    AppHomePreview(tabcontroller: _tabcontroller),
                  ];
                },
                body: Container(
                  margin: EdgeInsets.only(top: 15),
                  child: TabBarView(controller: _tabcontroller, children: [
                    SurahList(),
                    SajdaList(),
                    // JuzList(),
                  ]),
                ))));
  }

  AppBar leadingIcon({VoidCallback? onPressed}) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      leading: IconButton(
        icon: ImageIcon(
          AssetImage("assets/images/menubar.png"),
          color: menuColor,
        ),
        onPressed: onPressed,
      ),
      title: BarText(appBarText: "Al-Kitab"),
      actions: [
        // SearchWidget(),
      ],
      centerTitle: true,
      toolbarHeight: 60,
      elevation: 0,
    );
  }

  @override
  void dispose() {
    _tabcontroller!.dispose();
    _scrollcontroller!.dispose();
    super.dispose();
  }
}

class AppHomePreview extends StatelessWidget {
  const AppHomePreview({
    Key? key,
    required TabController? tabcontroller,
  })  : _tabcontroller = tabcontroller,
        super(key: key);

  final TabController? _tabcontroller;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColor,
      pinned: true,
      automaticallyImplyLeading: false,
      expandedHeight: 350,
      flexibleSpace: FlexibleSpaceBar(
        background: AnimationLimiter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 1000),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
                GreetingsWidget(),
                SizedBox(
                  height: 20,
                ),
                Quranqoute(),
              ],
            ),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 20),
        child: Container(
          child: Card(
            elevation: 10,
            color: Theme.of(context).primaryColor,
            child: TabBar(
              indicator: CircleTabIndicator(color: Colors.white, radius: 3),
              unselectedLabelStyle: unSelectedTabStyle,
              labelStyle: TextStyle(fontSize: 14),
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                tabBarText('Surah'),
                tabBarText('Sajda'),
                // tabBarText('Juz'),
              ],
              controller: _tabcontroller,
            ),
          ),
        ),
      ),
    );
  }

  Padding tabBarText(String tabText) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
      child: Text(
        '$tabText',
        style: TextStyle(
          fontFamily: "PRegular",
        ),
      ),
    );
  }
}

class GreetingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<GreetingsModel>(
      model: new GreetingsModel(),
      child: Container(
        padding: const EdgeInsets.only(top: 20.0, left: 20),
        child: ScopedModelDescendant<GreetingsModel>(
            builder: (context, child, model) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              greetingsText(
                  text: "${model.greeting}",
                  color: Colors.white.withOpacity(0.6)),
              SizedBox(
                height: 16,
              ),
              greetingsText(text: "${model.peopleGreeted}", color: Colors.white)
            ],
          );
        }),
      ),
    );
  }

  Text greetingsText({String? text, Color? color}) {
    return Text(
      "$text",
      style: homeGreetingsTextStyle(color),
    );
  }
}
