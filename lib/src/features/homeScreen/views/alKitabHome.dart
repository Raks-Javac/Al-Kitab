import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/enums.dart';
import '../../../shared/render/render_svg.dart';
import '../../../shared/res/res.dart';
import '../../../shared/res/theme/theme_provider.dart';
import '../../../shared/widgets/app_bar/custom_app_bar.dart';
import '../../../shared/widgets/custom_paint/TabPaint.dart';
import '../../quran/sajda/sajda.dart';
import '../../quran/surah/views/surahList.dart';
import '../widgets/greeting_widget.dart';
import '../widgets/quranquoate.dart';
import 'drawer.dart';

class AlKitabHomeView extends StatefulWidget {
  @override
  _AlKitabHomeViewState createState() => _AlKitabHomeViewState();
}

class _AlKitabHomeViewState extends State<AlKitabHomeView>
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: KWidgetsCustomAppBar(
          leadingIcon: IconButton(
            icon: RenderSvg(
              svgPath: KIcons.menuIcon,
              color: Theme.of(context).textTheme.bodyMedium!.color,
              svgHeight: 50,
              svgWidth: 50,
            ),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          title: "Al-Kitab",
        ),
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      pinned: false,
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
        child: Consumer<ThemeProvider>(builder: (context, viewModel, _) {
          return Container(
            child: Card(
              elevation:
                  viewModel.getAppTheme == AppThemeEnum.primaryMode ? 10 : 3,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: TabBar(
                indicator: CircleTabIndicator(
                    color: viewModel.getAppTheme == AppThemeEnum.primaryMode
                        ? KColors.whiteColor
                        : KColors.primaryColor,
                    radius: 3),
                unselectedLabelStyle:
                    Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: 10.sp,
                        ),
                onTap: (value) {},
                labelStyle: TextStyle(fontSize: 14),
                labelColor: Colors.white,
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  tabBarText('Surah', context),
                  tabBarText('Sajda', context),

                  // tabBarText('Juz'),
                ],
                controller: _tabcontroller,
              ),
            ),
          );
        }),
      ),
    );
  }

  Padding tabBarText(String tabText, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
      child: Text(
        '$tabText',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
