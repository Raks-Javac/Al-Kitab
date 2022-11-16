import 'package:Al_Kitab/src/models/appTexts/preview.dart';
import 'package:Al_Kitab/src/screens/stylesheet/splashPreviewstyles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IntroWidget extends StatelessWidget {
  PreviewClassifier preview = PreviewClassifier();
  int? index;
  IntroWidget({this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "${preview.previewList[index!].imgDescription}",
            height: 220,
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            width: MediaQuery.of(context).size.width / 1.4,
            child: Text(
              "${preview.previewList[index!].descriptionText}",
              textAlign: TextAlign.center,
              style: decriptionText,
            ),
          ),
        ],
      ),
    );
  }
}
