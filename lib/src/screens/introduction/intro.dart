import 'package:Al_Kitab/src/animations/TransitionAnimation.dart';
import 'package:Al_Kitab/src/animations/fadeFromBottom.dart';
import 'package:Al_Kitab/src/models/appTexts/preview.dart';
import 'package:Al_Kitab/src/screens/homeScreen/alKitabHome.dart';
import 'package:Al_Kitab/src/screens/introduction/Introduction.dart';
import 'package:Al_Kitab/src/screens/stylesheet/splashPreviewstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class AlKitabIntro extends StatefulWidget {
  AlKitabIntro({Key key}) : super(key: key);
  @override
  _AlKitabIntroState createState() => _AlKitabIntroState();
}

class _AlKitabIntroState extends State<AlKitabIntro> {
  PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;
  int numberOfPages = 3;
  PreviewClassifier pp;
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
    return Expanded(
        child: InkWell(
      onTap: () {
        homeNavigator();
      },
      onDoubleTap: () {
        homeNavigator();
      },
      child: FadeFromButtom(
        bottomwidget: Container(
          color: Theme.of(context).primaryColor,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              height: 75,
              child: Center(
                child: Text(
                  "Get Started",
                  style: getStarted,
                ),
              ),
            ),
          ),
        ),
      ),
    ));
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

  Expanded previousButton() {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton.icon(
                  onPressed: () {
                    print("prev");
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Prev",
                    style: prevButtonText,
                  )),
              nextButton,
            ],
          ),
        ),
      ),
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
                        left: 10,
                        child: Text(
                          "Al-Kitab",
                          style: getStarted.copyWith(fontSize: 30),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                              color: alignColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  topLeft: Radius.circular(30))),
                          width: 166,
                          height: 52,
                          child: Center(
                            child: Text(
                              "Get Started",
                              style: getStarted.copyWith(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: "Plight"),
                            ),
                          ),
                        ),
                      )
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
    return Navigator.pushReplacement(
        context, PreviewSlideRoute(preview: AlKitabHome(), duration: 500));
  }

  @override
  void dispose() {
    super.dispose();
    _buildIndicator();
    // previewCyclcer();
  }
}
