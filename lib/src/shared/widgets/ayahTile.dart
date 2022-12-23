import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/stylesheet/AlKitabHomeStyle.dart';
import '../res/res.dart';

class AyahTile extends StatelessWidget {
  final String? ayahEnglishName;
  final String? ayahArabicName;
  final String? ayahName;
  final int? numberOfAyah;
  final int? ayahIndex;
  final Function? onTap;
  final String? revelationType;

  const AyahTile({
    this.ayahArabicName,
    this.ayahEnglishName,
    this.ayahName,
    this.numberOfAyah,
    this.ayahIndex,
    this.revelationType,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, bottom: 20),
          child: Column(
            children: [
              ListTile(
                onTap: onTap as void Function()?,
                leading: Container(
                  height: 43,
                  width: 43,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/label.png",
                        ),
                        fit: BoxFit.cover),
                  ),
                  child: Center(
                    child: Text(
                      "$ayahIndex",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: 'PBold'),
                    ),
                  ),
                ),
                title: Text(
                  "$ayahEnglishName",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontFamily: KTypography.regularFontFamilyName,
                        fontSize: 14.sp,
                      ),
                ),
                subtitle: Text(
                  "$revelationType . $numberOfAyah VERSES",
                  style: TextStyle(
                      fontFamily: "PRegular",
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.5)),
                ),
                trailing: Text(
                  "‎$ayahArabicName‎",
                  style: TextStyle(
                      fontSize: 25,
                      color: arabicHomeColor,
                      fontFamily: "PBold"),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.15,
                child: Divider(
                  color: Colors.white.withOpacity(0.5),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
