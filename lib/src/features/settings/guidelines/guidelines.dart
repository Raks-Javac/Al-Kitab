import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../models/appTexts/guide.dart';
import '../../../shared/res/res.dart';
import '../../../shared/widgets/app_bar/custom_app_bar.dart';

class HelpGuidelinesView extends StatelessWidget {
  final guideClass = GuideList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KWidgetsCustomAppBar(
        title: "Help & Guidelines",
      ),
      body: Container(
          margin: EdgeInsets.only(top: 10, bottom: 20),
          child: Stack(
            children: [
              Center(
                child: Opacity(
                  opacity: 0.2,
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
                      children: _tileList(context),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  List<Widget> _tileList(BuildContext context) {
    return guideClass
        .guideList()
        .map(
          (e) => _guideTile(
            context,
            guideText: e.guideText,
            guideTitle: e.guideTitle,
            index: e.guideIndex,
          ),
        )
        .toList();
  }

  Widget _guideTile(BuildContext context,
      {int? index, String? guideTitle, String? guideText}) {
    return Container(
      margin: EdgeInsets.only(left: 15, top: 20, right: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$index.  $guideTitle",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: KTypography.boldFontFamilyName,
                  )),
          addVerticalSpaing(10),
          Text(
            "$guideText",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 13.5.sp,
                  fontFamily: KTypography.normalFontFamilyName,
                ),
          ),
        ],
      ),
    );
  }
}
