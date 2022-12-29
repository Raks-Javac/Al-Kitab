import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/appTexts/preview.dart';
import '../../shared/res/res.dart';

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
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: KColors.black,
                    fontSize: 17.sp,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
