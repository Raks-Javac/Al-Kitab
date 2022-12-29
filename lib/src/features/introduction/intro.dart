import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/navigation/navigation_1.0.dart';
import '../../models/appTexts/preview.dart';
import '../../shared/res/res.dart';
import '../../shared/res/stylesheet/splashPreviewstyles.dart';
import '../dashboard/main_dash.dart';
import 'Introduction.dart';

class AlKitabIntroView extends StatefulWidget {
  AlKitabIntroView({Key? key}) : super(key: key);
  @override
  _AlKitabIntroViewState createState() => _AlKitabIntroViewState();
}

class _AlKitabIntroViewState extends State<AlKitabIntroView> {
  PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;
  int numberOfPages = 3;
  PreviewClassifier? pp;
  List<Widget> _buildIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < numberOfPages; i++) {
      list.add(i == currentPage ? indicator(true) : indicator(false));
    }
    return list;
  }

  Widget indicator(bool isActive) {
    return AnimatedContainer(
      margin: EdgeInsets.only(left: 6),
      duration: Duration(milliseconds: 200),
      height: 5,
      width: isActive ? 28 : 15,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            child: Column(
              children: [
                skipButton(),
                previewWidget(),
                Container(
                  height: 130,
                  color: Theme.of(context).primaryColor,
                  child: Column(
                    children: [
                      indicatorWidget(),
                      if (currentPage == 0) firstPageNextButton(),
                      if (currentPage == 1) previousButton(),
                      if (currentPage == numberOfPages - 1)
                        lastPageGStartedButton(context)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  lastPageGStartedButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        homeNavigator();
      },
      onDoubleTap: () {
        homeNavigator();
      },
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          margin: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
              color: KColors.whiteColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  topLeft: Radius.circular(30))),
          width: 166,
          height: 52,
          child: Center(
            child: Text(
              "Get Started",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: KColors.black,
                    fontSize: 17.sp,
                    fontFamily: KTypography.regularFontFamilyName,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded firstPageNextButton() {
    return Expanded(
        child: Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RawMaterialButton(
          onPressed: () {
            _pageController.nextPage(
                duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Next",
                style: prevButtonText,
              ),
              SizedBox(
                width: 12,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget previousButton() {
    // return Expanded(
    //   child: Align(
    //     alignment: Alignment.bottomCenter,
    //     child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           RawMaterialButton(
    //               onPressed: () {
    //                 print("prev");
    //                 _pageController.previousPage(
    //                   duration: Duration(milliseconds: 200),
    //                   curve: Curves.easeInOut,
    //                 );
    //               },
    //               icon: Icon(
    //                 Icons.arrow_back_ios,
    //                 color: Colors.white,
    //               ),
    //               label: Text(
    //                 "Prev",
    //                 style: prevButtonText,
    //               )),
    //           nextButton,
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    return Column(
      children: [
        SizedBox(
          height: 38,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
          child: Row(
            children: [
              Expanded(
                child: RawMaterialButton(
                  splashColor: Colors.transparent,
                  onPressed: () {
                    print("prev");
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          Text(
                            "Prev",
                            style: prevButtonText,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              nextButton,
            ],
          ),
        ),
      ],
    );
  }

  Padding indicatorWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildIndicator(),
      ),
    );
  }

  Expanded previewWidget() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.white,
        ),
        child: PageView(
          onPageChanged: (int page) {
            setState(() {
              currentPage = page;
            });
          },
          physics: ClampingScrollPhysics(),
          controller: _pageController,
          children: [
            IntroWidget(
              index: 0,
            ),
            IntroWidget(
              index: 1,
            ),
            Container(
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Container(
                  height: 300,
                  margin: EdgeInsets.only(left: 60, right: 60),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Image.asset(
                          "assets/images/quran.jpg",
                          fit: BoxFit.cover,
                          height: 300,
                        ),
                      ),
                      Positioned(
                        top: 60,
                        left: 15,
                        child: Text(
                          "Al-Kitab",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: KColors.black,
                                    fontSize: 25.sp,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget get nextButton {
    return RawMaterialButton(
      onPressed: () {
        _pageController.nextPage(
            duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Next",
            style: prevButtonText,
          ),
          SizedBox(
            width: 12,
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Container skipButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 60,
      child: Align(
        alignment: Alignment.centerRight,
        child: RawMaterialButton(
            onPressed: () {
              homeNavigator();
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text("Skip", style: skipTextStyle),
            )),
      ),
    );
  }

  homeNavigator() {
    KNavigator.navigateAndRemoveUntilRoute(MainDashBoardView());
  }

  @override
  void dispose() {
    super.dispose();
    _buildIndicator();
    // previewCyclcer();
  }
}
