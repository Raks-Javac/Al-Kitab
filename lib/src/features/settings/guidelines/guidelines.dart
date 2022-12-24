import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../models/appTexts/guide.dart';
import '../../../shared/widgets/app_bar/appBarText.dart';
import '../../../shared/widgets/app_bar/backHome.dart';

class HelpGuidelinesView extends StatelessWidget {
  final guideClass = GuideList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: BackButtonWidget(),
        toolbarHeight: 70,
        elevation: 0,
        title: BarText(
          appBarText: "Help & Guidelines",
        ),
      ),
      body: Container(
          margin: EdgeInsets.only(top: 10, bottom: 20),
          child: Stack(
            children: [
              Center(
                child: Opacity(
                  opacity: 0.4,
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              Container(
                child: AnimationLimiter(
                  child: ListView(
                    children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 400),
                      childAnimationBuilder: (widget) => SlideAnimation(
                        horizontalOffset: 55.0,
                        child: FadeInAnimation(
                          child: widget,
                        ),
                      ),
                      children: _tileList(),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  List<Widget> _tileList() {
    return guideClass
        .guideList()
        .map(
          (e) => _guideTile(
            guideText: e.guideText,
            guideTitle: e.guideTitle,
            index: e.guideIndex,
          ),
        )
        .toList();
  }

  Widget _guideTile({int? index, String? guideTitle, String? guideText}) {
    return Container(
      margin: EdgeInsets.only(left: 15, top: 20, right: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$index.  $guideTitle",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: Colors.white,
              fontFamily: "PMedium",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "$guideText",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white.withOpacity(0.9),
              fontFamily: "PLight",
            ),
          ),
        ],
      ),
    );
  }
}
